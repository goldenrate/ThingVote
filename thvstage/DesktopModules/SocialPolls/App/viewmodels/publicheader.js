define(['durandal/system', 'durandal/plugins/router' ],
    function (system, router, model) {      
        var header = {
            activate: activate,
            router: router,
            viewAttached: viewAttached,
            shell: ko.observable(),

            signup: function myfunction() {
                $('a',config.dnnData.userControlGrp).trigger('click');
            },
            homeUrl: function () {
                return config.dnnData.appUrl.replace('/App.aspx#/', '/');
            },
        }
        return header;

        function activate(routedata) {
            localStorage.mode = 'public';
            router.map(routes);
            return router.activate('index');
        }

        function viewAttached() {

        }
    }
);