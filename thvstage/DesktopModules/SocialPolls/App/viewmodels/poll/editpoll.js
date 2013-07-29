/*
This control can operate in two states: creating a new poll or editing an existing poll. 
In the first case it is called by the wizard 
*/

define(['services/logger', 'services/dataservice', 'services/model', 'config'],
function (logger, dataservice, model, config) {

    var pollBlueprint =ko.observable();
    var poll = ko.observable();   
    
    var names = {
        pollOptions : 0,
        filesAllowed : 1,
        uploadedFiles : 2,
        deletedOptions :3
    }

    var createSessions = [];
    var photosHistory = [];
    var deletedFiles = [];

    var memberInfo = $('#globalParams').data('UserInfo');    
    var FB = $('#fb-root').data('facebookObj');
    if(FB){
        FB = FB.FB;
    };

    var editpoll = {
        //events
        activate: activate,
        viewAttached: viewAttached,
        Modal: ko.observable(),
        UserPolls: ko.observableArray(),

        //poll related properties 
        Poll: ko.observable(),//wizard.CreatedPoll(),
        PollOptions: ko.observable(),//wizard.CreatedPoll().PollOptions,
        UserProfilePictureUrl: ko.observable(),
        FirstName: ko.observable(),
        LastName: ko.observable(),
        DisplayName: ko.observable(),

        PollTypeId: ko.observable(),
        tnMaxWith: ko.observable(),
        tnMaxHeight: ko.observable(),
        userEditQuestion: userEditQuestion,

        getThumbnailUrl:getThumbnailUrl,

        //types
        
        SelectTypeId: selectTypeId,
        SelectedTypeId: ko.observable(),

        //form elements
        PollCategories: ko.observableArray(), //ko.observable(),
        PollTypeList: ko.observableArray(),

        initFileUploader: initFileUploader,
        doneUploadHandler: doneUpload,
        fileHandlerUrl: ko.observable(config.appSettings.pollUploadHandler),
        files:ko.observableArray(),
        

        //validation
        allRequired: [],
        childForm: ko.observableArray(),
        isValid: ko.observable(false),
        IsDirty: ko.observable(),
        rules: {},
        messages: {},
        errorPlacement: {},
        validate: validate,
        save: savePoll,

        postfb:postFacebook
    };
    return editpoll;

    function activate(context) {
    }

    function viewAttached(view) {
        var textarea = $('#txtQustion', view);
        populatePollQuestion(editpoll.Poll().Question());
        textarea.keyup(function () {
            var val = $(this).val();
            populatePollQuestion(val)
        });

        var root = $('#TypeSelectorControl', view);
        root.on('click', 'li.TypeSelector a', function () {
            var typeId = parseInt($('img', this).attr('id'));
            selectTypeId(typeId);
        });
        initSession(view, root);
    };

    function populatePollQuestion(val) {
        var twin = $('#previewUserInfo');
        var img = $('img', twin);
        img.remove();
        twin.text('');
        var clear = $('<div class="clear">');
        twin.append(img).append(val).append(clear);
    }

    //show the selected button as a type
    function initSession(view, root) {
        var selected;
        var arr = $('li.TypeSelector a', root);
        if (!editpoll.IsDirty()) {
            editpoll.IsDirty(true);
            selected = $.grep(arr, function (obj, index) {
                return parseInt($('img', obj).attr('id')) ==
                    editpoll.Poll().IsSelectionPoll();
            });
            editpoll.SelectedTypeId(1);
            var sesObj = new Array();
            sesObj[names.pollOptions] = ko.utils.unwrapObservable(editpoll.Poll().PollOptions);
            sesObj[names.filesAllowed] = 3;
            createSessions[editpoll.SelectedTypeId()] = sesObj;
        } else {
            selected = $.grep(arr, function (obj, index) {
                return parseInt($('img', obj).attr('id'))
                    == editpoll.SelectedTypeId();
            });
        }
        $(selected).addClass('active');
    }

    function userEditQuestion() {
        var dosome;
    }

    function selectTypeId(typeId) {
        //before we move to the next type we save the data of this type
        var curTypeId = editpoll.SelectedTypeId();
        var prevSess = createSessions[curTypeId];
        prevSess[names.pollOptions] = ko.utils.unwrapObservable(editpoll.Poll().PollOptions);

        editpoll.SelectedTypeId(typeId);
        editpoll.Poll().setTypeRelatedProperties(typeId);        
        
        //create a new session if this is the first time we're switching to this type
        var sesObj;
        if (!createSessions[typeId]) {
            sesObj = new Array();
            sesObj[names.pollOptions] = editpoll.Poll().PollOptions;
            sesObj[names.filesAllowed] = editpoll.Poll().filesLimit();
            createSessions[typeId] = sesObj;
        } else {
            sesObj = createSessions[typeId];
            editpoll.Poll().PollOptions(sesObj[names.pollOptions]);
        }
    };

    function getThumbnailUrl() {
        var option = ko.dataFor(this);
        if (editpoll.SelectedTypeId() == 1) {
            return option.getThumbnailHandler(200, 130);
        } else {
            return option.getThumbnailHandler(200, 205);
        }

    }

    ///data - is the option that is being rendered 
    function initFileUploader(elements, data) {
        //we only do it for one handles
        if (data.OptionId() > 0) { return; };
        var sender = $('#imagesUploader');
        inpOptions = {
            replaceFileInput: false,
            dataType: 'json',
            url: '/DesktopModules/SocialPolls/AjaxFileHandler.ashx',
            done: doneUpload
        };
        sender.fileupload(inpOptions);
    }

    function doneUpload(e, data) {
        var sesObj = createSessions[editpoll.Poll().PollTypeId()];
        //get the related poll
        /////var n = data.originalFiles.length;
        var filesLimit = editpoll.Poll().filesLimit();

        $.each(data.result, function (index, obj) {
            var obj = data.result.pop();
            handleUploadedImage(obj, sesObj);
        });
        var uploadedFiles = 0;
    }

    function handleUploadedImage(obj, sesObj) {
        var tn = obj.thumbnail_url;
        var newFile = {
            results: obj,
            original: ko.observable(obj.url),
            thumbUrl: function (w, h) {
                return tn.replace("{1}", w).replace("{2}", h);
            },
            imageTitle: ko.observable(obj.name),
            deleteUrl: function () {
                $.ajax({
                    type: 'POST',
                    url: obj.delete_url,
                    success: function (result, status) {
                        deletePhotoSuccess(result, status);
                    },
                    data: { action: 'delete' }
                });
            }
        };       
        var option;
        var tid = editpoll.SelectedTypeId();
        var deletedExist = (sesObj[names.deletedOptions] &&
            sesObj[names.deletedOptions].length > 0) ? true : false;
        //First we assign the uploaded pictures to options we get from the 
        //deleted array if it exist
        if (deletedExist) {
            option = sesObj[names.deletedOptions].pop();
        } else {
            option = editpoll.Poll().PollOptions.pop();
        }
        option.OptionImageUrl(obj.url);
        option.ImageId = obj.name;
        editpoll.Poll().IsSelectionPoll() ? option.tnHeight(130) : option.tnHeight(205);
        option.thumnailUrl(obj.thumbnail_url);        
        option.deleteUrl = newFile.deleteUrl;
        editpoll.Poll().PollOptions.unshift(option);
    }

    function deletePhotoSuccess(result, status) {
        var n = editpoll.Poll.PollOptions().length;
        var curTypeId = editpoll.SelectedTypeId();
        var sesObj = createSessions[curTypeId];
        if (result.name) {
            var found = false;
            //look for the option which contains the deleted file, save it 
            //in the temporary cache and rearrange the options array 
            while (!found) {
                var opt = editpoll.Poll.PollOptions.pop();
                found = (opt.ImageId == result.name);
                if (found) {
                    
                    var bar = $('#editpoll .progress .bar');
                    var w = parseInt(bar.css('width')) / n;
                    bar.css('width', w*(n-1));

                    opt.OptionImageUrl('');
                    opt.ImageId = '';
                    opt.deleteUrl = '';
                    if (!sesObj[names.deletedOptions]) {
                        sesObj[names.deletedOptions] = new Array();
                    }
                    sesObj[names.deletedOptions].push(opt);
                } else {
                    editpoll.Poll.PollOptions.unshift(opt);
                }
            }
        }
    }

    function validate() {
        var isValid = false;
        $.each($('#editpoll .required-field'), function (i, obj) {
            isValid = $('#Form').validate().element($(obj));
        });
        editpoll.isValid(isValid);
        return isValid;
    }

    function savePoll() {
        var objPoll = editpoll.Poll;
        var valid = validate();
        if (valid) {
            dataservice.savePoll(objPoll).done(function (data) {
                //polls.AddPoll(objPoll);
                var mdl = ko.utils.unwrapObservable(editpoll.Modal());                
                //post to facebook wall
                FB ? postFacebook(data.PollId) : null;
                $(mdl).modal('hide');
                reset();
             });;
        }
        function reset() {
            editpoll.IsDirty(false);
            createSessions = [];
            photosHistory = [];
            deletedFiles = [];
        }
    };
    
    //#region facebook
    function postFacebook(pollId) {
        var FB = $('#fb-root').data('facebookObj').FB;
        var obj = {
            caption: 'I have just posted a' + editpoll.Poll().pollTypeName() + 'poll',
            picture: config.appSettings.host + editpoll.Poll().PollOptions()[0].OptionImageUrl(),
            link: config.appSettings.polldetailUrl.replace(':id', pollId),
            description: editpoll.Poll().Question()
        }        
        if (FB) {
            //var obj = { poll: "http://samples.ogp.me/536429433070021"};
            FB.api('me/feed', 'post', obj, onPostToWallCompleted);
        }
    }

    function onPostToWallCompleted(response) {
        if (response.error)
            console.log(response.error)
        else
            console.log(response);
    }
    //#endregion 
});
