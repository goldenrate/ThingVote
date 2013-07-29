define(['durandal/system', 'durandal/plugins/router' ],
    function (system, router, model) {
        var routes = [
            { url: 'index', moduleId: 'viewmodels/index', name: 'Index', visible: true },
            { url: 'polls', moduleId: 'viewmodels/polls', name: 'Polls', visible: true },
            { url: 'polldetail/:id', moduleId: 'viewmodels/polldetail', name: 'Poll Detail', visible: true },
        ];
        var publicshell = {
            activate: activate,
            router: router,
            viewAttached: viewAttached,
            model: ko.observable(),
        }
        return publicshell;

        function activate(routedata) {
            localStorage.mode = 'public';
            router.map(routes);
            return router.activate('index');
        }

        function viewAttached() {

        }
    }
);