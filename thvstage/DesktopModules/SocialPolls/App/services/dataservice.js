/// <reference path="model.js" />
define(['services/logger', 'durandal/system', 'config', 'services/model'],
function (logger, system, config, model)
{
    var baseServicepath = config.dnnData.servicesFramework.getServiceRoot('SocialPolls');

    var getOptions = {
        type: "GET",
        cache: false,
        beforeSend: config.dnnData.servicesFramework.setModuleHeaders,
        data:{}
    };

    var postOptions = {
        type: "POST",
        cache: false,
        beforeSend: config.dnnData.servicesFramework.setModuleHeaders,
        data:{}
    };

    dataservice = {      

        //#region get/set polls
        getAllPollsGroupsByUser: function (mypolls, myvotes, polls, userid) {
            getOptions.url = baseServicepath + 'Poll/' + 'GetPollsByCategory';
            getOptions.data = {userId: userid};
            //make call
            return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
            //handle the ajax callback
            function querySucceeded(data) {
                var initialMyPolls = $.map(data.MyPolls, function (item) { return new model.Poll(item) });
                var initialMyVotes = $.map(data.MyVotes, function (item) { return new model.Poll(item) });
                var initialPolls = $.map(data.PublicPolls, function (item) { return new model.Poll(item) });

                mypolls(initialMyPolls);
                myvotes(initialMyVotes);
                polls(initialPolls);

                return data;
            }
        },

        getAllPollsVotedByUser: function (myvotes, userid) {
            getOptions.url = baseServicepath + 'Poll/' + 'GetPollsVotedByUser';
            getOptions.data = { userId: userid };
            //make call
            return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
            //handle the ajax callback
            function querySucceeded(data) {
                return data;
            }
        },

        getAllPolls: function (pollsObservable) {
            pollsObservable([]);
            getOptions.url = baseServicepath + 'Poll/' + 'GetPolls';

            //make call
            return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
            //handle the ajax callback
            function querySucceeded(data) {
                var initialPolls = $.map(data, function (item) { return new model.Poll(item) });
                pollsObservable(initialPolls);
                return initialPolls;
            }
        },

        //Get all the polls accepts from those which were already
        //voted by the current user
        getPublicPolls: function (method) {
            getOptions.data = {};
            if (method) {
                getOptions.url = baseServicepath + 'Poll/' + method;                
            } else {
                getOptions.url = baseServicepath + 'Poll/' + 'GetPublicPolls';
            }
            //make callx
            return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
            //handle the ajax callback
            function querySucceeded(data) {               
                return data;
            }
        },

        basicSearch: function (term) {
            getOptions.data = {};
            getOptions.url = baseServicepath + 'Poll/' + 'PollsBasicSearch';
            getOptions.data = {
                searchTerm:term
            }
            //make callx
            return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
            //handle the ajax callback
            function querySucceeded(data) {
                return data;
            }
        },

        getPollsByCategories: function (categories) {
            getOptions.data = {
                categories: categories
            };
            getOptions.url = baseServicepath + 'Poll/' + 'GetPublicPollsByCategories';

            //make callx
            return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
            //handle the ajax callback
            function querySucceeded(data) {
                return data;
            }
        },

        getPollsCreatedByUser: function (pollsObservable, userId) {
            pollsObservable([]);
            getOptions.url = baseServicepath + 'Poll/' + 'GetPollsByUser';
            getOptions.data = { userId: userId }

            //make call
            return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
            //handle the ajax callback
            function querySucceeded(data) {
                var initialPolls = $.map(data, function (item) {
                    return new model.Poll(item)
                });
                pollsObservable(initialPolls);
                return data;
            }
        },

        getPollsForUser: function (userId) {
        },

        getPoll: function (pollId, poll) {
            poll({});
            getOptions.url = baseServicepath + 'Poll/' + 'GetPollById';
            getOptions.data.PollId = pollId;
            var pollObs = ko.observable();
            return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
            function querySucceeded(data) {
                poll(new model.Poll(data));
                return pollObs();
            }
        },

        //#endregion

        //#region get polls by page size
        publicPolls: function (pageNum, pageSize) {
            getOptions.data = {
                pageNum: pageNum,
                pageSize: pageSize
            };
            getOptions.url = baseServicepath + 'Poll/' + 'GetPublicPolls';

            //make callx
            return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
            //handle the ajax callback
            function querySucceeded(data) {
                return data;
            }
        },

      
        //#endregion

        //gets polls that this specific user has voted
        //for. 
        getVotesForUser: function (votesObservable, userId) {
            votesObservable([]);
            getOptions.url = baseServicepath + 'Poll/' + 'GetPollsVotedByUser';
            getOptions.data = { userId: userId }

            //make call
            return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
            //handle the ajax callback
            function querySucceeded(data) {
                var initialPolls = $.map(data, function (item) { return new model.Poll(item) });
                votesObservable(initialPolls);
                return initialPolls;
            }
        },

        initNewPoll: function(poll) {
            //poll({});
            getOptions.url = baseServicepath + 'Poll/' + 'InitNewPoll';
            return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
            function querySucceeded(data) {
                poll(new model.Poll(data));                
                return poll;
            }
        },
       
        flagPoll:function (pollid) {
            getOptions.url = baseServicepath + 'Poll/Flag';
            getOptions.data = { pollId: pollid }
            return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
            function querySucceeded(data) {
                return data;
            }
        },

        savePoll: function (objPoll) {
            postOptions.url = baseServicepath + 'Poll/Create';
            //Prepare the options 
            var dataArray = new Array();
            var length = objPoll().PollOptions().length
            for (var i = 0; i < length; i++) {
                var opt = objPoll().PollOptions().pop();
                dataArray[i] = {
                    OptionId: i,
                    OptionImageTitle: "optionImage" + i,
                    OptionImageUrl: opt.OptionImageUrl(),
                    ViewOrder: length - i
                };
                objPoll().PollOptions().unshift(opt);
            };
            var jsonOptions = {
                options: dataArray
            };
            //jsonOptions["options"] = dataArray

            postOptions.data = {
                Question: objPoll().Question(),
                PollTypeId: objPoll().PollTypeId,
                PollOptions: JSON.stringify(jsonOptions),
                OwnerId: objPoll().OwnerId,
                UploadImageUrl: objPoll().UserProfilePictureUrl,
                Status: 'Publish',
                VisibilityMode: getVisibilityId(objPoll()),
                CategoryID: objPoll().SelectedCategoryId
            };
            return $.ajax(postOptions).then(querySucceeded).fail(queryFailed);
            function querySucceeded(data) {
                var msg = 'Congrtulation! You have successfuly submited your new poll';
                log(msg, data, true);
                $('#createPoll').modal('hide');
                //objPoll(new model.Poll(JSON.parse(data.NewPoll)));
                //objPoll().PollTypeId(1);
                return data;
            }
            function getVisibilityId(objPoll) {               
                if (objPoll.IsPublicPoll)
                    return '0';
                else
                    return '1';
            }
        },

        saveResults: function (opt, poll, data) {
            postOptions.url = baseServicepath + 'Poll/SaveVote';
            //postOptions.data = data;
            if (!data) {
                postOptions.data = {
                    VoteOptionID: opt.OptionId(),
                    ResultOwnerID: config.dnnData.userId,
                    Response: poll().PollResults(),
                }
            } else {
                postOptions.data = data;
            }
            return $.ajax(postOptions).then(querySucceeded).fail(queryFailed);
            function querySucceeded(data) {
                var msg = 'Congrtulation! You have successfuly submited your vote';
                log(msg, data, true);
                //var pollDto = new model.Poll(data.Poll);
                //when polls.js orders the save it passes poll as object 
                //and not as observable
                if (typeof (poll) == 'function') {
                    poll(new model.Poll(data.Poll));
                }                
                return data;
            }
        },

        getWizardData: function (categories, types) {
            //both parameters are observable arrays 
            categories([]);
            types([]);

            var options = {
                type: "GET",
                url: baseServicepath + 'PollWizard/' + 'GetWizardData',
                cache: false,
                beforeSend: config.dnnData.servicesFramework.setModuleHeaders
            };

            //make call
            return $.ajax(options)
                .then(querySucceeded)
                .fail(queryFailed);

            //handle the ajax callback
            function querySucceeded(data) {
                //log('Wizard data was fetched successfuly',data, true);
                initialCategories = $.map(data.Categories, function (item) { return new model.PollCategory(item); });
                InitialTypes = $.map(data.VoteTypes, function (item) { return new model.PollTypeList(item); });
                
                categories(initialCategories);
                types(InitialTypes);

                return data;
            }
        },

        ///Get Poll Member gets the extended member of 
        //dnn's original member
        getPollMember: function (userId) {
            getOptions.url = baseServicepath + 'PollMember/' + 'GetPollMember';
            getOptions.data.userId = userId;
            return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
            function querySucceeded(data) {
                return data;
            }
        },

        getMember: function (userId) {
            var settings = config.dnnMembersSettings;
            var url = settings.baseServicepath + "GetMember";
            var ajaxOptions = {
                type: "GET",
                cache: false,
                data: { userId: userId}
            }
            ajaxOptions.url = url;
            ajaxOptions.beforeSend = settings.membersServicesFramework.setModuleHeaders;
            return $.ajax(ajaxOptions).then(querySucceeded).fail(queryFailed);
            function querySucceeded(member) {
                return member;
            }
        },

        getMembers: function (initialMembers, membersObs, opts) {
            initialMembers = [];
            membersObs([]);
            var settings = config.dnnMembersSettings;
            var url = settings.baseServicepath + "AdvancedSearch";
            var ajaxOptions = {
                type: "GET",
                cache: false,
                data: {
                    userId: settings.userId,
                    groupId: settings.groupId,
                    pageIndex: 0,
                    pageSize: 10,
                    searchTerm1: '',
                    searchTerm2: '',
                    searchTerm3: '',
                    searchTerm4: ''
                }
            }
            ajaxOptions.url = url;
            ajaxOptions.beforeSend = settings.membersServicesFramework.setModuleHeaders;
            return $.ajax(ajaxOptions).then(querySucceeded).fail(queryFailed);
            function querySucceeded(data) {
                initialMembers = $.map(data, function (item) { return new model.Member(item, opts); });
                membersObs(initialMembers);
                return initialMembers;
            }
        },

        ///returns a list of voters id for this poll 
        getVotersForPoll: function (pollId, pageSize) {
            getOptions.url = baseServicepath + 'PollMember/' + 'GetVoters';
            getOptions.data.pollId = pollId;
            getOptions.data.pageSize = pageSize;
            return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
            function querySucceeded(data) { return data;}
        },

        getMembersByRelationship: function (action, userId) {
            getOptions.url = baseServicepath + 'PollMember/' + action;
            getOptions.data = {userId: userId};
            //getOptions.data.pollId = pollId;
            //getOptions.data.pageSize = pageSize;
            return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
            function querySucceeded(data) { return data; }
        },
    }
    return dataservice;

    var getPollOptions = function (pollsOptionObsrv, pollId) {
        //set the ajax call
        var options = {
            type: "GET",
            url: settings.baseServicePath + 'Poll/' + 'GetPollOptions',
            cache: false,
            beforeSend: settings.serviceFramework.setModuleHeaders,
            data: {
                pollId: pollId
            }
        };

        return $.ajax(options)
           .then(querySucceeded)
           .fail(queryFailed);

        //handle the ajax callback
        function querySucceeded(data) {
            var initialData = $.map(data, function (item) { return new PollOption(item) });
            pollsOptionObsrv(initialPolls);
        }
    }

    function queryFailed(xhr, status) {
        var msg = 'Error message';
        logger.logError(msg, xhr, system.getModuleId(dataservice), true);
    };

    function log(msg, data, showToast) {
        logger.log(msg, data, system.getModuleId(dataservice), showToast);
    };
});