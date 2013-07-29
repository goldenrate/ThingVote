define(['durandal/system'],
    function (system) {
        var dove = {
            init: init
        };
        return dove;

        function init() {
            rating();
            masonry();
            uploadHandler();
            toggleButtons();
            charLeft();
            validator();
            validatorMethods();
        }

        function validatorMethods() {
            $.validator.addMethod("valueNotEquals", function (value, element, arg) {
                return arg != value;
            }, "Value must not equal arg.");

            $.validator.addMethod('filesize', function (value, element, param) {
                // param = size (en bytes) 
                // element = element to validate (<input>)
                // value = value of the element (file name)
                return this.optional(element) || (element.files[0].size <= param)
            });

            $.validator.addMethod("noImagePH", function (value, element, arg) {
                //the input is always 1 level below the image upload scope
                var uploadScope = $(element).parent();
                if (!uploadScope.data('initiated')){
                    uploadScope.data('initiated', true);
                    uploadScope.data('count', 0);
                } else {
                    var count = uploadScope.data('count');
                    //count the number of rendered list items
                    var length = $('ul li', uploadScope).length;
                    if (length > 1) {
                        //this is a select poll
                        var validCount = 0;
                        for (var i = 0; i < length; i++) {
                            var el = $('ul li', uploadScope)[i];
                        }
                    } else {
                        //this is non-select poll 
                        return $('ul li', uploadScope).attr('src')
                            .indexOf(arg) !== -1;
                    }
                }
                return arg != value;
            }, "Must upload minimum number of pictures");
        }

        function rating() {
            ko.bindingHandlers.starRating = {
                init: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
                    var jElement = $(element);
                    var allBinding = allBindingsAccessor();

                    jElement.append('<span class="rating">');
                    var starsContainer = $('.rating', jElement);

                    for (var i = 1; i < allBinding.numOfStars + 1 ; i++) {
                        starsContainer.prepend('<span class="star" id="' + (i) + '" />');
                    }

                    ///handle the case where it is an active control
                    if (!allBinding.isDisplay) {
                        $('.star', starsContainer).click(function () {
                            var handleAfterRating = allBinding.handleAfterRating;
                            var ratingObservable = valueAccessor();
                            $(this).toggleClass('starSelected');
                            rating = $(event.target).attr('id');
                            ratingObservable(rating);
                            handleAfterRating(ko.contextFor(event.target), rating);
                        });
                    } else {
                        var value = ko.utils.unwrapObservable(valueAccessor());
                        if (value) {
                            $('#' + value, jElement).toggleClass('starSelected');
                        }
                    }
                },
                update: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
                    var value = ko.utils.unwrapObservable(valueAccessor());
                    var allBinding = allBindingsAccessor();
                    ////remove the starSelected class from all the spans and add the new value 
                    var starSender = $('#' + value, element);
                    var senderHasntGotSelectedClass = !starSender.hasClass('starSelected');
                    if (senderHasntGotSelectedClass) {
                        //then remove the one with the class
                        $('span.starSelected', element).removeClass('starSelected');
                        starSender.addClass('starSelected');
                    } else {
                        $('span.starSelected', element).removeClass('starSelected');
                        starSender.toggleClass('starSelected');
                    }
                }
            };
        }

        //provides the options to the input that handles the upload as well as the handler for
        //when it's done 
        function uploadHandler() {
            ko.bindingHandlers.uploadHandler = {
                init: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
                    var uploadScope = $(element);
                    var input = $('input', uploadScope);
                    var trigger = $('button', uploadScope);
                    var progressBar = $('.bar', uploadScope);
                    var progressContainer = $('.progress', uploadScope);
                    var doneUploadHandler = valueAccessor();
                    var allBinding = allBindingsAccessor();
                    var tnmxW = allBinding.tnMaxW;
                    var tnmaxH = allBinding.tnmaxH;
                    var hndlerUrl = allBinding.fileHandlerUrl().replace('{0}', tnmxW).replace('{1}', tnmaxH);
                    //we store the options in the binding but most of the options do not change
                    var uploadOptions = {
                        replaceFileInput: false,
                        dataType: 'json',
                        done: doneUploadHandler,
                        url: hndlerUrl,
                        singleFileUploads: allBinding.isSingle,
                        limitMultiFileUploads: allBinding.limitMFUploads,
                        maxFileSize: 2000000,
                        progress: function (e, data) {
                            var progress = parseInt(data.loaded / data.total * 100, 10);
                            progressBar.css('width', progress + '%');
                            //replace text in button
                            ////trigger.text('');
                            ////trigger.append('<span class=icon-spinner icon-spin icon-large>loading...</span>');
                            ////var done = progress = 100;
                            ////if (done) {
                            ////    progressBar.css('width', 0);
                            ////    trigger.text('browse...');
                            ////}
                        }
                    };
                    input.fileupload(uploadOptions);
                    trigger.on('click', function (event) {
                        input.fileupload(uploadOptions);
                        input.trigger('click');
                    });
                }
            };
        }

        function validator() {
            var initialized = 'init';
            ko.bindingHandlers.validator = {
                init: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
                    var selector = $('.required-field', element);
                    //an array of all the objects that are in the current form 
                    var childForm = valueAccessor();
                    var allBinding = allBindingsAccessor();
                    var form = $('#Form');

                    var rules = allBinding.rules;
                    var messages = allBinding.messages;
                    var errorPlacement = allBinding.errorPlacement;
                    var submitHandler = allBinding.submitHandler;
                    var success = allBinding.success;
                    var highlight = allBinding.highlight;

                    var isValid;
                    switch (selector.prop('tagName').toLowerCase()) {                        
                        case 'select':
                            selector.change(function myfunction() {
                                var val = $(this).find(':selected').val();
                                isValid = form.validate().element(selector);
                            });
                            break;
                        default:
                            break;
                    }

                    var obj = {
                        id: selector.attr('id'),
                        element: selector,
                        isValid: false
                    }
                    childForm.push(ko.observable(obj));
                },
                update: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
                    var selector = $(element);
                }
            };


        }

        function masonry() {
            ko.bindingHandlers.masonry = {
                init: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
                    var itemSelector = ko.utils.unwrapObservable(valueAccessor());
                    $container = $(element);
                    //$container.imagesLoaded(function () {
                    //    $container.masonry({
                    //        itemSelector: itemSelector,
                    //        columnWidth: 244,
                    //        isAnimated: true,
                    //        isFitWidth: true,
                    //        isResizable: true
                    //    });
                    //});
                },
                update: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
                    var activate = ko.utils.unwrapObservable(valueAccessor());
                    if (activate) { }
                    //$container = $(element);
                    //$container.masonry('reload');
                }
            };
        }

        function toggleButtons() {

            ///elemet - is the div that marked as "btn-group" and holds the two buttons:on, off, as a direct
            //decendents (children)
            //value accessor - on or off             
            ko.bindingHandlers.toggleButtons = {
                init: function (element, valueAccessor, allBindingsAccessor, viewModel,
                    bindingContext) {
                    var container = $(element);
                    //get allbinding values
                    var selected = ko.utils.unwrapObservable(valueAccessor()).toLowerCase();
                    allBinding = allBindingsAccessor();
                    var on = allBinding.On().toLowerCase();
                    var off = allBinding.off().toLowerCase();
                    var clickHandler = allBinding.clickHandler;
                    container.on('click', 'button', clickHandler);

                    //we now select the buttons and set the one to be active
                    var onButton = $('button:first-child', element);
                    var offButton = $('button:last-child', element);
                    if (selected == "yes")
                        onButton.toggleClass('active');
                    else
                        offButton.toggleClass('active');

                },
                update: function (element, valueAccessor, allBindingsAccessor,
                    viewModel, bindingContext) {
                    var container = $(element);
                    var selected = ko.utils.unwrapObservable(valueAccessor()).toLowerCase();
                    var button = $('button', container);
                    //button.toggleClass('active');

                }
            };
        }

        (function resultsIndicator() {
            ko.bindingHandlers.resultsIndicator = {
                init: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
                    var container = $(element);
                    var results = valueAccessor();
                    container.append('<i>').addClass(function () {
                        if (results)
                            return 'icon-ok';
                        else
                            return 'icon-remove';
                    });
                },
                update: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {

                }
            };
        })();

        function charLeft() {
            ko.bindingHandlers.charLeft = {
                init: function (element, valueAccessor, allBindingsAccessor) {
                    var textarea = $(element);
                    var currentValue = ko.utils.unwrapObservable(valueAccessor());
                    var allbindings = allBindingsAccessor();
                    var maxLength = allbindings.maxLength;
                    var msgElement = $('#' + allbindings.messageId);
                    textarea.on('keyup blur', function () {
                        var text = textarea.val();
                        var charLeft = maxLength - text.length;
                        var msgElement = $('#charLeft', $(this).parent());
                        msgElement.text(charLeft);
                        textarea.val(text.substring(0, maxLength - 1));
                        valueAccessor(text.substring(0, maxLength - 1));
                    });
                },

                update: function (element, valueAccessor, allBindingsAccessor) {
                }
            };
        };



    });