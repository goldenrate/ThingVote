/// <reference path="../services/dataservice.js" />
define(['services/logger', 'services/dataservice', 'services/model',
    'config', 'durandal/plugins/router', 'viewmodels/polldetail'],
function (logger, dataservice, model, config, router, polldetail)
{
    var composition = require('durandal/composition');

    var app = require('durandal/app');
    var container=ko.observable();
    var pollsObservable = ko.observableArray();
    var myPolls = ko.observableArray();
    var myVotes = ko.observableArray();
    var detailScreen = ko.observable();
    var currentPoll = ko.observable();
    var initialized = false;
    var activateMasonry = ko.observable(false);
    var memberInfo = $('#globalParams').data('UserInfo');
   

    var vm = {
        activate: activate,
        deactivate:deactivate,
        title: 'Polls',
        CurrentUser: ko.observable(),
        ///
        Polls: pollsObservable,
        MyPolls: myPolls,
        MyVotes: myVotes,
        activateMasonry:activateMasonry,

        ///external initializ
        setBindingEvents: setBindingEvents,
        setMyPolls: setMyPolls,

        AddPoll: addPoll,
        refresh: refresh,
        viewAttached: viewAttached,
        afterCompose:function () {
        },
        activeScreen: detailScreen,        

        //poll details modal
        closePollDetails: closePollDetails,
        modal: ko.observable(),

        //save votes
        vote: saveVote,
        handleAfterRating: handleAfterRating,

        //animation a
        reloadMasonry: reloadMasonry,
        container: container,
        renderCounter: 0,

        //moasonry 
        itemSelector: ko.observable('.pollItem'),
        navigateToProfile: navigateToProfile,
        
        //util
        getProfileUrl: function (userId, w, h) {
            return config.appSettings.getProfilePicture(userId, w,h);
        },
        moveFromPollsToVotes: moveFromPollsToVotes,

        //#region ui 
        renderActions: renderActions
        //#endregion
    };
    return vm;

    //#region Internal Methods
    function activate(routingData) {
        if (routingData) {
            var id = parseInt(routingData.id);            
            dataservice.getPoll(id, currentPoll).done(function () {
                goToDetails(currentPoll())
            });
        }
        if (initialized) {return;}       
        vm.CurrentUser = $('#globalParams').data('UserInfo');

        //return refresh();
        return;
    }
    
    function viewAttached(view) {
        initialized = true;
        setBindingEvents(view);

    };

    function deactivate(close) {

    }

    function handleAfterRating(context, rating) {
        poll = context.$parent;
        option = context.$data;
        poll.PollResults(rating);
        var data = {
            VoteOptionID: option.OptionId(),
            ResultOwnerID: config.dnnData.userId,
            Response: poll.PollResults(),
        }
        dataservice.saveResults(option, poll, data)
            .done(moveFromPollsToVotes(poll));
    }

    function closePollDetails() {
        //vm.activatePollDetail(false);
    }

    function addPoll(objPoll) {
        vm.Polls().unshift(objPoll);
        var polls = $('#pollsContainer')
        $container.prepend(polls).masonry('reload');
    }
    //#endregion

    function navigateToProfile() {
        var poll = ko.dataFor(event.target);
        var url = config.appSettings.spaProfileUrl(poll.OwnerId(), 'Polls');
        router.navigateTo(url);
    }

    //#region handle click to view detailed description of a poll
    function goToDetails(poll, opt) {
        if (poll) {
            var context = ko.contextFor(event.target);
            polldetail.poll(poll);
            polldetail.asPopup(true);
            polldetail.modalId('pollDetails');
            //polldetail.handleAfterRating(vm.handleAfterRating);
            polldetail.parent(vm);
            detailScreen(polldetail);
            //get poll voters
            composeDetails(poll.PollId(), 30);
        };
    }

    function viewFullResults_click() {
        var context = ko.contextFor(event.target);
        var poll = context.$data;
        polldetail.poll(poll);
        polldetail.modalId('pollDetails');
        polldetail.parent(vm);
        detailScreen(polldetail);
        composeDetails(poll.PollId(), 30);
    }
    
    function composeDetails(pollid, pagesize) {
        dataservice.getVotersForPoll(pollid, pagesize).done(function (results) {
            polldetail.pollVoters(results.Voters);
            polldetail.votersLeft(results.Count - results.Voters.length);
            polldetail.totalVoters(results.Count);
            polldetail.activate(true);
            //prepare the modal 
            var element = $('#pollDetailModal')[0];
            var modalSettings = {
                model: 'viewmodels/components/modal',
                afterCompose: afterDetailCompose
            };
            composition.compose(element, modalSettings);
        });
    }
    
    function afterDetailCompose(parent, newChild, settings) {
        //the modal is in the newChild
        var modalData = settings.model;
        var modalId = 'modal_PollDetail';
        //set modal 
        $(newChild).addClass('large-modal');
        modalData.showSave(false);
        modalData.modalHeader('Poll Details');
        modalData.modalId(modalId);

        vm.modal($(newChild));
        var element = $('#modalBody', newChild)[0]
        var settings = {
            model: polldetail,
            modalId: modalId,
            afterCompose: function (parent, newChild, settings) {
                settings.model.modalId(settings.modalId);
                var readyModal = ko.utils.unwrapObservable(vm.modal());
                readyModal.addClass('');
                readyModal.modal('show');
            }
        };
        composition.compose(element, settings);
    }

    function saveVote(poll, opt) {
        var results;
        //var option = 
        if (IsAuthenticated) {
            switch (poll.PollTypeId()) {
                case 1:
                    //selection poll
                    results = opt.OptionId();
                    poll.PollResults(results);
                    break;
                case 2:
                    results = $(event.target).attr('id');
                    poll.PollResults(results);
                    break;
                default:
                    dataservice.saveResults(poll, option);
            };
            var data = {
                VoteOptionID: opt.OptionId(),
                ResultOwnerID: config.dnnData.userId,
                Response: poll.PollResults(),
            }
            dataservice.saveResults(opt, poll, data)
                .done(moveFromPollsToVotes(poll));
        } else {
            Signup();
        }
    }

    function moveFromPollsToVotes(poll) {
        vm.Polls.remove(poll);
        myVotes.push(poll);
        $('#pollsContainer').masonry('reload');
        //var pollsContainer = $('#pollsContainer');
        //pollsContainer.imagesLoaded(function () {
        //    pollsContainer.masonry(config.appSettings.pollsMasonry);
        //});
    }

    function setBindingEvents(view) {
        var root = $('.optionsList', view);
        bindEventToList(view, '.results-display p', viewFullResults_click, 'click');
        bindEventToList(view, 'li .previewImageContainer img', goToDetails, 'click');
        bindEventToList(view, 'li div.voteAction', saveVote, 'mousedown');
        //bindEventToList(view, '#previewUserInfo img', navigateToProfile, 'click');
        $(view).on('click', '#previewUserInfo img', navigateToProfile);
        //bindEventToList(view, 'li#internaRating', rate, 'click');
    }

    function setMyPolls(data) {
        myPolls(data);
    }

    function bindEventToList(rootSelector, selector, callback, eventName) {
        var eName = eventName;
        $(rootSelector).on(eName, selector, function () {
            //we get the data for the POLL DOM ELEMENT  that was clicked 
            var poll = ko.contextFor(event.target).$parent;
            var opt = ko.dataFor(this);
            var pollid = opt.PollId;
            callback(poll, opt);
            return false;
        });
    }
    //#endregion

    
    //#region ui
    function renderActions(elements, data) {
        for (var i in elements) {
            var element = elements[i];
            if (element.nodeType == 1) {
                var img = $('img', element);
            }
        }
    }
    //#endregion


    //#region DEPRECATED

    function refresh() {
        //dataservice.getAllPolls(pollsObservable);
        dataservice.getPublicPolls(pollsObservable).done(function (data) {
            var initialPolls = $.map(data.polls, function (item) { return new model.Poll(item) });
            pollsObservable(initialPolls);
            var element = $('#publicPolls')[0];
            var settings = {
                //container: vm.container(),
                model: vm,
                view: 'views/poll/publicPolls.html',
                beforeBind: function (elem, v, st) { },
                afterCompose: function (p, nc, st) {
                    var $poll = $(nc);
                    //st.container.append($poll);
                    //st.container.append($poll).masonry('appended', $poll, true);
                }
            };
            composition.compose(element, settings);
        });
    }

    function reloadMasonry(elements, data) {
        var boxes = $('#publicPolls')[0];
        var cont = container();
        for (var i in elements) {
            var element = elements[i];
            if (element.nodeType == 1) {
                //append it to masonry 
                var context = ko.contextFor(element);
                var vm = context.$root;
                vm.renderCounter++;
                var length = vm.Polls().length;
                var s = config.appSettings.pollsPageSize;
                var applyMasonry = (vm.renderCounter%s == 0) || vm.renderCounter == length;
                if (applyMasonry) {
                    cont.imagesLoaded(function () {
                        cont.masonry({
                            itemSelector: '.pollItem',
                            columnWidth: 244,
                            isAnimated: true,
                            isFitWidth: true,
                            isResizable: true
                        });
                    });
                    //setTimeout(function myfunction() {
                    //    cont.masonry('reload');
                    //}, 300);
                }                   
            }
        }
        
    }
    //#endregion
});