/// <reference path="jquery-1.6.4.min.js" />
/// <reference path="knockout-2.2.1.debug.js" />
(function dove() {
    ko.bindingHandlers.parameters = {
        init: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
            // This will be called when the binding is first applied to an element
            // Set up any initial state, event handlers, etc. here
            var mainData = valueAccessor();
            $(element).data('main', mainData);
        },
        update: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
            // This will be called once when the binding is first applied to an element,
            // and again whenever the associated observable changes value.
            // Update the DOM element based on the supplied values here.
        }
    };

})();