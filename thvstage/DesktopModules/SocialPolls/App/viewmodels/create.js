/// <reference path="../services/model.js" />

define(['services/logger', 'services/dataservice',
    'services/model', 'config', 'viewmodels/polls', 'durandal/composition'],
function (logger, dataservice, model, config, polls, composition) {
    var initialized = false;
    var pollBlueprints = ko.observableArray();

    var categories = ko.observableArray();
    var types = ko.observableArray();
    var currentPoll = ko.observable({});
    var pollBlueprint = ko.observable();
    var modalView = ko.observable();
    //var selectedTypeId = ko.observable(-1);
    var domElementId;
 
    //wizard 
    var totalSteps = 3;
    var startingStep = 1;

    var validationErrors = ko.observableArray();
    var isDirty = ko.observable(false);
    //var isValid = ko.observable();
    var memberInfo = $('#globalParams').data('UserInfo');
    var FB = $('#fb-root').data('facebookObj').FB;

    var wizard = {
        title: 'Create Poll',
        activate: activate,

        UserProfilePictureUrl: memberInfo.PhotoURL,
        DisplayName: config.CurrentUser.DisplayName,

        //Poll Types
        PollTypeList: types,
        SelectedTypeId: ko.observable().extend({required:true}),
        SelectTypeId: selectTypeId,
        

        ///Region: depricated
        PollCategories: categories,
        CreatedPoll: ko.observable({}),
        ///depricated 

        //Wizard functionality 
        Reset: reset,
        IsReset: ko.observable(false),
        Initialized: initialized,

        EditPoll: ko.observable(true),

        IsFirstStep: ko.observable(true),
        IsInBetweenStep: ko.observable(false),
        IsLastStep: ko.observable(false),
        CurrentStep: ko.observable(1),
        PreviousStep: ko.observable(),
        NextStep: ko.observable(2),
        GoNext: next,
        GoPrevious: previous,
        SavePoll: savePoll,
        HideForSteps: ko.observable(true),

        //activate steps
        activateStep2: ko.observable(false),
        editpoll: ko.observable(),

        //validations       
        ValidationErrors: validationErrors,       
        IsDirty: isDirty,
        rules: {},
        messages: {},
        errors: {},

        viewAttached: viewAttached,
        ModalView: modalView        
    };
    return wizard;
   
    
    //#region Internal Methods
    function activate() {
        if (wizard.IsDirty()) {
            wizard.editpoll().Poll = wizard.CreatedPoll();
            composeEdit(false);
        };

        if (initialized) { return; }
        //isValid = wizard.ValidationModel.isValid();
        dataservice.getWizardData(categories, types)
            .done(function () {
                reset();
                initialized =true;
            });
        //reset();  
        return;
    }

    function viewAttached(view) {
    }

    //Utilities functions 
    function selectTypeId(typeId) {
        wizard.SelectedTypeId(typeId);
        dataservice.initNewPoll(pollBlueprint)
          .done(function () {             
              pollBlueprint().setTypeRelatedProperties(typeId);
              wizard.CreatedPoll(pollBlueprint());
              //prepare validate
              wizard.CreatedPoll().Question();
              composeEdit(true);
          });
    };

    function composeEdit(withNext) {
        //compose the second stage 
        var element = $('#step-2')[0]
        var settings = {
            model: 'viewmodels/poll/editpoll',
            beforeBind: function (elem, view, st) {
                st.model.Poll = wizard.CreatedPoll();
                st.model.PollTypeId(wizard.SelectedTypeId());
                
                if (st.model.Poll.IsSelectionPoll()) {
                    st.model.tnMaxHeight(config.thumbnail.prevSelect.h);
                    st.model.tnMaxWith(config.thumbnail.prevSelect.w);
                } else {
                    st.model.tnMaxHeight(config.thumbnail.prevOthers.h);
                    st.model.tnMaxWith(config.thumbnail.prevOthers.w);
                };
                //config.form.rules = config.editPoll.rules;
            },
            afterCompose: function (p, nc, st) {
                st.model.activate(true);
                isDirty(true);
                wizard.editpoll(st.model);
                withNext ? next(): null;
            }
        };
        composition.compose(element, settings);
    }
   
    function savePoll() {
        var objPoll = wizard.CreatedPoll();
        dataservice.savePoll(objPoll)
            .done(function (data) {
                polls.AddPoll(objPoll);
                //polls.refresh();
                reset();
            });;
    };

    function reset() {
        wizard.CurrentStep(1);
        wizard.PreviousStep (-1);
        wizard.IsFirstStep(true);
        wizard.IsLastStep(false);
        wizard.IsInBetweenStep(false);
        wizard.SelectedTypeId();
        //wizard.IsReset(true); 
        wizard.IsReset(true);

        //get the poll
       
        $('#TypeSelectorControl a.active').removeClass('active');
    }

    function next() {        
        //if (!wizard.IsValid()) { return; }
        //var sender = $(event.target);       
        var toStep = wizard.CurrentStep() + 1;
        //
        changeStep(toStep);
    }   

    function previous() {
        var sender = $(event.target);
        var toStep = wizard.CurrentStep() - 1;
        changeStep(toStep);
    }

    function changeStep(toStep) {
        var fromStep = wizard.CurrentStep();
        //tag the next step 
        wizard.IsFirstStep(toStep == startingStep);
        wizard.IsLastStep(toStep == totalSteps);
        wizard.IsInBetweenStep(toStep > startingStep && toStep <= totalSteps);

        switch (toStep) {
            case 2:
                wizard.activateStep2(true);
                break;
            case 3:
                composeStep3(toStep, fromStep);
                break;
            default:
            
        }
        wizard.CurrentStep(toStep);
        wizard.PreviousStep(fromStep);
        //update the wizard
    }

    function validateStep(step) {
        switch (step) {
            case 1:
                break;
            case 2:
                break;
            default:
                break;
        }
    }

    function composeStep2() {

    }

    function composeStep3(to, from) {
        var elem = $('#pollPreview')[0];
        var settings = {
            model: wizard.CreatedPoll(),
            view:'views/PollPreview',
            toStep: to,
            fromStep: from,
            afterCompose: function (p, nc, st) {
                wizard.CurrentStep(st.toStep);
                wizard.PreviousStep(st.fromStep);
            }
        };
        composition.compose(elem, settings);    }
   
    //#endregion
});