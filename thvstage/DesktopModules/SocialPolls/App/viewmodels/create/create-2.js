define(['services/logger', 'services/dataservice', 'services/util',
    'services/model', 'config', 'viewmodels/create'],
function (logger, dataservice, util, model, config, wizard) {
    var initialized = false;

    var editpoll = {
        //events
        activate: activate,
        viewAttached: viewAttached,
        //TriggerInputClick: triggerInputClick,

        //poll related properties 
        Wizard: wizard,
        Poll: wizard.CreatedPoll(),
        PollOptions: wizard.CreatedPoll().PollOptions

    };
    return editpoll;

    function activate() {
        if (initialized) { return; };
        initialized = true;
        
    }

    function viewAttached(view) {
    };

   

   


});