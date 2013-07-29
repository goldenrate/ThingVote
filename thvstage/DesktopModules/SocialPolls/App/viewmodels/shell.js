/// <reference path="durandal/amd/require.js" />
/// <reference path="durandal/system.js" />
define(['durandal/system', 'services/logger', 'durandal/plugins/router',
    'config', 'services/dove','services/dataservice', 'services/model' ],
    function (system, logger, router, config, dove, dataservice, model) {
        var initialized = false;
        var composition = require('durandal/composition');
        //var userInfo = require('viewmodels/profile/profile');
        var opts = $.extend({}, config.membersDefaultSettings,config.dnnMembersSettings);
        var memberInfo = ko.observable();

        var shell = {
            activate: activate,
            router: router,
            viewAttached: viewAttached,

            //globals 
            MemberInfo: memberInfo
        };
        return shell;

        function activate() {
            if (config.dnnData.isAuthenticated) {

            }
            localStorage.mode = 'user';
            if (initialized) { return };
            logger.log('app loaded', null, system.getModuleId(shell), true);
            dove.init();
            router.map(config.routes);
            var status = router.activate(config.startModule);
            return status;
        }

        function viewAttached(view) {
            if (config.dnnData.isAuthenticated()) {
                populateGlobals(view);
            } else {
                var elem = $('header', view)[0];
                var settings = {
                    model: 'viewmodels/publicheader',
                    beforeBind: function (elem, view, st) {
                        //st.model.CurrentUser = shell.MemberInfo;
                    },
                    afterCompose: function (p, nc, st) {
                        //st.model.activate(shell);
                    }
                };
                composition.compose(elem, settings);
            }
        }

        function populateGlobals(view) {
            dataservice.getPollMember(config.dnnData.userId).done(function (data) {
                var initialMember = new model.Member(data[0], opts);
                shell.MemberInfo(initialMember);
                $('#globalParams').data('UserInfo', shell.MemberInfo());
                var elem = $('header', view)[0];
                var settings = {
                    model: 'viewmodels/topnav',
                    beforeBind: function (elem, view, st) {
                        st.model.CurrentUser = shell.MemberInfo;
                    },
                    afterCompose: function (p, nc, st) {
                        st.model.activate(shell);
                    }
                };
                composition.compose(elem, settings);
            });
        }

      
    }
);