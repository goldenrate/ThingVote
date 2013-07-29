define(['services/logger', 'services/dataservice', 'config',
    'services/util'],


function (logger, dataservice, config, util) {
    var settings = {
        fileFilter: '"jpg,jpeg,gif,png"',
        required: false,
        foldersComboId: 'FoldersComboBox',
        filesComboId: 'FilesComboBox',
        folder: 'Users/003/03/3/', //how do we get this value
        filePathId: 'dnnFileUploadFilePath',
        fileIdId: 'dnnFileUploadFileId',
        progressBarId: 'dnnFileUploadProgressBar',
        dropZoneId: 'dnnFileUploadDropZone'
    };

    dev = {
        rating: ko.observable(),
        viewAttached: viewAttached,

        validate: function () {
            var sender = event.target;
            var isValid = $('#Form').valid();
        },
        //rules: {
        //  firstname: "required"
        //}
    };
    return dev;

    function viewAttached(view) {
        $('#dnnFileUploadScope').dnnFileUpload(settings);
    }

    function doneUpload(e, data) {
        var option = ko.dataFor(this);
        var files = new Array();
        var i = 0;
        $.each(data.result, function (index, obj) {
            var tn = obj.thumbnail_url;//util.getThumbnail(file);
            var file = obj.url;
            files[i] = { original: file, thumb: tn };
            i++;
        });

        for (var i = 0; i < files.length; i++) {
            var option = editpoll.Poll.PollOptions().pop();
            //option.OptionThumbnailUrl(files[i].thumb);
            option.OptionImageUrl(files[i].original);
            editpoll.Poll.PollOptions().unshift(option);
        }
    }

});

