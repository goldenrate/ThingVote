require.config({
    paths: {
        "text": "durandal/amd/text",
        "moment": "Scripts/moments",
        "addthis": "//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5169b23564677551"
    }
});

define(function (require) {
    var system = require('durandal/system'),
        app = require('durandal/app'),
        router = require('durandal/plugins/router'),
        viewLocator = require('durandal/viewLocator'),
        logger = require('services/logger');

    system.debug(true);
    app.start().then(function () {
        router.useConvention();
        viewLocator.useConvention();
        app.setRoot('viewmodels/shell');

        router.handleInvalidRoute = function(route, params) {
            logger.logError('No route found', route, 'main', true, 'error');
        }
    });


});