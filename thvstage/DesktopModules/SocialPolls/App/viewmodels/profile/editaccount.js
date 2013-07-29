define(['services/logger', 'services/dataservice/ds.user',
    'services/model', 'config', 'services/util', 'viewmodels/shell'],
function (logger, dataservice, model, config, util, shell) {
    var initialized = false;
    var settings = config.appSettings;

    var memberInfo = $('#globalParams').data('UserInfo');
    var userProfile = memberInfo.ProfileProperties;
    
    var editAccount = {
        title: 'Edit Account',
        activate: activate,
        viewAttached: viewAttached,

        //implements
        CurrentUser: memberInfo,
        onSaveHandler: onFormSave,

        ///Account updates
        Email: memberInfo.MemberEmail,
        password: ko.observable(),
        passwordRepeat: ko.observable(),
      
        //modal
        hostModal: ko.observable()

    };
    return editAccount;

    function activate() {
        if (initialized) { return }
        initialized = true;
        return;
    }

    function viewAttached(view) {
        var self = this;
        var selector = '.required-field';
        $(view).on('blur', selector, function () {
            var form = $('#Form');
            form.validate().element(this);
        });
    }

    function onFormSave() {
        //save password and email
        var form = $('#Form');
        var isValid;
        var fields = $('.required-field', '#accountSettings');
        
        $.each(fields, function (index, obj) {
            isValid = form.validate().element(obj);
        });
        
        if(isValid){
            var parent = $('#editaccount');
            var settings = {
                email : editAccount.CurrentUser.MemberEmail(),
                newPass : editAccount.password(),
                newPassRepeat: editAccount.passwordRepeat()
            }      
            dataservice.updateAccountSettings(settings).done(function () {
                var doaom;
                editAccount.hostModal().close();
            });
        } else {
            editAccount.hostModal().alertVis(true);
            editAccount.hostModal().alertClass('alert alert-error');
            editAccount.hostModal().alert(config.localization.formErrs);
        }
    }
});