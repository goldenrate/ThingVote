define(['services/logger', 'durandal/system', 'config', 'services/model/model.notification', 'viewmodels/topnav'],
function (logger, system, config, model, topnav) {
    var notificationspath = config.notificationSettings.notificationspath;
    var serviceFramework = config.notificationSettings.notificationsServicesFramework;
    var notificationsPageSize = config.notificationSettings.notificationsPageSize;
   
    notificationds = {
        //loadMoreNotifications: loadMoreNotifications,
        loadNotifications: loadNotifications,
        loadMoreNotifications:loadMoreNotifications,
        apiCallRequest: apiCallRequest
    };
    return notificationds;

    function loadNotifications(notificationsObservable, loadingData, totalNotifications) {
        notificationsObservable([]);
        $.ajax({
            type: "GET",
            url: notificationspath + 'Notifications',
            beforeSend: serviceFramework.setModuleHeaders,
            data: {
                afterNotificationId: -1,
                numberOfRecords: notificationsPageSize
            },
            cache: false
        }).done(function (data) {
            if (typeof data !== "undefined" && data != null && typeof data.Notifications !== "undefined") {
                var mappedNotifications = $.map(data.Notifications,
                    function (notification) { return new model.Notification(notification); });
                notificationsObservable(mappedNotifications);
                if (typeof data.TotalNotifications !== "undefined" &&  $.type(data.TotalNotifications) === "number") {
                    totalNotifications(data.TotalNotifications);
                }
            } else {
                displayMessage("#dnnCoreNotification", settings.serverErrorText, "dnnFormWarning");
            }
        }).fail(function (xhr, status) {
            displayMessage("#dnnCoreNotification", settings.serverErrorWithDescriptionText + status, "dnnFormWarning");
        }).always(function () {
            loadingData(false);
        });
    };

    function apiCallRequest(action, viewmodel) {
        $.ajax({
            type: "POST",
            url: dnn.getVar("sf_siteRoot", "/") + action.APICall,
            beforeSend: serviceFramework.setModuleHeaders,
            data: { NotificationId: action.NotificationId }
        }).done(function (data) {
            if (data.Result === "success") {
                var notificationToRemove = ko.utils.arrayFirst(viewmodel.notifications(), function (notification) {
                    var current = parseInt(topnav.ntfsCount()) - 1;
                    topnav.ntfsCount(current);
                    return notification.NotificationId === action.NotificationId;
                });
                var currentCount = viewmodel.TotalNotifications() - 1;
                viewmodel.TotalNotifications(currentCount);

                //viewmodel.notifications.remove(notificationToRemove);
                //viewmodel.TotalNotifications(viewmodel.TotalNotifications() - 1);
                //loadMoreNotifications(viewmodel.notifications, 1, viewmodel.TotalNotifications)
                //displayMessage("#dnnCoreNotification", settings.actionPerformedText, "dnnFormSuccess");
                return;
            }
            else {
                if (typeof data.Message !== "undefined" && data.Message != null && data.Message !== '') {
                    displayMessage("#dnnCoreNotification", data.Message, "dnnFormWarning");
                } else {
                    //displayMessage("#dnnCoreNotification", settings.actionNotPerformedText, "dnnFormWarning");
                }
            }
        }).fail(function () {
            //displayMessage("#dnnCoreNotification", settings.actionNotPerformedText, "dnnFormWarning");
        });
    };

    function loadMoreNotifications(notificationsObservable, pageSize, totalNotifications) {
        var afterNotificationId = notificationsObservable().length == 0 ? -1
            : notificationsObservable()[notificationsObservable().length - 1].NotificationId;

        $.ajax({
            type: "GET",
            url: notificationspath + 'Notifications',
            beforeSend: serviceFramework.setModuleHeaders,
            data: { afterNotificationId: afterNotificationId, numberOfRecords: pageSize },
            cache: false
        }).done(function (notificationsViewModel) {
            if (typeof notificationsViewModel !== "undefined" &&
                notificationsViewModel != null && typeof notificationsViewModel.Notifications !== "undefined") {
                var mappedNotifications = $.map(notificationsViewModel.Notifications,
                     function (notification) { return new model.Notification(notification); });

                for (var i = 0; i < mappedNotifications.length; i++) {
                    notificationsObservable.push(mappedNotifications[i]);
                }

                if (typeof notificationsViewModel.TotalNotifications !== "undefined" &&
                    $.type(notificationsViewModel.TotalNotifications) === "number") {
                    totalNotifications(notificationsViewModel.TotalNotifications);
                }
            } else {
                displayMessage("#dnnCoreNotification", settings.serverErrorText, "dnnFormWarning");
            }
        }).fail(function () {
            displayMessage("#dnnCoreNotification", settings.serverErrorWithDescriptionText, "dnnFormWarning");
        });
    };

});