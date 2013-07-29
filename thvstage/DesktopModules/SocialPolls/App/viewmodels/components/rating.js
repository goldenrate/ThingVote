/// <reference path="../services/dataservice.js" />
define(['services/logger', 'services/dataservice', 'services/model', 'config'],
function (logger, dataservice, model, config) {
    var app = require('durandal/app');
    var initialized = false;
    var stars = ko.observableArray();
    var isReadOnly;
    var starsNum = 5;
    var rating=ko.observable();

    var rating = {
        activate: activate,
        StarsNumber: starsNum,
        stars: stars,
        IsReadOnly: isReadOnly,
        Rating: rating,
        viewAttached: function () {
            //logger.log('entering masonry', null, system.getModuleId(shell), true);
            var $container = $('#pollsContainer');
            $container.imagesLoaded(function () {
                $container.masonry({
                    itemSelector: '.pollItem',
                    columnWidth: 244
                    //isFitWidth: true,
                    //isResizable: true
                });
            });
        }
    };

    return rating;

    function activate() {
        if (initialized) { return; }
        initialized = true;
        init();
    };

    function init() {
        var starsArray = new Array();
        for (var i = 0; i < starsNum; i++) {
            var star = {id: i,rateSelected: rateSelected};
            starsArray[i] = star;
        }
        rating.stars(starsArray);
    };

    function rateSelected() {
        var sender = $(event.target);
        var id = sender.attr('id');
        sender.addClass("starSelected")
    }
   
});