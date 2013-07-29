define(['services/logger', 'services/dataservice', 'config',
    'services/util'],
function (logger, dataservice, config,util) {
    model = {
        Poll: function (pollDto) {
            var self = this;
            var size = config.profilePictureSize.pollPreview;

            self.src = ko.observable('mysrc')
            //computed properties
            self.pollIconUrl = ko.observable();
            self.pollTypeName = ko.observable();
            self.PollOptionCache = ko.observableArray();
            self.SelectedCategoryId = ko.observable();
            self.UserProfilePictureUrl = ko.observable();

            //Mark type
            self.IsSelectionPoll = ko.observable();
            self.IsBoolPoll = ko.observable();
            self.IsRatePoll = ko.observable();

            //holds the image for the leading option, which we calculate 
            //below in the option section 
            self.LeadingOptionUrl = ko.observable();

            self.IsPublicPoll = ko.observable();
            self.IsFollowersPoll = ko.observable();

            //set the picture url for this poll's owner             
            self.userPreviewProfilePicture = ko.observable();
            self.filesLimit = ko.observable();

            init();
            //we call this here as we don't want it to map to observable 
            self.PollOptions = ko.observableArray();            
            self.setTypeRelatedProperties = setTypeProperties;
            initPollOptions();
            self.spaProfileUrl = function () {
                return config.appSettings.spaProfileUrl(self.OwnerId());
            };
            self.getProfileUrl = function (userId, w, h) {
                return config.appSettings.getProfilePicture(userId, w,h);
            };

            //#region addthis urls
            var detailUrl = config.dnnData.appUrl +'polldetail/{0}'
            self.addthisUrl = function () {
                return detailUrl.replace('{0}', self.PollId());
            }
            
            //#endregion
           
            function init() {
                mapToObservable(self, pollDto);
                setProfilePicPreview();
                setTypeProperties(pollDto.PollTypeId);

                //format time 
                var from = moment(self.CreatedOn(), 'MM/DD/YYYY HH:mm:ss a').fromNow()
                self.CreatedOn(from);
                //var fromNow = moment.moment(self.CreatedOn(), 'YYYYMMDD').fromNow()
            }

            function setProfilePicPreview() {
                var handler = config.dnnData.profilePicHandler;
                var imagePath = handler.replace("{0}", self.OwnerId())
                    .replace("{1}", size).replace("{2}", size);
                self.userPreviewProfilePicture(imagePath);
            };

            function setTypeProperties(typeId) {
                self.results = ko.observable();
                self.PollTypeId(typeId)
                switch (typeId) {
                    case 1:
                        self.filesLimit(3);
                        self.pollIconUrl(config.imageSettings.selectionIconName);
                        self.pollTypeName("selection");
                        setTypeVisibility(true, false, false);
                        break;
                    case 2:
                        self.filesLimit(1);
                        self.pollIconUrl(config.imageSettings.boolIconName);
                        self.pollTypeName("yes/no");
                        setTypeVisibility(false, true, false);
                        var boolcolors = ['#A53131','#77A327' ];
                        var boolDistribution = pollDto.BoolDistribution;
                        var maxCount = 0;
                        self.results('no votes');
                        for (var prop in boolDistribution) {
                            if (boolDistribution.hasOwnProperty(prop)) {
                                if (boolDistribution[prop].Count > maxCount) {
                                    maxCount = boolDistribution[prop].Count;
                                    self.results(boolDistribution[prop].Name)
                                }
                                name = boolDistribution[prop].Name;
                                name == 'YES' ? boolDistribution[prop].color = boolcolors[1]
                                : boolDistribution[prop].color = boolcolors[0];
                                boolDistribution[prop].precent =
                                    (boolDistribution[prop].Proportion * 100) + '%';
                            };
                        }                       
                        break;
                    case 3:
                        self.filesLimit(1);
                        self.pollIconUrl(config.imageSettings.ratingIconName);
                        self.pollTypeName("rating");
                        setTypeVisibility(false, false, true);

                        //now we populate the colors for the rating
                        if (pollDto.RatingDistribution) {
                            var colors = ['#77A327', '#57791D', '#7B681E', '#794C23', '#A53131'];
                            var opts = pollDto.RatingDistribution.reverse();
                            for (var prop in opts) {
                                if (opts.hasOwnProperty(prop)) {
                                    opts[prop].color = colors[prop];
                                }
                            };
                            //calculate the average 
                            var sum = 0;
                            var count = 0;
                            for (var i = 0; i < opts.length; i++) {
                                count += opts[i].Count;
                                sum += opts[i].Sum;
                            }
                            self.AverageRating = (sum / count).toFixed(2);
                            var res = (sum / count).toFixed(0);
                            self.results(res);
                        }
                        break;
                    default:
                }
                initPollOptions();
            };

            function initPollOptions() {
                var initOptions = new Array();
                if (self.IsSelectionPoll()) {
                    //add the selected option
                    self.votedOption = ko.observable();
                    var length = pollDto.ViewPollOptions.length;
                    var votesCount = 0;
                    var leadingOptionCount = 0;
                    for (var i = 0; i < length; i++) {
                        var optDto = pollDto.ViewPollOptions[i];
                        initOptions[i] = new model.PollOption(optDto, pollDto);
                        initOptions[i].PollId = pollDto.PollId;
                        initOptions[i].OwnerId = pollDto.OwnerId;
                        //the dataservice initializes count to 0
                        if (optDto.Count > 0) { votesCount += optDto.Count; }
                    }

                    if (votesCount > 0) {
                        initOptions.sort(function (a, b) {
                            var aCount = a.Count();
                            var bCount = b.Count();
                            return ((aCount < bCount) ? -1 : ((aCount > bCount) ? 1 : 0));
                        });
                        initOptions.reverse();
                        self.LeadingOptionUrl(initOptions[0].OptionImageUrl());
                        //var tag;
                        //var vo = initOptions[0].ViewOrder();
                        //switch (vo) {
                        //    case 1:
                        //        tag = 'a';
                        //        break;
                        //    case 2:
                        //        tag = 'b';
                        //        break;
                        //    case 3:
                        //        tag = 'c';
                        //        break;
                        //    default:
                        //        break;
                        //}
                        //self.votedOption(tag);
                        //set the colors for the icons
                        var colors = ['#77A327', '#7B681E', '#A53131'];

                        for (var i = 0; i < length; i++) {
                            var votes = initOptions[i].Count();
                            var p = ((votes / votesCount) * 100).toFixed(0);
                            initOptions[i].Proportion(p);
                            initOptions[i].ResultsIconColor(colors[i]);
                            switch (i) {
                                case 0:
                                    initOptions[i].tag = 'a';
                                    break;
                                case 1:
                                    initOptions[i].tag = 'b';
                                    break;
                                case 2:
                                    initOptions[i].tag = 'c';
                                    break;
                                default:
                                    break;
                            }
                            if (i == 0) {
                                self.results(p);
                            }
                            if (i == 0) { initOptions[i].isLeading = true };
                        }
                    } else {
                        self.LeadingOptionUrl(initOptions[0].OptionImageUrl());
                        //update results
                        self.results('no votes');
                        self.votedOption('');
                    }

                } else {
                    var singleOptDto = pollDto.ViewPollOptions[0];
                    initOptions[0] = new model.PollOption(singleOptDto, pollDto);
                    initOptions[0].PollId = pollDto.PollId;
                    initOptions[0].OwnerId = pollDto.OwnerId;
                    self.LeadingOptionUrl(initOptions[0].OptionImageUrl());
                }
                //$.map(pollDto.ViewPollOptions, function (item) { model.PollOption(item) });
                //self.PollOptions = null;
                //self.PollOptions = ko.observableArray(initOptions);
                self.PollOptions(initOptions);
                //self.PollOptions();
            };

            function setTypeVisibility(selection, bool, rate) {
                self.IsSelectionPoll(selection);
                self.IsBoolPoll(bool);
                self.IsRatePoll(rate);
            };
        },

        PollTypeList: function (dto) {
            var self = this;
            mapToObservable(self, dto);

            self.bigVoteTypeImageUrl = ko.computed(function () {
                var path = self.VoteTypeImageUrl();
                return util.addSuffixToImage(path, '_big');
            });
        },

        PollOption: function (dto, pollDto) {
            var self = this;
            self.InputId = 'optionInput' + dto.OptionId;
            self.ImageId = 'optionImage' + dto.OptionId;
            //the rating that this option has received by the user 
            self.Rating = ko.observable();
            mapToObservable(self, dto);

            self.deleteUrl='';

            self.tnWidth = ko.observable(200);
            self.tnHeight = ko.observable(205);
            self.thumnailUrl = ko.observable(config.appSettings.thumbnailHandler);
            self.getPrevThumbnailHdl = ko.computed(function () {
                
                return self.thumnailUrl()
                    .replace("{0}", dto.OptionImageTitle)
                    .replace("{1}", self.tnWidth())
                    .replace("{2}", self.tnHeight())
                    .replace("{3}", pollDto.OwnerId);
            });
            self.displayPlaceholder = ko.computed(function () {
                return self.thumnailUrl().toLowerCase()
                    .indexOf('{0}') !== -1;
            });

            //depricated. See OptionTnHandlerUrl instead
            self.OptionThumbnailUrl = ko.computed(function () {
                var filename = self.OptionImageUrl();
                var isPlaceHolder = filename.indexOf('PlaceHolder') > 0;
                if (isPlaceHolder) {
                    return filename;
                } else {
                    return util.getThumbnail(filename);
                }
            });

            self.Proportion = ko.observable(0);
            self.ResultsIconColor = ko.observable();
        },

        PollCategory: function (dto) {
            var self = this;
            mapToObservable(self, dto);
            //additional vars
            self.isSelected = ko.observable();
        },

        WizardInitData: function (dto) {
            var self = this;
            mapToObservable(self, dto);
        },

        //dnn related features 
        UserInfo: function (dto) {

        },

        PortalSettings: function (dto) {
            logoUrl: dto.LogoUrl
        },

        Member: function (item, opts) {
            var self = this;
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

            //#region poll member ralated
            self.FollowersCount = ko.observable(item.FollowersCount);
            self.FollowingCount = ko.observable(item.FollowingCount);
            self.PollsCount = ko.observable(item.PollCount);
            self.VotesCount = ko.observable(item.VotesCount);
            self.ProfilePictureUrl = ko.observable(item.ProfilePictureUrl);
            self.MemberEmail = ko.observable(item.MemberEmail);
            //#endregion


            self.UserId = ko.observable(item.MemberId);
            self.LastName = ko.observable(item.LastName);
            self.FirstName = ko.observable(item.FirstName);
            self.UserName = ko.observable(item.UserName);
            self.DisplayName = ko.observable(item.DisplayName);
            self.Email = ko.observable(item.Email);

            
            self.IsUser = ko.observable(item.MemberId == opts.viewerId);

            self.IsAuthenticated = (opts.viewerId > 0);

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

            //refers to the CURRENT USER "the current user is following 
            //THIS (the user that we're currently rendering in the directory)
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

            //self.ProfileProperties = ko.observable(item.ProfileProperties);
            self.ProfileProperties = ko.observable();
            for (prop in item.ProfileProperties) {
                if (item.ProfileProperties.hasOwnProperty) {
                    self.ProfileProperties[prop] =
                        ko.observable(item.ProfileProperties[prop]);
                }
            };

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
                return opts.profileUrl.replace(opts.profileUrlUserToken, self.UserId().toString());
            }, this);

            self.getProfilePicture = function (w, h) {
                return opts.profilePicHandler.replace("{0}",
                    self.UserId()).replace("{1}", h).replace("{2}", w);
            };

            self.spaProfileUrl = function () {
               return config.appSettings.spaProfileUrl(self.UserId());
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
                    url: opts.baseServicepath + 'Follow',
                    beforeSend: opts.membersServicesFramework.setModuleHeaders,
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
                    url: opts.baseServicepath + 'RemoveFriend',
                    beforeSend: opts.membersServicesFramework.setModuleHeaders,
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
                    url: opts.baseServicepath + 'UnFollow',
                    beforeSend: opts.membersServicesFramework.setModuleHeaders,
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

            /*****************additional specific properties *******************/

            self.pollsCreated = function () {
            };

            self.VotesCount = ko.observable(item.VotesCount);

            self.PollsCount = ko.observable(item.PollsCount);
            self.FollowersCount = ko.observable(item.FollowersCount);
            self.FollowingCount = ko.observable(item.FollowingCount);
            self.Bio = ko.observable(item.Bio);
        }
    }
    return model;

     function mapToObservable(vm, dto) {
         for (prop in dto) {
            if (dto.hasOwnProperty(prop)) {
                vm[prop] = ko.observable(dto[prop]);
            }
        }
    }
});