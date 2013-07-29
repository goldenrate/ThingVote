/// <reference path="../services/dataservice.js" />
define(['services/logger',
    'services/dataservice',
    'services/model',
    'config', 'services/util', 'viewmodels/shell',
    'viewmodels/components/modal',
    'services/dataservice/ds.user',
    'durandal/plugins/router',
],
function (logger, dataservice, model, config, util, shell,
    currentModal, userds,router) {
    var self = this;
    var opts = $.extend({}, config.membersDefaultSettings, config.dnnMembersSettings);

    var app = require('durandal/app');
    var composition = require('durandal/composition');
    //var editProfile = require('viewmodels/profile/editprofile');
    var samlluserpic = ko.observable();
    var initialized = false;
    var initializedCreate = ko.observable(false);
    var profileViewsPath = 'viewmodels/profile/';
    var currentUser = ko.observable();
    var ntfsCount = ko.observable();

    var modal = ko.observable();
    var modalView = ko.observable();
    var activateModal = ko.observable(false);

    //edit poll
    var categories = ko.observableArray();
    var types = ko.observableArray();
    var pollBlueprint = ko.observable();

    var topnav = {
        activate: activate,
        title: 'topnav',
        refresh: refresh,
        router: shell.router,
        open: function () {
            var sender = $(event.target);
            sender.parent().addClass('open');
        },
        close: function () {
            var sender = $(event.target);
            sender.parent().removeClass('open');
        },

        ///current user
        CurrentUser: ko.observable(),
        userUrl: samlluserpic,
        logout: logout,

        //notifications
        ntfsCount: ntfsCount,
        getNotificationsCount: ko.computed(function () {
            if (!initialized) {
                var t = $("[id*='dnnUser_notificationLink'] span").text();
                if (t == '') {
                    ntfsCount(0);
                }
                else {
                    ntfsCount(parseInt(t));
                }
            }
            return ntfsCount();
        }),
        gotoNotifications:function () {
            var s = '/#/my/{0}/{1}';
            var url = s.replace('{0}', this.CurrentUser().UserId()).replace('{1}', 'Notifications');
            shell.router.navigateTo(url);
        },
        goToUser:function (tabname) {
            var s = '/#/my/{0}/{1}';
            var url = s.replace('{0}', this.CurrentUser().UserId()).replace('{1}', tabname);
            return url;
        },


        //modal 
        Modal: modal,
        ModalView: modalView,
        ActivateModal: activateModal,
        viewAttached: viewAttached,

        //create modal 
        showCreateModal: showCreateModal,
        
        pollTypes: ko.observable(),

        //select category
        categories: ko.observable(),
        selectedCategories: ko.observable(),
        popupCategorySelector:popupCategorySelector,

        //most popular
        byPopular: ko.observable(false),
        applyPopular: function () {
            this.byPopular(true);
        },

        //search
        searchTerm: ko.observable(),
        searchResults: ko.observable(),
        onEnterbasicSearch: function () {
            if (arguments[1].keyCode == 13) {
                searchPoll();
            }
        },
        basicSearch: searchPoll,
        inviteFriends: function () {
            var FB = $('#fb-root').data('facebookObj').FB;
            if (FB) {
                FB.ui({
                    method: 'apprequests',
                    title: 'Invite friends to help you make decisions',
                    message: 'Hi you have to check this next big thing!' +
                        'it helps you make decisions',
                }, fbCallback);
            }
            function fbCallback(response) {
                console.log(response);
            }
        }
    };
    return topnav;    

    //#region user menu methods
    function showUserModal(controlName) {
        //compose the modal
        var element = $('#topnavModal')[0];
        var modalSettings = {
            controlName: controlName,
            model: 'viewmodels/components/modal',
            afterCompose: composeUserControl
        };
        composition.compose(element, modalSettings);
    }

    function composeUserControl(parent, modal, settings) {
        var modalData = settings.model;
        modalData.modalId('modal_' + settings.controlName);
        $(modal).addClass('medium-modal');
        modalData.showClose(false);
        modalData.activate(true);
        var element = $('#modalBody', modal)[0];
        var ctrlSettings = {
            modal: modal,
            model: loadEditControl(settings.controlName),
            modalData: modalData,
            controlName: settings.controlName,
            modalId: modalData.modalId(),
            afterCompose: function (p, nc, st) {
                st.model.activate(true);
                st.model.hostModal(st.modalData)
                st.modalData.modalHeader(st.model.title);
                st.modalData.saveHandler(st.model.onSaveHandler);
                $(st.modal).modal('show');
            }
        };
        composition.compose(element, ctrlSettings);
    }

    function loadEditControl(menuId) {
        if (!menuId) { return };
        switch (menuId.toLowerCase()) {
            case 'editprofile':
                return 'viewmodels/profile/editprofile';
            case 'editsettings':
                return 'viewmodels/profile/editsettings';
            case 'editaccount':
                return 'viewmodels/profile/editaccount';
                break;
            case 'logout':
                break;
            case 'inviteFriends':
                //return 'viewmodels/inviteFacebook';
                break;
            default:
        }
    }

    function logout() {
        var dnnLogout = config.dnnData.userLogin;
        return $('a', dnnLogout).attr('href');
    }
    //#endregion

    //#region Internal Methods
    //parent is the shell that activates 
    function activate(parent) {
        self = this;
        if (initialized) { return; }
        initialized = true;
        //////currentUser = $('#globalParams').data('UserInfo');
        samlluserpic(util.getProfilePicture(config.dnnData.userId, 30, 30));
        if (parent.MemberInfo()) {
            parent.MemberInfo().PhotoURL.subscribe(function (value) {
                //var url = util.getProfilePicture(config.dnnData.userId, 30, 30)
                samlluserpic(value);
            });
        }
    }

    function refresh() {
        return dataservice.getAllPolls(pollsObservable);
    }

    function navigateTo(url) {
        router.navigateTo(url);
    }

    function viewAttached(view) {
        bindUserMenuModalCall(view, '#user-menu li a.user-menu-link',
            showUserModal, 'mousedown');
    }

    function bindUserMenuModalCall(rootSelector, selector, callback, eventName) {
        $(rootSelector).on(eventName, selector, function () {
            //we get the data for the POLL DOM ELEMENT  that was clicked 
            var sender = $(event.target);
            var id = sender.attr('id');
            callback(id);
            return false;
        });
    }
    //#endregion

    //#region edit poll
    ///Depricated. see show create modal 
    function showCreateModalWizard() {
        var element = $('#topnavModal')[0];
        var settings = {
            model: 'viewmodels/create',
            beforeBind: function (elem, view, st) {
                if (st.model.IsDirty()) {
                    return;
                }
            },
            afterCompose: function (p, nc, st) {
                st.model.activate(true, nc);
                $(nc).modal('show');
            }
        }
        composition.compose(element, settings);
    }

    function showCreateModal() {
        if (!initializedCreate()) {
            dataservice.initNewPoll(pollBlueprint).done(function () {
                //the default is select poll
                pollBlueprint().setTypeRelatedProperties(1);
                pollBlueprint().IsSelectionPoll(true);
                dataservice.getWizardData(categories, types).done(function () {
                    composeEditPollModal();
                });
            });
        } else {
            composeEditPollModal()
        }
    }

    function composeEditPollModal() {
        var element = $('#topnavModal')[0];
        var modalSettings = {
            model: 'viewmodels/components/modal',
            beforeBind: beforeEditpollBind,
            afterCompose: function (p, nc, st) {
                //$(nc).modal('show');
            }
        };
        composition.compose(element, modalSettings);
    }

    function beforeEditpollBind(elem, view, st) {
        $(view).addClass('large-modal create-poll-modal');
        st.model.modalHeader(config.localization.createPoll.header);
        st.model.showFooter(false);
        st.model.showClose(false);
        var element = $('#modalBody', view)[0];
        var settings = {
            HostModal: view,
            model: 'viewmodels/poll/editpoll',
            view: 'views/poll/editpoll',
            beforeBind: function (elem, view, st) {
                if (!initializedCreate()) {
                    //subsctribe to IsDirty 
                    st.model.IsDirty.subscribe(function (isdirty) {
                        initializedCreate(isdirty);
                    });
                    st.model.Modal(st.HostModal);
                    st.model.Poll = pollBlueprint;
                    st.model.PollCategories = categories;
                    st.model.PollTypeList = types;
                    st.model.UserProfilePictureUrl(self.CurrentUser().FirstName());
                    st.model.UserProfilePictureUrl(self.CurrentUser().ProfilePictureUrl());
                    st.model.DisplayName(self.CurrentUser().DisplayName());
                }
                if (st.model.Poll().IsSelectionPoll()) {
                    st.model.tnMaxHeight(config.thumbnail.prevSelect.h);
                    st.model.tnMaxWith(config.thumbnail.prevSelect.w);
                } else {
                    st.model.tnMaxHeight(config.thumbnail.prevOthers.h);
                    st.model.tnMaxWith(config.thumbnail.prevOthers.w);
                };
            },
            afterCompose: function (p, nc, st) {
                initializedCreate(st.model.IsDirty());
                $(st.HostModal).modal('show');
            }
        };
        composition.compose(element, settings);
    }
    //#endregion
        
    //#region category
    function popupCategorySelector(view) {
        var element = $('#categorySelector')[0];
        var settings = {
            model: 'viewmodels/components/modal',
            beforeBind: beforeCategoriesBind
        }
        composition.compose(element, settings);
    };

    function beforeCategoriesBind(elem, view, st) {
            $(view).addClass('large-modal create-poll-modal');
            st.model.modalHeader('select category');
            st.model.showFooter(true);
            st.model.showClose(false);
           // var categories = $(config.appSettings.storage).data(config.appSettings.globals.editpoll.cat);            
            if (!topnav.categories()) {
                dataservice.getWizardData(topnav.categories, topnav.pollTypes).done(function (data) {

                })
            }
            var element = $('#modalBody', view)[0];
            var settings = {
                ModalData: st.model,
                HostModal: view,
                model:  {
                    PollCategories: topnav.categories
                },
                view: 'views/poll/categorySelector.html',
                afterCompose: function (p, nc, st) {
                    st.ModalData.saveHandler = function () {
                        var mod = st.model.PollCategories();
                        var selectedCats = {};
                        var count = 0;
                        var catsids = '';
                        for (prop in mod) {
                            if (mod.hasOwnProperty(prop)) {
                                if (mod[prop].isSelected()) {
                                    var catid = mod[prop].CategoryID();
                                    catsids = catsids + catid + '&';
                                    var catname = mod[prop].Name();
                                    selectedCats[catname] = catid;
                                    count++;
                                }
                            }
                        }                        
                        $(st.HostModal).modal('hide');
                        topnav.selectedCategories(catsids);
                        //if(count >0){
                        //    router.navigateTo('/#/index/byCategory/' + catsids);
                        //} else {
                        //    router.navigateTo('/#/index');
                        //}
                    }
                    $(st.HostModal).modal('show');
                }
            }
            composition.compose(element, settings);
    };

    function saveCategories(model) {
        
    }
    //#endregion 

    //#region search
    function searchPoll() {
        var term = topnav.searchTerm();
        dataservice.basicSearch(term).done(function (data) {
            topnav.searchResults(data);
            $(event.target).val('')
        });
    }
    //#endregion 


});