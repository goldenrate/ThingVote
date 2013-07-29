define(['services/logger', 'services/dataservice', 'services/model',
    'config', 'durandal/plugins/router'],
function (logger, dataservice, model, config, router) {
    var opts = $.extend({}, config.membersDefaultSettings, config.dnnMembersSettings);
    var serviceFramework = config.dnnData.servicesFramework;
    var pageIndex = 0;
    var pageSize = opts.pageSize;
    var userId = opts.userId;
    var groupId = opts.groupId;
    var viewerId = opts.viewerId;
    var profileUrl = opts.profileUrl;
    var profileUrlUserToken = opts.profileUrlUserToken;
    var profilePicHandler = opts.profilePicHandler;
    var containerElement = null;

    var initialMembers;
    var _members = ko.observableArray();
    var _followers = ko.observableArray();
    var _following = ko.observableArray();


    var members = {
        activate: activate,
        Refresh: refreshMembers,
        Members: _members,
        Followers: _followers,
        Following: _following,
        CurrentUser: ko.observable(),
        Visible: ko.observable(true),
        //CanLoadMore: ko.observable(initialMembers.length == pageSize),
        SearchTerm: ko.observable(''),
        ResetEnabled: ko.observable(false),

        HasMembers: ko.computed(function () {
            return _members().length > 0;
        }),

        AdvancedSearchTerm1: ko.observable(''),
        AdvancedSearchTerm2: ko.observable(''),
        AdvancedSearchTerm3: ko.observable(''),
        AdvancedSearchTerm4: ko.observable(''),

        LastSearch: ko.observable('Advanced'),

        loadingData: ko.observable(false),

        //Action Methods
        advancedSearch: function () {
            pageIndex = 0;
            self.SearchTerm('');

            self.xhrAdvancedSearch();
            self.LastSearch('Advanced');
            self.ResetEnabled(true);
        },

        basicSearch: function () {
            pageIndex = 0;
            self.AdvancedSearchTerm1('');
            self.AdvancedSearchTerm2('');
            self.AdvancedSearchTerm3('');
            self.AdvancedSearchTerm4('');

            self.xhrBasicSearch();

            self.LastSearch('Basic');
            self.ResetEnabled(true);
        },

        getMember: function (item) {
            self.SearchTerm(item.value);
            $.ajax({
                type: "GET",
                cache: false,
                url: opts.baseServicepath + "GetMember",
                beforeSend: serviceFramework.setModuleHeaders,
                data: {
                    userId: item.userId
                }
            }).done(function (members) {
                if (typeof members !== "undefined" && members != null) {
                    var mappedMembers = $.map(members, function (member) { return new Member(member); });
                    self.Members(mappedMembers);
                    self.CanLoadMore(false);
                } else {
                    displayMessage(settings.serverErrorText, "dnnFormWarning");
                }
            }).fail(function (xhr, status) {
                displayMessage(settings.serverErrorWithDescriptionText + status, "dnnFormWarning");
            });
        },

        getSuggestions: function (term, response) {
            $.ajax({
                type: "GET",
                cache: false,
                url: opts.baseServicepath + "GetSuggestions",
                beforeSend: serviceFramework.setModuleHeaders,
                data: {
                    groupId: groupId,
                    displayName: term
                }
            }).done(function (data) {
                response(data);
            }).fail(function () {
                displayMessage(settings.searchErrorText, "dnnFormWarning");
                response({}); // From jQuery UI docs: You must always call the response callback even if you encounter an error
            });
        },

        handleAfterRender: function (elements, data) {
            for (var i in elements) {
                var element = elements[i];
                if (element.nodeType == 1) {
                    var config = {
                        over: function () {
                            $(this).find("div[id$='popUpPanel']").fadeIn("slow");
                        },
                        timeout: 500,
                        out: function () {
                            $(this).find("div[id$='popUpPanel']").fadeOut("fast");
                        }
                    };
                    $(element).hoverIntent(config);
                }
            }
        },

        isEven: function (item) {
            return (self.Members.indexOf(item) % 2 == 0);
        },

        loadMore: function () {
            pageIndex++;
            if (self.LastSearch() === 'Advanced') {
                self.xhrAdvancedSearch();
            }
            else {
                self.xhrBasicSearch();
            }
        },

        resetSearch: function () {
            self.SearchTerm('');
            self.AdvancedSearchTerm1('');
            self.AdvancedSearchTerm2('');
            self.AdvancedSearchTerm3('');
            self.AdvancedSearchTerm4('');

            self.xhrAdvancedSearch();
            self.LastSearch('Advanced');
            self.ResetEnabled(false);
        },

        xhrAdvancedSearch: function () {
            $.ajax({
                type: "GET",
                cache: false,
                url: opts.baseServicepath + "AdvancedSearch",
                beforeSend: serviceFramework.setModuleHeaders,
                data: {
                    userId: userId,
                    groupId: groupId,
                    pageIndex: pageIndex,
                    pageSize: pageSize,
                    searchTerm1: self.AdvancedSearchTerm1(),
                    searchTerm2: self.AdvancedSearchTerm2(),
                    searchTerm3: self.AdvancedSearchTerm3(),
                    searchTerm4: self.AdvancedSearchTerm4()
                }
            }).done(function (members) {
                if (typeof members !== "undefined" && members != null) {
                    var mappedMembers = $.map(members, function (item) { return new Member(item); });
                    if (pageIndex === 0) {
                        self.Members(mappedMembers);
                    } else {
                        for (var i = 0; i < mappedMembers.length; i++) {
                            self.Members.push(mappedMembers[i]);
                        }
                    }
                    self.CanLoadMore(mappedMembers.length == pageSize);
                } else {
                    displayMessage(settings.searchErrorText, "dnnFormWarning");
                }
            }).fail(function (xhr, status) {
                displayMessage(settings.searchErrorText, "dnnFormWarning");
            });
        },

        xhrBasicSearch: function () {
            $.ajax({
                type: "GET",
                cache: false,
                url: opts.baseServicepath + "BasicSearch",
                beforeSend: serviceFramework.setModuleHeaders,
                data: {
                    groupId: groupId,
                    searchTerm: self.SearchTerm(),
                    pageIndex: pageIndex,
                    pageSize: pageSize
                }
            }).done(function (members) {
                if (typeof members !== "undefined" && members != null) {
                    var mappedMembers = $.map(members, function (item) { return new Member(item); });
                    if (pageIndex === 0) {
                        self.Members(mappedMembers);
                    } else {
                        for (var i = 0; i < mappedMembers.length; i++) {
                            self.Members.push(mappedMembers[i]);
                        }
                    }
                    self.CanLoadMore(mappedMembers.length == pageSize);
                } else {
                    displayMessage(settings.searchErrorText, "dnnFormWarning");
                }
            }).fail(function (xhr, status) {
                displayMessage(settings.searchErrorText, "dnnFormWarning");
            });
        },
    }
    return members;

    function activate(routeData) {
        var mode = routeData.mode;
        mode ? refreshMembers() : null;
    }

    function populateUserFollowers(userId) {
        if (_members) {
            var query = new Array();
            ko.utils.arrayForEach(_members(), function (member) {
                if (member.FollowingStatus() == 2) {
                    query.push(member);
                }
            });
            _following(query);
        };
    }
    
    function refreshMembers() {
        dataservice.getMembers(initialMembers, _members, opts)
               .done(function (data) {
                   //set the current user 
                   var query = $.grep(data, function (m) {
                       return (m.MemberId == userId);
                   });
                   members.CurrentUser(query[0]);
                   //register all search functions
        });
    }

    function init() {
        //load initial state of inbox
        var settings = config.dnnMembersSettings;
        var url = settings.opts.baseServicepath + 'MemberDirectory/' + "AdvancedSearch";
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
        $.ajax(ajaxOptions).done(function (data) {
            if (typeof data !== "undefined" && data != null) {
                //var viewModel = new MemberDirectoryViewModel(members);
                initialMembers = $.map(data, function (item) { return new model.Member(item, opts); });
                members.Members(initialMembers);

                //Basic Search
                $('input#mdBasicSearch').autocomplete({
                    source: function (request, response) {
                        self.getSuggestions(request.term, response);
                        return;
                    },
                    minLength: 1,
                    select: function (event, ui) {
                        self.getMember(ui.item);
                    }
                });

                //Advanced Search
                $('a#mdAdvancedSearch').click(function (event) {
                    event.preventDefault();
                    $('div#mdAdvancedSearchForm').slideDown();
                    $(this).addClass("active");
                    $(".mdSearch").addClass("active");
                });

                var timer;
                var cursorIsOnAdvancedSearchForm;
                $('a#mdAdvancedSearch').mouseleave(function () {
                    timer = setTimeout(function () {
                        if ($('div#mdAdvancedSearchForm').is(':visible') && !cursorIsOnAdvancedSearchForm) {
                            $('div#mdAdvancedSearchForm').hide();
                            $(this).removeClass("active");
                            $(".mdSearch").removeClass("active");
                        }
                    }, 150);

                });
                $('div#mdAdvancedSearchForm').mouseenter(function () {
                    cursorIsOnAdvancedSearchForm = true;
                });
                $('div#mdAdvancedSearchForm').mouseleave(function () {
                    clearTimeout(timer);
                    cursorIsOnAdvancedSearchForm = false;
                    $(this).hide();
                    $('a#mdAdvancedSearch').removeClass("active");
                    $(".mdSearch").removeClass("active");
                });

                //Compose Message
                //$.fn.dnnComposeMessage({
                //    openTriggerSelector: containerElement + " .ComposeMessage",
                //    onPrePopulate: function (target) {
                //        var context = ko.contextFor(target);
                //        var prePopulatedRecipients = [{ id: "user-" + context.$data.UserId(), name: context.$data.DisplayName() }];
                //        return prePopulatedRecipients;
                //    },
                //    servicesFramework: serviceFramework
                //});
            } else {
                displayMessage(settings.serverErrorText, "dnnFormWarning");
            }
        }).fail(function (xhr, status) {
            displayMessage(settings.serverErrorWithDescriptionText + status, "dnnFormWarning");
        });
    };

});