define(['durandal/system', 'config'],
    function (system,config) {
        var util = {
            //serviceFramework: serviceFramework,
            //baseServicepath: baseServicepath,
            //userId: userId,
            //profilePicHandler: profilePicHandler,
            //profilePictureUrl: getProfilePicture
            getThumbnail: getThumbnail,
            addSuffixToImage: addSuffixToImage,
            getProfilePicture:getProfilePicture
        };

        return util;

        function getProfilePicture(userId, w, h) {
            var handler = config.dnnData.profilePicHandler;
            return handler.replace("{0}",
               userId).replace("{1}", h).replace("{2}", w);
        };       

        function getThumbnail(filename) {
            var index = filename.lastIndexOf('/') + 1;
            return filename.substr(0, index) +
                config.imageSettings.thumbPrefix +
                filename.substr(index);
        }

        function addSuffixToImage(url , ext) {
            var index = url.lastIndexOf('/') + 1;
            var filename = url.substr(index);

            filename = filename.replace('.', ext + '.');

             return url.substr(0, index) + filename;
        }
});