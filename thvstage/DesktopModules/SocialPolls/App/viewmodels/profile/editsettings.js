define(['services/logger', 'services/dataservice/ds.user',
    'services/model', 'config', 'services/util', 'viewmodels/shell'],
function (logger, dataservice, model, config, util, shell) {
    var initialized = false;
    var settings = config.appSettings;

    var onState = ko.observable('ON');
    var offState = ko.observable('OFF');

    var memberInfo = $('#globalParams').data('UserInfo');
    var userProfile = memberInfo.ProfileProperties;

    var editSettings = {
        title: 'Edit Settings',
        activate: activate,
        viewAttached: viewAttached,

        //implements
        on: onState,
        off: offState,
        onSaveHandler: onFormSave,
        settingsHandler: settingsHandler,

        //properties        
        CurrentUser: memberInfo,
        VotesOnPolls: userProfile.VotesOnPolls,
        VotesOnVotedPolls: userProfile.VotesOnVotedPolls,
        FriendsJoined: userProfile.FriendsJoined,
        FacebookConnect: userProfile.FacebookConnect,
        FacebookTimeline: userProfile.FacebookTimeline,

        //modal
        hostModal: ko.observable()
    };
    return editSettings;

    function activate() {
        if (initialized) { return }
        initialized = true;
        return;
    }

    function viewAttached(view) {
        var self = this;        
    }

    function onFormSave() {
        //save password and email
        var form = $('#Form');
        editSettings.hostModal().close();
    }

    function bindProperyUpdate(rootSelector, selector, callback, eventName) {
        $(rootSelector).on(eventName, selector, function () {
            //we get the data for the POLL DOM ELEMENT  that was clicked 
            var sender = $(event.target);
            callback(sender);
            return false;
        });
    }

    function settingsHandler() {
        //the id for the attribute is the name of the property in dnn
        var sender = event.target;
        var container = sender.parentElement;
        var nameValue = getPropertyValuePair(container, sender);
        dataservice.updateProfileProperty(nameValue.propertyName, nameValue.propertyValue())
            .done(function (result) {
                //update the view model property
                result.Val.toLowerCase() == 'true' ? editSettings[result.Name]('yes')
                    : editSettings[result.Name]('no');
            })
    }

    function getPropertyValuePair(container, sender) {
        var text = $(sender).text().toLowerCase();
        var pair = {
            propertyName : $(container).attr('id'),
            propertyValue : function () {               
                return (text == "on" ? "true" : "false");
            },
            freindlyValue: function () {
                return (text == 'on' ? 'yes' : 'no');
            }
        }
        return pair;
    }

    function updateProperty(sender) {
        var name = sender.attr('id');
        var val = editprofile[name]();
        if (!val) { return };
        properties.push({ PropertyName: name, PropertyValue: val });
        dataservice.updateProfileProperty(name, val).then(function () {
            editSettings.hostModal().alertVis(true);
            editSettings.hostModal().alertClass('alert alert-info');
            editSettings.hostModal().alert(config.localization.formErrs);
        });
    }
});