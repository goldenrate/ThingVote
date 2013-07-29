define(['services/logger'],
function (logger) {
    var fbObj = $('#fb-root').data('facebookObj');
    var FB = fbObj.FB;

    var invite = {
        activate:activate
    }
    return invite;
    
    function activate() {
        if (FB) {
            FB.ui({
                method: 'apprequests',
                title: 'Play Friend Smash with me!',
                message: 'Hi you have to check this next big thing!' +
                    'it helps you make decisions',
            }, fbCallback);
        }
    }

    function fbCallback(response) {
        console.log(response);
    }

});
    