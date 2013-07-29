define(['services/logger', 'services/dataservice', 'services/model',
    'config', 'durandal/plugins/router', 'viewmodels/polls'],
function (logger, dataservice, model, config, router, polls) {
    var opts = $.extend({}, config.membersDefaultSettings, config.dnnMembersSettings);
    var shell = require('viewmodels/shell');
    var composition = require('durandal/composition');

    var initialized = false;
    var initializedMyVotes = false;

    var initializedMyPolls = false;
    var myPollsComposition = ko.observable();
    var initialMyPollsArr;

    var activeTab = ko.observable();
    var myPollsView = ko.observable();
    var myVotesView = ko.observable();
    var myPolls = ko.observableArray();
    var member = ko.observable();
    var viewerIsOwner = ko.observable();
    var profilePictureUrl = ko.observable();
    var displayName = ko.observable();
    var userId = ko.observable();

    my = {
        activate: activate,
        viewAttached: viewAttached,
        view: ko.observable(),
        Member: ko.observable(),// $('#globalParams').data('UserInfo'),
        DisplayName: displayName,
        ViewerIsOwner: viewerIsOwner,
        //profilePictureUrl: profilePictureUrl,
        IsUser: ko.computed(function () {
            if (!userId()) { return; }
            return (userId() == config.dnnData.userId) ? true : false;
        }),
        CurrentUser: ko.observable(),

        //tabs manager
        ActiveTab: activeTab,
        setActiveTab: setActiveTab,
        MyPollsView: myPollsView,
        MyVotesView: myVotesView,

        //my votes        
        MyVotes: polls.MyVotes,
        mvInitialized: false,
        //MyPolls
        MyPolls: myPolls,

    };
    return my;

    function activate(routeData) {
        //if (initialized) { return; }
        //initialized = true;
        if (routeData.userid) {
            userId(routeData.userid);
            dataservice.getPollMember(userId()).done(function (data) {
                my.Member(new model.Member(data[0], opts));               
            });
        } 
        parseInt(routeData.userid) ? userId(parseInt(routeData.userid))
            : userId(config.dnnData.userId);
        var href = '#';
        routeData.tab ? href += routeData.tab : href += 'polls';
        var selector = '#tabs-nav-container a[href="' + href + '"]';
        activeTab(selector);

        initializedMyPolls = false;
        initializedMyVotes = false;
    };

    function refresh() {
        dataservice.getPollsCreatedByUser(myPolls, config.dnnData.userId)
            .done(function (data) {
                //myPolls(data);
            });
    }

    function viewAttached(view) {
        my.view(view);
        setBindingEvents(view);

        $('a[data-toggle="tab"]', view).on('shown', function (e) {
            e.target // activated tab
            e.relatedTarget // previous tab
            setActiveTab(activeTab());
        })

        if (!activeTab()) {
            var selector = '#tabs-nav-container a:first';
            activeTab(selector);
            initialized = true;
            loadMyPollsTab();
        } else {
            goToTab()
        }
    };

    function goToTab(view) {
        //setActiveTab(activeTab());
        $(activeTab()).tab('show');
    };

    function setActiveTab(selector) {
        var href = $(selector).attr('href');
        var element = $(href)[0];
        var settings = {};
        var compose = true;
        switch (href) {
            case '#Votes':
                loadMyVotesTab();
                activeTab(selector);
                compose = false;
                break;
            case '#Polls':
                loadMyPollsTab();
                activeTab(selector);
                compose = false;
                break;
            case '#Followers':
                var settings = {
                    view: 'views/members/myfollowers',
                    model: 'viewmodels/members/members',
                    afterCompose: afterMembersCompose,
                    ajaxAction: 'GetFollowers',
                    members: 'Followers',
                    selector: selector
                };
                break;
            case '#Following':
                var settings = {
                    view: 'views/members/myfollowing',
                    model: 'viewmodels/members/members',
                    afterCompose: afterMembersCompose,
                    ajaxAction: 'GetFollowing',
                    members: 'Following',
                    selector: selector
                };
                break;
            case '#Notifications':
                var settings = {
                    model: 'viewmodels/notifications/notifications',
                    selector: selector,
                    afterCompose: function (p, nc, st) {
                        st.model.activate(true);
                        activeTab(st.selector);
                        goToTab();
                    },
                };
                break;
            default:
                activeTab(selector);
                break;
        }
        if (compose) { composition.compose(element, settings) };
        goToTab();

    };

    function afterMembersCompose(parent, newChild, settings) {
        dataservice.getMembersByRelationship(settings.ajaxAction, userId()).done(function (data) {
            var initialMembers = $.map(data, function (item) {
                return new model.Member(item, opts);
            });
            settings.model[settings.members](initialMembers);
            settings.model.activate(true);
            activeTab(settings.selector);
            goToTab();
        });
    }

    function loadMyVotesTab() {
        var element = $('#Votes', ko.utils.unwrapObservable(my.view()))[0];

        polls.itemSelector('.pollItem');
        if (!initializedMyVotes) {
            initializedMyVotes = true;
            var mvCompSettings = {
                view: 'views/poll/myvotes.html',
                model: 'viewmodels/polls',
                afterCompose: afterMyVotesCompose,
                beforeBind: function (elem, view, st) {
                    st.model.setBindingEvents(view);
                }
                //cacheViews: true
            };
            dataservice.getVotesForUser(myPolls, userId()).done(function (data) {
                var initialMyVotes = $.map(data, function (item) { return new model.Poll(item) });
                polls.MyVotes(initialMyVotes);
                composition.compose(element, mvCompSettings);
            });
            //composition.compose(element, mvCompSettings);

        } else {

        }
    }

    function loadMyPollsTab() {
        var element = $('#Polls', ko.utils.unwrapObservable(my.view()))[0];
        if (!initializedMyPolls) {
            initializedMyPolls = true;
            var mpSettings = {
                //cacheViews:true,
                view: 'views/poll/mypolls.html',
                model: 'viewmodels/polls',
                afterCompose: afterMyPollsCompose,
                beforeBind: function (elem, view, st) {
                    st.model.setBindingEvents(view);
                }
            };

            polls.itemSelector('.pollItem');
            dataservice.getPollsCreatedByUser(myPolls, userId()).done(function (data) {
                var initPolls = $.map(data, function (item) { return new model.Poll(item) });
                polls.MyPolls(initPolls);
                composition.compose(element, mpSettings);
                //goToTab();
            });
        } else {
            //$(element).append(ko.utils.unwrapObservable(myPollsComposition));
        }
    }

    function afterMyVotesCompose(parent, newChild, settings) {
        var $container = $('#votesContainer', parent);
        initMasonry($container);
    }

    function afterMyPollsCompose(parent, newChild, settings) {
        var $container = $('#pollsContainer', parent);
        //myPollsComposition(newChild)
        initMasonry($container);
    }

    function initMasonry($container) {
        $container.imagesLoaded(function () {
            $container.masonry(config.appSettings.pollsMasonry);
        });
    }

    function setBindingEvents(view) {
        bindEventToTab(view, '#tabs-nav-container a[data-toggle="tab"]', setActiveTab, 'click');
    }

    function bindEventToTab(rootSelector, selector, callback, eventName) {
        $(rootSelector).on(eventName, selector, function () {
            //we get the data for the POLL DOM ELEMENT  that was clicked 
            var sender = $(event.target);
            var href = sender.attr('href');
            var selector = '#tabs-nav-container a[href="' + href + '"]';
            callback(selector);
            return false;
        });
    }


});