define(['services/logger', 'services/dataservice', 'config','services/util'],
function (logger, dataservice, config, util) {

    notificationvm = {
        Notification: notification,
        NotificationAction: notificationAction
    };
    return notificationvm;

    function notificationAction(data, notificationId) {
        var self = this;

        self.NotificationId = notificationId;
        self.Name = data.Name;
        self.Description = data.Description;
        self.Confirm = data.Confirm;
        self.APICall = data.APICall;
    }


    function notification(data) {
        var self = this;

        self.NotificationId = data.NotificationId;
        self.Subject = data.Subject;
        self.From = data.From;
        self.Body = data.Body;
        self.SenderAvatar = data.SenderAvatar;
        self.SenderProfileUrl = config.appSettings.spaProfileUrl(getInitiatorId(self.Body), 'Polls');//data.SenderProfileUrl;
        self.DisplayDate = data.DisplayDate;
        self.Actions = $.map(data.Actions,
            function (action) { return new notificationAction(action, data.NotificationId); });
        self.canFollow = canFollow(data);
    }

    function getInitiatorId(source) {
        var href = $(source).attr('href');
        var arr = href.split('/');
        return arr[arr.length - 1];
    }

    function canFollow(data) {
        //search for "follow back action"
        var action = $.grep(data.Actions, function (e) {
            return e.Name == 'Follow Back';
        });
        if (action.length > 0)
            return true;
        else
            return false;
    };

});