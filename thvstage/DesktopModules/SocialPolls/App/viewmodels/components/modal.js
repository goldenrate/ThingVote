define(['services/logger', 'viewmodels/shell'],
function (logger,shell) {
    var modalView = ko.observable({});
    var modalBodyElement = ko.observable();
    var modalId = ko.observable();
    var modalHeader= ko.observable();

    //function to handle close and the save events
    var closeHandler = ko.observable();
    var saveHandler = ko.observable();
    var callback;
    var modal = {
        activate: activate,
        modalId: modalId,
        modalBody: ko.observable([]),
        modalBodyId:ko.observable(),
        modalBodyElement: modalBodyElement,
        closeModal: ko.observable(),
        save: ko.observable(),
        modalHeader:modalHeader,

        viewAttached: viewAttached,
        ModalView: modalView,

        //buttons
        showFooter:ko.observable(true),
        showClose: ko.observable(true),
        showSave: ko.observable(true),
        //the callback is the function the client orders on save
        saveHandler: saveHandler,

        ///modal alerts
        alert: ko.observable(),
        alertVis: ko.observable(false),
        hideAlert:hideAlert,
        alertClass: ko.observable(),
        close:close
    };
    return modal;
    
    function activate() {
        //reset 
        modal.alertVis(false);
    }

    function viewAttached(view) {
        //update subscribers
        modalView(view);
        $(view).draggable();

        //add handlers
        $(view).on('click', '#btnSave', function () {
            //first execute the provided handler and then
            //close the modal 
            var callback = modal.saveHandler();
            if (callback) { callback() };
        })
    }

    function hideAlert() {
        modal.alertVis(false);
    }

    function close() {
        $(modalView()).modal('hide');
    }

});