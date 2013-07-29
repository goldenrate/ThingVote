define(['services/logger', 'services/dataservice/ds.user',
    'services/model', 'config', 'services/util'],
function (logger, dataservice, model, config, util) {
    var userId = config.dnnData.userId;
    var modalView = ko.observable();
    var modalid = ko.observable();
    var firstName = ko.observable();
    var lastName = ko.observable();
    var location = ko.observable();
    var about = ko.observable();
    var properties = ko.observableArray();
    var searchPrivacy = ko.observable();
    var profilePictureUrl = ko.observable(
        config.dnnData.profilePictureUrl);
    var fileHandlerUrl = ko.observable();
    var memberInfo = $('#globalParams').data('UserInfo');
    var onState = ko.observable('ON');
    var offState = ko.observable('OFF');

    var editprofile = {
        title:'Edit Profile',
        activate: activate,
        viewAttached: viewAttached,

        //properties
        CurrentUser: memberInfo,
        FirstName: memberInfo.FirstName,
        LastName: memberInfo.LastName,
        City: memberInfo.ProfileProperties.City,
        Biography: memberInfo.ProfileProperties.Biography,
        ProfilePictureUrl: memberInfo.PhotoURL,
        SearchPrivacy: memberInfo.ProfileProperties.SearchPrivacy,

        doneUploadHandler: doneUploadHandler,
        fileHandlerUrl: ko.observable(config.appSettings.profilePicHandlerUrl),

        //handler 
        onSaveHandler: onFormSave,
        searchPrivacyClick: searchPrivacyClick,
        on: onState,
        off: offState,
        
        //modal
        hostModal: ko.observable(),
        modalId:modalid,
        ModalView: modalView,

      
    };
    return editprofile;

    function activate() {
        return;
    }

    function viewAttached(view) {
        var self = this;
        bindProperyUpdate(view, 'input, textarea', updateProperty, 'blur');
        //bindFileUploader(view,'#imageUploader, 
        modalView(view);
        $('#' + self.modalId).addClass('medium-modal');
        $('#'+self.modalId).modal('show');
    }

    function save() {
        var properties = new Array();
    }

    function bindProperyUpdate(rootSelector, selector, callback, eventName) {
        $(rootSelector).on(eventName, selector, function () {
            //we get the data for the POLL DOM ELEMENT  that was clicked 
            var sender = $(event.target);
            callback(sender);
            return false;
        });
    }

    function updateProperty(sender) {
        var name = sender.attr('id');
        var val = editprofile[name]();
        if (!val) { return };
        properties.push({ PropertyName: name, PropertyValue: val });
        dataservice.updateProfileProperty(name, val).then(function () {
            var dosome;
        });
    }

    //handler for the profile picture uploader 
    //all we need to do is to update the profile picture url 
    function doneUploadHandler(e, data) {
        editprofile.ProfilePictureUrl(data.result.name);
    }

    function searchPrivacyClick(selected) {
        var sender = $(event.target);
        var name = sender.parent().attr('id');
        var val = sender.text().toLowerCase() == 'on' ? 'true' : 'false';
        dataservice.updateProfileProperty(name, val)
            .done(function (result) {              
                //update the view model property
                result.Val.toLowerCase() == 'true' ? editprofile[result.Name]('yes')
                    : editprofile[result.Name]('no');
            })
    }

    function onFormSave() {
        var properties = new Array();
        editprofile.hostModal().close();
    }

});