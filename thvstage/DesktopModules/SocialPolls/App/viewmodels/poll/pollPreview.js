/// <reference path="../services/dataservice.js" />
/**/
define(['services/logger', 'services/dataservice',
    'services/model', 'config', 'durandal/plugins/router', 'viewmodels/polls'],
function (logger, dataservice, model, config, router, polls) {
    var app = require('durandal/app');
    var poll = ko.observable()
    var initialized = false;
    //var profilePictureUrl = 

    var pollpreview = {
        title: 'PollPreview',
        UserProfilePictureUrl:config.CurrentUser.ProfilePictureUrl,
        poll: poll,

        //the url for the option with most votes 
        LeadingOptionUrl: ko.observable(),

        activate: activate = function (routeDate) {
            //var id = parseInt(routeDate.id);
            //var poll = polldetail.poll;
            //var p = dataservice.getPoll(id, poll).done(function (data) {
            //    //get the results for the poll 
            //});
            //here we call the dataservices for the session 
        },
      
        viewAttached: viewAttached
    };
    return pollpreview;

    
    function viewAttached(view) {
        //bindEventToList(view, '.result-image li', changeMainImage);
        
    }

    function bindEventToList(rootSelector, selector, callback, eventName) {
        var ename = eventName || 'mouseover';
        $(rootSelector).on(ename, selector, function () {
            return false;
        });
    }

    function refresh() {
        return dataservice.getAllPolls(pollsObservable);
    }

    //#endregion
});