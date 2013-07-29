define(function () {
    var appRoute = 'DesktopModules/SocialPolls/App/';
    config = {
        routes: [
            {url: 'index', moduleId: appRoute + 'viewmodels/index', name: 'Index', visible: true },
        ],
        startModule: 'index',
    }
    return config;
});