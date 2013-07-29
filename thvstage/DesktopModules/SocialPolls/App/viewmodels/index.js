define(['services/logger', 'services/dataservice', 'services/model',
    'config', 'durandal/plugins/router', 'durandal/composition', 'viewmodels/topnav'],
function (logger, dataservice, model, config, router, composition, topnav) {
    var initialized = false;
    var memberInfo = $('#globalParams').data('UserInfo');
    var pollsContainer
    var pageNum = 0;
    var pageSize = 15;

    var pollsModel;

    //polls
    var polls = ko.observable();
    var allPollsData = [];
    //var mostPopular = ko.observable();
    //var byCategory = ko.observable();
    var selectedCategories = ko.observable();

    var index = {
        title:'index',
        activate: activate,
        filter : ko.observable('default'),
        viewAttached: viewAttached,
        searchResults:ko.observable()
    }
    return index;

    function activate(routingData) {
        if (IsAuthenticated) {
            loadPolls();
            index.filter('');
            topnav.selectedCategories.subscribe(function (value) {
                index.filter('byCategory');
                selectedCategories(value);
                loadPolls();
            });
            topnav.byPopular.subscribe(function (value) {
                index.filter('popular');
                if (value == true) {
                    topnav.byPopular(false);
                    loadPolls();
                };
            });
            topnav.searchResults.subscribe(function (value) {
                index.filter('search');
                index.searchResults(value);
                loadPolls();
            })
        } else {
            //load public polls 
            dataservice.publicPolls(pageNum, pageSize).done(function (data) {
                doneLoadingMorePolls(data);
            });
        }
    }

    function viewAttached(view) {
        pollsContainer = $('#pollsContainer', view)[0];
        //loadPolls();           
    }

    function loadPolls() {
        //dataservice.getAllPolls(pollsObservable);
        switch (index.filter()) {
            case 'search':
                var data = index.searchResults();
                applyPollsChanges(data);
                break;
            case 'byCategory':
                var cats = selectedCategories();
                if (!(cats=='')) {
                    dataservice.getPollsByCategories(cats).done(function (data) {
                        applyPollsChanges(data);
                    });
                } else {
                    index.filter('default');
                    applyPollsChanges(allPollsData);
                }
                break;
            case 'popular':
                var method = 'GetPublicPollsByPopular';
                
                break;
            default:
                loadDefaultQuery();
                break;
        }

        function loadDefaultQuery() {
            dataservice.getPublicPolls().done(function (data) {
                doneGettingPolls(data);
            });           
        }

        function applyPollsChanges(data) {
            var initialPolls = $.map(data.polls, function (item) { return new model.Poll(item) });           
            pollsModel.Polls(initialPolls);
            setTimeout(function () {
                $(pollsContainer).masonry('reload');
            }, 300);
            //doneGettingPolls(data);
        }
        
    };

    function doneGettingPolls(data) {
        var initialPolls = $.map(data.polls, function (item) { return new model.Poll(item) });
        allPollsData = data;
        var settings = {
            //container: vm.container(),
            model: 'viewmodels/polls',
            view: 'views/polls.html',
            beforeBind: function (elem, v, st) {
                st.model.Polls([]);
                st.model.Polls(initialPolls);
                st.model.activate();
            },
            afterCompose: function (p, nc, st) {
                //if (initialized) {
                //    localStorage.pageNume
                //}
                initialized = true;
                pollsModel = st.model;
                var pollsContainer = $(p);
                pollsContainer.imagesLoaded(function () {
                    var images = $('div.previewImageContainer', pollsContainer);
                    //$.each(images, function (index, value) {
                    //    var li = $(value).parent();
                    //    var position = $(value).position();
                    //    var h = $(value).height();
                    //    var action = $(value).siblings().filter(':visible');
                    //    var ah = action.height();
                    //    //var bottomPosi
                    //    li.css('height', li.height() - 30);
                    //    li.css('margin-bottom', '6px');
                    //})
                    pollsContainer.masonry(config.appSettings.pollsMasonry);
                    pageNum++;
                });
                //st.model.deactivate();
            }
        };
        composition.compose(pollsContainer, settings);        
    }

    //#region LOAD POLLS IN BULKS
    function doneLoadingMorePolls(data) {
        var initialPolls = $.map(data.polls, function (item) { return new model.Poll(item) });
        allPollsData = data;
        var settings = {
            //container: vm.container(),
            model: 'viewmodels/polls',
            view: 'views/polls.html',
            beforeBind: function (elem, v, st) {
                if (pageNum == 0){
                    st.model.Polls([]);               
                    st.model.Polls(initialPolls);
                } else {
                    $.each(initialPolls, function (i, item) {
                        st.model.Polls.push(item);
                    })
                }
                st.model.activate();
            },
            afterCompose: function (p, nc, st) {
                //if (initialized) {
                //    localStorage.pageNume
                //}
                initialized = true;
                pollsModel = st.model;
                var pollsContainer = $(p);
                pollsContainer.imagesLoaded(function () {
                    var images = $('div.previewImageContainer', pollsContainer);
                    pollsContainer.masonry(config.appSettings.pollsMasonry);
                    
                });
                pageNum++;
                //st.model.deactivate();
            }
        };
        composition.compose(pollsContainer, settings);
    }
 
    //#endregion 

});