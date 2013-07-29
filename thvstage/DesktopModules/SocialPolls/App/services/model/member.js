define(['services/logger', 'services/dataservice', 'config',
    'services/util'],
function (logger, dataservice, config, util) {

    var member = {
        Member: init
    }
    return member;

    function init(item) {
        var self = member;
        self.AddFriendText = opts.addFriendText;
        self.AcceptFriendText = opts.acceptFriendText;
        self.FriendPendingText = opts.friendPendingText;
        self.RemoveFriendText = opts.removeFriendText;
        self.FollowText = opts.followText;
        self.UnFollowText = opts.unFollowText;
        self.SendMessageText = opts.sendMessageText;
        self.UserNameText = opts.userNameText;
        self.EmailText = opts.emailText;
        self.CityText = opts.cityText;

        self.UserId = ko.observable(item.MemberId);
        self.LastName = ko.observable(item.LastName);
        self.FirstName = ko.observable(item.FirstName);
        self.UserName = ko.observable(item.UserName);
        self.DisplayName = ko.observable(item.DisplayName);
        self.Email = ko.observable(item.Email);

        self.IsUser = ko.observable(item.MemberId == viewerId);

        self.IsAuthenticated = (viewerId > 0);

        //Friend Observables
        self.FriendStatus = ko.observable(item.FriendStatus);
        self.FriendId = ko.observable(item.FriendId);

        self.IsFriend = ko.computed(function () {
            return self.FriendStatus() == 2;
        }, this);

        self.IsPending = ko.computed(function () {
            return self.FriendStatus() == 1 && self.FriendId() != viewerId;
        }, this);

        self.HasPendingRequest = ko.computed(function () {
            return self.FriendStatus() == 1 && self.FriendId() == viewerId;
        }, this);

        //Following Observables
        self.FollowingStatus = ko.observable(item.FollowingStatus);

        self.IsFollowing = ko.computed(function () {
            return self.FollowingStatus() == 2;
        }, this);

        //Follower Observables
        self.FollowerStatus = ko.observable(item.FollowerStatus);

        self.IsFollower = ko.computed(function () {
            return self.FollowerStatus() == 2;
        }, this);

        //Computed Profile Observables
        self.City = ko.observable(item.City);
        self.Title = ko.observable(item.Title);
        self.Country = ko.observable(item.Country);
        self.Phone = ko.observable(item.Phone);
        self.Website = ko.observable(item.Website);
        self.PhotoURL = ko.observable(item.PhotoURL);
        self.ProfileProperties = ko.observable(item.ProfileProperties);

        self.Location = ko.computed(function () {
            var city = self.City();
            var country = self.Country();
            var location = (city != null) ? city : '';
            if (location != '' && country != null && country != '') {
                location += ', ';
            }
            if (country != null) {
                location += country;
            }

            return location;
        });

        self.ProfileUrl = ko.computed(function () {
            return profileUrl.replace(profileUrlUserToken, self.UserId().toString());
        }, this);

        self.getProfilePicture = function (w, h) {
            return profilePicHandler.replace("{0}", self.UserId()).replace("{1}", h).replace("{2}", w);
        };

        //Actions
        self.acceptFriend = function () {
            $.ajax({
                type: "POST",
                cache: false,
                url: baseServicepath + 'AcceptFriend',
                beforeSend: serviceFramework.setModuleHeaders,
                data: { friendId: self.UserId }
            }).done(function (data) {
                if (data.Result === "success") {
                    self.FriendStatus(2);
                } else {
                    displayMessage(settings.serverErrorText, "dnnFormWarning");
                }
            }).fail(function (xhr, status) {
                displayMessage(settings.serverErrorWithDescriptionText + status, "dnnFormWarning");
            });
        };

        self.addFriend = function () {
            $.ajax({
                type: "POST",
                cache: false,
                url: baseServicepath + 'AddFriend',
                beforeSend: serviceFramework.setModuleHeaders,
                data: { friendId: self.UserId }
            }).done(function (data) {
                if (data.Result === "success") {
                    self.FriendStatus(1);
                    self.FriendId(self.UserId);
                } else {
                    displayMessage(settings.serverErrorText, "dnnFormWarning");
                }
            }).fail(function (xhr, status) {
                displayMessage(settings.serverErrorWithDescriptionText + status, "dnnFormWarning");
            });
        };

        self.follow = function () {
            $.ajax({
                type: "POST",
                cache: false,
                url: baseServicepath + 'Follow',
                beforeSend: serviceFramework.setModuleHeaders,
                data: { followId: self.UserId }
            }).done(function (data) {
                if (data.Result === "success") {
                    self.FollowingStatus(2);
                } else {
                    displayMessage(settings.serverErrorText, "dnnFormWarning");
                }
            }).fail(function (xhr, status) {
                displayMessage(settings.serverErrorWithDescriptionText + status, "dnnFormWarning");
            });
        };

        self.removeFriend = function () {
            $.ajax({
                type: "POST",
                cache: false,
                url: baseServicepath + 'RemoveFriend',
                beforeSend: serviceFramework.setModuleHeaders,
                data: { friendId: self.UserId }
            }).done(function (data) {
                if (data.Result === "success") {
                    self.FriendStatus(0);
                } else {
                    displayMessage(settings.serverErrorText, "dnnFormWarning");
                }
            }).fail(function (xhr, status) {
                displayMessage(settings.serverErrorWithDescriptionText + status, "dnnFormWarning");
            });
        };

        self.unFollow = function () {
            $.ajax({
                type: "POST",
                cache: false,
                url: baseServicepath + 'UnFollow',
                beforeSend: serviceFramework.setModuleHeaders,
                data: { followId: self.UserId }
            }).done(function (data) {
                if (data.Result === "success") {
                    self.FollowingStatus(0);
                } else {
                    displayMessage(settings.serverErrorText, "dnnFormWarning");
                }
            }).fail(function (xhr, status) {
                displayMessage(settings.serverErrorWithDescriptionText + status, "dnnFormWarning");
            });
        };
    };

});