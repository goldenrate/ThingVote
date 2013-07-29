define(function () {
    var startModule = 'polls';
    var dnnContext = $('#applicationHost').data('dnnContext');
    if (dnnContext) {
        var modulePath = dnnContext.moduleUrl + "/";
        var hostUrl = 'http://' + dnnContext.hostUrl;
    }

    var form = $('#Form');
    var memberInfo = $('#globalParams').data('UserInfo');
    

    toastr.options.timeOut = 4000;
    toastr.options.positionClass = 'toast-bottom-left';

    config = {
        form:form.validate().settings = {
            messages: {
                required: 'This field is really required!',
                txtQustion: {
                    //maxLength: 'The maximum allowed length of this field is'
                },
                selectPollCategory: {
                   valueNotEquals: 'You must select a category'
                },
                //#region
                email: {
                    email:'Please enter a valid email address',
                },
                newPasswordRepeat: {
                    equalTo:'Password does not match!'
                }
                //#endregion
            },
            groups: {},
            rules: {
                txtQustion: {
                    required:true,
                },
                selectPollCategory: {
                    required: true,
                    valueNotEquals: ""
                },
                imagesUploader: {
                    required: true,
                    noImagePH: 'PlaceHolder',
                    allowedFileType: '"png|jpe?g|gif"',
                    filesize: 1048576
                },
                //#region profile settings 
                email:{
                    required: true,
                    email:true
                },
                newPassword: {
                    //required: true,
                    minlength: 7,

                },
                newPasswordRepeat: {
                    //required: true,
                    equalTo: '#newPassword',
                    minlength: 7
                }
                //#endregion 
            },
            errorClass: "required-error",
            validClass: "valid-input",
            errorElement: "label",
            focusInvalid: true,
            errorContainer: { length: 0 },
            errorLabelContainer: { length: 0 },
            onsubmit: true,
            ignore: "hidden",
            ignoreTitle: false
        },
        dnnData: {
            isAuthenticated: function () {
                if (dnnContext.isAuthenticated.toLowerCase() == 'false')
                    return false;
                else
                    return true;
            },
            userId: dnnContext.userId,
            profilePicHandler: dnnContext.profilePicHandler,
            profilePictureUrl: dnnContext.profilePictureUrl,
            servicesFramework: dnnContext.servicesFramework,
            baseServicepath: dnnContext.servicesFramework.getServiceRoot('Polls'),
            userImagePath: dnnContext.userImagesPath + '/',
            moduleImagesUrl: modulePath + 'images',
            userControl: dnnContext.userControl,
            userLogin: dnnContext.userLogin,
            appUrl: dnnContext.appUrl,
            userControlGrp: dnnContext.userControl,
            userLogin: dnnContext.userLogin
        },

        appSettings: {
            pollsMasonry: {
                itemSelector: '.pollItem',
                //columnWidth: 244,
                isAnimated: true,
                isFitWidth: true,
                isResizable: true
            },
            pollsPageSize:10,
            host: hostUrl,
            polldetailUrl: hostUrl + '/#/' + 'polls/:id',
            fbobjectUrl:hostUrl+ 'DesktopModules/SocialPolls/fbobject/index.html',
            storage: '#globalParams',
            globlas: {
                editpoll: {
                    poll: 'poll',
                    cat:'categories'
                },
            },
            //the w and h in the query string refer to the preview image
            pollUploadHandler: '/DesktopModules/SocialPolls/FileTransferHandler.ashx?' +
                'tnmaxwidth={0}&tnmaxheight={1}&w&h',
            thumbnailHandler:'/DesktopModules/SocialPolls/Thumbnail.ashx?f={0}&'+
                'tnmaxwidth={1}&tnmaxheight={2}&ownerId={3}',
            ////thumbnailUrl : 'Portals/0/Users/00{0}/0{1}/{2}/',
            profilePicHandlerUrl: '/DesktopModules/SocialPolls/ProfilePicHandler.ashx',
            spaProfileUrl: function (userId, tab) {
                var url = '/#/my/{0}/{1}';
                return url.replace('{0}', userId).replace('{1}',tab);
            },
            getProfilePicture: function (userId, w, h) {
                var handler = dnnContext.profilePicHandler;
                return handler.replace("{0}",
                userId).replace("{1}", h).replace("{2}", w);
            }          
        },

        thumbnail: {
            prevSelect: {
                w: 202,
                h:135
            },
            prevOthers: {
                w:202,
                h:205
            },
        },
        dnnMembersSettings: {
            userId: dnnContext.userId,
            groupId: dnnContext.groupId,
            viewerId: dnnContext.viewerId,
            profileUrl: dnnContext.profileUrl,
            profileUrlUserToken: dnnContext.profileUrlUserToken,
            profilePicHandler: dnnContext.profilePicHandler,
            membersServicesFramework: dnnContext.membersServicesFramework,
            baseServicepath: dnnContext.membersServicesFramework
                .getServiceRoot('MemberDirectory') + 'MemberDirectory/',
        },

        membersDefaultSettings: {
            userId: -1,
            groupId: -1,
            viewerId: -1,
            profileUrl: "",
            profileUrlUserToken: "PROFILEUSER",
            addFriendText: "AddFriend",
            acceptFriendText: "AcceptFriend",
            friendPendingText: "FriendPendingText",
            removeFriendText: "RemoveFriendText",
            followText: "Follow",
            unFollowText: "Unfollow",
            sendMessageText: "SendMessageText",
            userNameText: "UserNameText",
            emailText: "EmailText",
            cityText: "CityText",
            serverErrorText: "ServerErrorText",
            serverErrorWithDescriptionText: "ServerErrorWithDescriptionText"
        },

        notificationSettings: {
            userId: dnnContext.userId,
            groupId: dnnContext.groupId,
            viewerId: dnnContext.viewerId,
            notificationsServicesFramework: dnnContext.notificationsServicesFramework,
            notificationspath: dnnContext.notificationsServicesFramework
                .getServiceRoot('CoreMessaging') + 'MessagingService/',
            notificationsPageSize: 10
        },

        pollSettings: {
            maxSelectionOptions: 3
        },

        imageSettings: {
            basePath: dnnContext.moduleUrl,
            selectionIconName: modulePath + 'images/' + 'selectionicon.png',
            ratingIconName: modulePath + 'images/' + 'ratingicon.png',
            boolIconName: modulePath + 'images/' + 'yesnoicon.png',
            thumbPrefix: 'tn_'
        },

        profilePictureSize: {
            pollPreview: 50
        },

        CurrentUser: {
            currentUser: memberInfo,
            DisplayName: dnnContext.displayName,
            ProfilePictureUrl: dnnContext.profilePictureUrl,
            userId: dnnContext.userId
        },

        localization: {
            selectTypeWarning: 'you must select a type to continue'
        },

        editPoll: {
            rules: {
                txtQustion: {
                    required:true,
                    maxlength: 3,
                    onfocusout: true,
                    errorClass: "invalid",
                    validClass: "success",
                    messages: {
                        //required: 'This field is really required!',
                        maxLength: 'The maximum allowed length of this field is'
                    }
                }
            },
        },

        routes: [
            { url: 'index', moduleId: 'viewmodels/index', name: 'Index', visible: true },
            { url: 'index/:filter', moduleId: 'viewmodels/index', name: 'Index', visible: true },
            { url: 'index/:filter/:catsids', moduleId: 'viewmodels/index', name: 'Index', visible: true },
            { url: 'polls', moduleId: 'viewmodels/polls', name: 'Polls', visible: true },
            { url: 'polls/:id', moduleId: 'viewmodels/polls', name: 'Polls', visible: true },
            { url: 'my/:userid', moduleId: 'viewmodels/my', name: 'My Page', visible: true },
            { url: 'my/:userid/:tab', moduleId: 'viewmodels/my', name: 'My Page', visible: true },
            { url: 'members/members/:mode', moduleId: 'viewmodels/members/members', name: 'members', visible: true },
            { url: 'polls/:id', moduleId: 'viewmodels/polls', name: 'Polls', visible: true },
            {
                url: 'polldetail/:id',
                moduleId: 'viewmodels/polldetail',
                name: 'Detailed View',
                visible: false
            }
        ],
        startModule: 'index',

        localization: {
            formErrs: 'Change a few things up and try submitting again. ',
            formSucess:'Update successfully', 
            createPoll: {
                header:'add new poll'
            },
            
            
        }
    }


    return config;

});