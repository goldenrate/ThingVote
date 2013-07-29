define(['services/logger', 'services/dataservice', 'config', 'services/util', 'viewmodels/members/members'],
function (logger, dataservice, config, util, members) {
    var opts = $.extend({}, config.membersDefaultSettings,
       config.dnnMembersSettings);

    var displayName = ko.observable();
    var bio = ko.observable();
    var firstName = ko.observable();
    var lastName = ko.observable();
    var displayName = ko.observable();
    var profilePic = ko.observable();

    var profile = {
        CurrentUser: ko.observable(),
        FirstName: firstName,
        LastName: lastName,
        DisplayName: displayName,
        Bio: bio,
        ProfilePicture: profilePic,

        //handlers
        activate: activate
    };
    return profile;

    function activate(routeData) {
        var uid = parseInt(routeData.userid) ? userId(parseInt(routeData.userid))
            : userId(config.dnnData.userId);

        dataservice.getMember(uid).done(function (data) {
            var initialMember = new model.Member(data[0], opts);
            profile.CurrentUser(initialMember);
            displayName(initialMember.DisplayName());
            firstName(initialMember.FirstName);
            lastName(initialMember.LastName());
            bio(initialMember.Bio());
            profilePic(initialMember.ProfilePictureUrl());
        });
    };

});