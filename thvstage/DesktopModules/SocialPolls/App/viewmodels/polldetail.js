/// <reference path="../services/dataservice.js" />
define(['services/logger', 'services/dataservice',
    'services/model', 'config', 'durandal/plugins/router'],
function (logger, dataservice, model, config, router) {
    var userId;
    var app = require('durandal/app');

    var currentPoll = ko.observable()
    ; var selectedOption = ko.observable();
    var _mainImageUrl = ko.observable();
    var initialized = false;
    var pollDetailView = ko.observable();

    var currentView = ko.observable();
    var pollVoters = ko.observableArray();

    var parent = ko.observable();
   
    //var profilePictureUrl = 
    var ratingOptions = {
        isDisplay: ko.observable(true), //true if the control is used to display rating 
        selectedStars: ko.observable(),//the number of stars we select 
    };

    var polldetail = {
        PollDetailView: pollDetailView,
        title: 'Detailed View',
        goBack: goBack,
        
        parent:parent,
        poll: currentPoll,       

        //events
        changeMainImage: changeMainImage,
        activate: activate,
        viewAttached: viewAttached,
        UserProfilePictureUrl: ko.observable(),
        isActive: ko.observable(),       

        mainImageUrl: _mainImageUrl,
        ratingOptions: ratingOptions,
        currentView: currentView,
        flag : function () {
            dataservice.flagPoll(currentPoll().PollId()).done(function (data) {

            });
        },

        //members
        pollVoters: pollVoters,
        votersLeft: ko.observable(),
        totalVoters: ko.observable(),
        spaProfileUrl: function (userId) {
            return config.appSettings.spaProfileUrl(userId);
        },
        //modal
        modalId: ko.observable(),
        modal: ko.observable(),
        asPopup: ko.observable(false),

        canViewResults: ko.observable(false),

        //handle saveVote
        selectedOption: selectedOption,
        saveVote:saveVote,      
        getProfileUrl : function (userId, w, h) {
            return config.appSettings.getProfilePicture(userId, w,h);
        },
        handleAfterRating: function (context, rating) {
            currentPoll().PollResults(rating);
            saveVote(currentPoll())
        }
    };
    return polldetail;

    function activate(routingData) {
        if (!polldetail.asPopup()) {
            var id = parseInt(routingData.id);
            var poll = ko.observable();
            dataservice.getPoll(id, poll).done(function () {
                currentPoll(poll());
                var results = poll().Voters();
                polldetail.pollVoters(results.Voters);
                polldetail.votersLeft(results.Count - results.Voters.length);
                polldetail.totalVoters(results.Count);
                initPollDetails();
            });
        } else {
            initPollDetails();
        } 
    }

    function initPollDetails() {
        _mainImageUrl(polldetail.poll().LeadingOptionUrl());
        //set up the selected option to be the one with the 
        //same leadingoptionurl
        var opt = $.grep(polldetail.poll().PollOptions(), function (obj, ind) {
            return obj.OptionImageUrl() == _mainImageUrl();
        });
        polldetail.selectedOption(opt[0]);
        polldetail.poll().IsBoolPoll()
            ? currentView('poll/boolPollDetail')
            : currentView('');
        polldetail.UserProfilePictureUrl = polldetail.poll().OwnerPhotoUrl();
        canViewResults(config.dnnMembersSettings.userId);
    }

    //returns to the last view we came from
    //if modal is used then it simply closes the modal 
    function goBack() {
        router.navigateBack();
    }

    ///bind hover event
    function changeMainImage() {
        var sender = event.target;
        var option = ko.dataFor(sender);
        var poll = ko.contextFor(sender).$parent;
        if (event.type == 'mousedown'){
            polldetail.selectedOption(option);
        }
        _mainImageUrl(option.OptionImageUrl());

        //change styles
        if (event.type == 'click') {
            $(event).toggleClass('selected');
        }    
    }

    function saveVote(poll) {       
        var results;
        //var option = 
        switch (poll.PollTypeId()) {
            case 1:
                //selection poll
                var result = selectedOption().OptionId();
                currentPoll().PollResults(result);
                break;
            case 2:
                results = $(event.target).attr('id');
                poll.PollResults(results);
                break;
            case 3:
                break;
        };
        parent().Polls.remove(currentPoll());
        parent().MyVotes.push(currentPoll());
        dataservice.saveResults(selectedOption(),currentPoll).done(function (data) {           
            polldetail.canViewResults(true);
            var n = polldetail.totalVoters() + 1;
            polldetail.totalVoters(n);
            polldetail.pollVoters.push($('#globalParams').data('UserInfo').UserId());
            $('#pollsContainer').masonry('reload');
            
        });
    }

    function viewAttached(view) {      
        bindEventToList(view, '.result-image li', changeMainImage, 'mouseover mousedown');
        bindEventToList(view, '#pollVoters ul li a img', goToUserUrl, 'click');
        //bindEventToList(view, '.result-image li', changeMainImage, 'click');
        $('#' + polldetail.modalId()).modal();
        pollDetailView(view);

        //add this 
        var addthis_config = { "data_track_addressbar": true };
    }

    function goToUserUrl() {
        var profileUrl = config.appSettings.spaProfileUrl(arguments[0].UserId);
        $('#' + polldetail.modalId()).modal('hide');
        router.navigateTo(profileUrl);
        //polldetail.poll([]);
    }

    function bindEventToList(rootSelector, selector, callback, eventName) {
        $(rootSelector).on(eventName, selector, function () {
            var option = ko.dataFor(this);
            callback(option);
            return false;
        });
    }

    function refresh() {
        return dataservice.getAllPolls(pollsObservable);
    }
    
    //return true if the current user can view the results 
    //for this poll
    function canViewResults(userId) {
        var canView = false;
        //case 1: the user is the owner 
        canView = (userId == polldetail.poll().OwnerId());
        polldetail.canViewResults(canView);
        if (canView) { return };

        //case 2: the user is not the owner but has voted for this poll 
        var res = $.grep(pollVoters(), function (id, index) {
            return id == userId;
        });
        canView = res.length > 0;
        polldetail.canViewResults(canView)
    }

    //#endregion
});