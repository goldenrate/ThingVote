define(['services/logger', 'durandal/system', 'config', 'services/model'],
function (logger, system, config, model) {
    var getOptions = { dataType: 'text', type:'GET' };

    var scraper = {

        getHtml: function (url) {
            getOptions.url = url;
            return $.ajax(getOptions).then(querySucceeded).fail(queryFailed);
            function querySucceeded(data) {
                //response($(data).find(selector)[0]);
                return data;
            }
        },

    };
    return scraper;

    function queryFailed(xhr, status) {
        var msg = 'Error message';
        logger.logError(msg, xhr, system.getModuleId(scraper), true);
    };

    function log(msg, data, showToast) {
        logger.log(msg, data, system.getModuleId(scraper), showToast);
    };

});