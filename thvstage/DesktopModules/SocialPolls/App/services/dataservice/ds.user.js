define(['services/logger', 'durandal/system', 'config', 'services/model/model.notification'],
function (logger, system, config, model) {
    var baseServicepath = config.dnnData.servicesFramework.getServiceRoot('SocialPolls');
    var userId = config.dnnData.userId;

    var getOptions = {
        type: "GET",
        cache: false,
        beforeSend: config.dnnData.servicesFramework.setModuleHeaders,
        data: {}
    };

    var postOptions = {
        type: "POST",
        cache: false,
        beforeSend: config.dnnData.servicesFramework.setModuleHeaders,
        data: {}
    };

    userDs = {
        getCurrentUser: getCurrentUser,
        updateProfileProperty: updateProfileProperty,
        updateAccountSettings:updateAccountSettings
     
    };
    return userDs;


    function getCurrentUser(userId) {
        var url = baseServicepath + "PollMember/GetPollMember";
        getOptions.url = url;
        getOptions.data = { userId: userId };
        return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
        function querySucceeded(member) {
            return member;
        }
    };

    function updateProfileProperty(propName, propValue) {
        postOptions.url = baseServicepath + 'PollMember/UpdateProfileProperty';
        postOptions.data = {
            UserId: userId,
            PropertyName: propName,
            PropertyValue: propValue
        };
        postOptions.beforeSend = config.dnnData.servicesFramework.setModuleHeaders;
        return $.ajax(postOptions).then(querySucceeded).fail(queryFailed);
        function querySucceeded(data) {
            //var msg = 'Congrtulation! You have successfuly submited your vote';
            //log(msg, data, true);
            return data;
        }

    };

    function updateEmail(email) {
        postOptions.url = baseServicepath + 'PollMember/UpdateEmail';
        postOptions.data = { email: email };
        postOptions.beforeSend = config.dnnData.servicesFramework.setModuleHeaders;
        return $.ajax(postOptions).then(querySucceeded).fail(queryFailed);
        function querySucceeded(data) {
            return data;
        }
    };

    function updatePassword(oldPass, newPass) {
        postOptions.url = baseServicepath + 'PollMember/UpdateEmail';
        postOptions.data = { oldPassword: oldPass, newPassword: newPass };
        postOptions.beforeSend = config.dnnData.servicesFramework.setModuleHeaders;
        return $.ajax(postOptions).then(querySucceeded).fail(queryFailed);
        function querySucceeded(data) {
            return data;
        }
    };

    function updateAccountSettings(settings) {
        postOptions.url = baseServicepath + 'PollMember/UpdateAccount';
        postOptions.data = {
            Email:settings.email, 
            Password:settings.newPass, 
            PasswordRepeat: settings.newPassRepeat
        };
        postOptions.beforeSend = config.dnnData.servicesFramework.setModuleHeaders;
        return $.ajax(postOptions).then(querySucceeded).fail(queryFailed);
        function querySucceeded(data) {
            return data;
        }
    }

    function queryFailed(xhr, status) {
        var msg = 'Error message';
        logger.logError(msg, xhr, system.getModuleId(dataservice), true);
    };


});