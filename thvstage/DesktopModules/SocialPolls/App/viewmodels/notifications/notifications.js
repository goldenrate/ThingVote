define(['services/logger', 'services/dataservice/ds.notification', 'services/model/model.notification',
    'config', 'durandal/plugins/router','viewmodels/topnav'],
function (logger, dataservice, model, config, router, topnav) {
    var _notifications = ko.observableArray([]);

    notifications = {
        activate: activate,
        notifications: _notifications,
        TotalNotifications: ko.observable(0),
        loadingData: ko.observable(false),
        getNotificationPageNumbers: getNotificationPageNumbers,
        hideNotification: hideNotification,
        performNotificationAction: performNotificationAction, 
        isLastNotificationAction: isLastNotificationAction,

        //actions
        dismissNotification: dismissNotification,
        followBack: followBack,
        loadMore: loadMoreNotifications,
        updateCount: updateCount
    };
    return notifications;

    function activate() {
        //fill notifications
       
        dataservice.loadNotifications(_notifications, notifications.loadingData,
            notifications.TotalNotifications);
        notifications.TotalNotifications.subscribe(function (value) {
            topnav.ntfsCount(value);
        })
        
    }
    function loadMoreNotifications() {
        dataservice.loadMoreNotifications(_notifications, 10,
               notifications.TotalNotifications);
    }

    function getNotificationPageNumbers() {
        return ko.computed(function () {
            if (notifications.TotalNotifications() === 0) return '0-0';
            return '1-' + notifications.notifications().length;
        });
    }

    function updateCount(count) {
        topnav.ntfsCount(count);
    }

    function hideNotification(elem) {
        if (elem.nodeType === 1) {
            $(elem).fadeOut('slow', function () { $(elem).remove(); });
        }
    };

    function isLastNotificationAction(notification, action) {
        return action === notification.Actions[notification.Actions.length - 1];
    };    

    function dismissNotification() {
        var actions = ko.dataFor(event.target).Actions;
        var action = $.grep(actions, function (e) {
            return e.Name == 'Dismiss';
        });
        dataservice.apiCallRequest(action[0], notifications);
    }

    function followBack(notification) {
        var actions = notification.Actions;
        var action = $.grep(actions, function (e) {
            return e.Name == 'Follow Back';           
        });

        //(dataservice.apiCallRequest(action[0], notifications)).then(function () {
        //    //we add to the followin array of the application
        //    var members = require('viewmodels/members/members');
        //    members.Refresh();
        //});
    }

    ///required if approval is needed before dismiss
    function performNotificationAction(action) {
        if (action.Confirm.length > 0) {
            var confirmDialog = $("<div class='dnnDialog'></div>").html(action.Confirm).dialog({
                autoOpen: false,
                resizable: false,
                modal: true,
                title: settings.notificationConfirmTitleText,
                dialogClass: 'dnnFormPopup dnnClear',
                open: function () {
                    $('.ui-dialog-buttonpane').find('button:contains("' +
                        settings.notificationConfirmNoText + '")').addClass('dnnConfirmCancel');
                },
                buttons: [
                    {
                        text: settings.notificationConfirmYesText,
                        click: function () {
                            $(this).dialog("close");
                            dataservice.apiCallRequest(action, notifications);
                        }
                    },
                    {
                        text: settings.notificationConfirmNoText,
                        click: function () { $(this).dialog("close"); }
                    }
                ]
            });

            if (confirmDialog.is(':visible')) {
                confirmDialog.dialog("close");
                return true;
            }

            confirmDialog.dialog('open');
        } else {
            dataservice.apiCallRequest(action, notifications);
        }
    };

    /******unhandled*************************************************************/

    notifications.getTotalNotifications = function () {
        var returnValue = 0; // If the call fails, just return 0.

        $.ajax({
            type: "GET",
            beforeSend: serviceFramework.setModuleHeaders,
            url: countnotificationspath,
            async: false,
            cache: false
        }).done(function (data) {
            if ($.type(data) === "number") {
                returnValue = data;
            }
        });

        return returnValue;
    };

    notifications.loadNotificationsTab = function () {
        History.pushState({ view: 'notifications', action: 'notifications' }, "",
            "?view=notifications&action=notifications&t=" +
            notifications.fetch_unix_timestamp());
    };    

    notifications.loadMoreVisible = ko.computed(function () {
        return notifications.messages().length < notifications.TotalConversations();
    });

    notifications.loadMoreNotificationsVisible = ko.computed(function () {
        return notifications.notifications().length < notifications.TotalNotifications();
    });

    notifications.hideNotification = function (elem) {
        if (elem.nodeType === 1) {
            $(elem).fadeOut('slow', function () { $(elem).remove(); });
        }
    };



});

