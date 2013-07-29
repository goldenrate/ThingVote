var approot = '../../../../../desktopmodules/socialpolls/app/';
require.config({
    baseUrl: approot,
    paths: {
        "text": "durandal/amd/text",
        //"model": approot + "services/model",
        //"router": approot + 'durandal/plugins/router',       
    }
});

define(function (require) {
    var system = require('durandal/system'),
        app = require('durandal/app'),
        router = require('durandal/plugins/router'),
        logger = require('services/logger'),
        viewLocator = require('durandal/viewLocator');
        

    system.debug(true);
    app.start().then(function () {
        router.useConvention();
        viewLocator.useConvention();
        app.setRoot('viewmodels/publicshell');

        router.handleInvalidRoute = function (route, params) {
            logger.logError('No route found', route, 'main', true, 'error');
        }
    });
});