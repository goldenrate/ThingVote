define(['services/logger', 'services/dataservice', 'config', 'services/util', 'viewmodels/members/members'],
function (logger, dataservice, config, util, members) {
    var displayName = ko.observable();
    var bio = ko.observable();


    var context = {
        Members: ko.observableArray(),
        UserFollowers: userFollowers,
        UserFollowing: userFollowing,
        UserPolls: userPolls,
        UserVotes: userVotes,
    };
    return context;

    function activate() {
        displayName(members.CurrentUser().DisplayName);
    };

});