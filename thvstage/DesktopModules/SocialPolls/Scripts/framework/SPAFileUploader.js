(function ($) {
    var supportAjaxUpload = function () {
        var xhr = new XMLHttpRequest;
        return !!(xhr && ('upload' in xhr) && ('onprogress' in xhr.upload));
    };
    $.fn.dnnFileUpload = function (settings) {

        return this.each(function () {
            // set scope and settings, service
            //'this' is the scope (the container) that contains all the other components
            var scope = $(this).attr('id');
            dnn.dnnFileUpload.setSettings(scope, settings);
            var service = $.dnnSF();

            // hide progress
            $('#' + settings.progressBarId).parent().hide();
            // detect draggable support or not
            var droppableSpan = $('#' + settings.dropZoneId + '>span');
            if ('draggable' in document.createElement('span')) {
                droppableSpan.show();
            }
            else {
                droppableSpan.hide();
            }

            // set file upload
            //for example "/DesktopModules/internalservices/API/fileupload/postfile"
            var url = service.getServiceRoot('internalservices') + 'fileupload/postfile';
            if (!supportAjaxUpload()) {
                var antiForgeryToken = $('input[name="__RequestVerificationToken"]').val();
                url += '?__RequestVerificationToken=' + antiForgeryToken;
            }

            $('#' + scope + ' input[type="file"]').fileupload({
                url: url,
                beforeSend: service.setModuleHeaders,
                dropZone: $('#' + settings.dropZoneId),
                replaceFileInput: false,
                submit: function (e, data) {
                    data.formData = { folder: settings.folder, filter: settings.fileFilter };
                    return true;
                },
                progressall: function (e, data) {
                    var progress = parseInt(data.loaded / data.total * 100, 10);
                    if (progress < 100) {
                        $('#' + settings.progressBarId).parent().show();
                        $('#' + settings.progressBarId + '>div').css('width', progress + '%');
                    }
                    else
                        $('#' + settings.progressBarId).parent().hide();
                },
                done: function (e, data) {
                    $('#' + settings.progressBarId).parent().hide();
                    var img = new Image();
                    $(img).load(function () {
                        $('#' + settings.dropZoneId + ' img').remove();
                        $(img).css({ 'max-width': 180, 'max-height': 150 }).insertBefore($('#' + settings.dropZoneId + ' span'));
                    });
                    var src;
                    var testContent = $('pre', data.result);
                    if (testContent.length) {
                        src = testContent.text();
                    }
                    else
                        src = data.result;

                    if (src && $.trim(src)) {
                        img.src = src;

                        // set updated files into combo
                        var foldersCombo = $find(settings.foldersComboId);
                        var folderPath = foldersCombo.get_value();

                        /// "/DesktopModules/internalservices/API/fileupload/loadfiles"
                        url = service.getServiceRoot('internalservices') + 'fileupload/loadfiles';
                        $.ajax({
                            url: url,
                            type: 'POST',
                            data: {
                                FolderPath: folderPath, FileFilter:
                                    settings.fileFilter, Required: false
                            },
                            beforeSend: service.setModuleHeaders,
                            success: function (d) {
                                var combo = $find(settings.filesComboId);
                                combo.clearItems();
                                for (var i = 0; i < d.length; i++) {
                                    var txt = d[i].Text;
                                    var val = d[i].Value;

                                    var comboItem = new Telerik.Web.UI.RadComboBoxItem();
                                    comboItem.set_text(txt);
                                    comboItem.set_value(val);
                                    combo.get_items().add(comboItem);
                                    if (src.indexOf(txt) > 0) {
                                        comboItem.select();
                                        $('#' + settings.fileIdId).val(val);
                                        var path = folderPath ? folderPath + '/' +
                                            txt : txt;
                                        $('#' + settings.filePathId).val(path);
                                    }
                                }
                            },
                            error: function () {
                            }
                        });
                    }
                }
            });

            // set initial thumb image
            setTimeout(function () {
                var filesCombo = $find(settings.filesComboId);
                var selectedFileId = filesCombo.get_value();
                url = service.getServiceRoot('internalservices') + 'fileupload/loadimage';
                if (selectedFileId) {
                    $.ajax({
                        url: url,
                        type: 'GET',
                        data: { fileId: selectedFileId },
                        success: function (d) {
                            var img = new Image();
                            $(img).load(function () {
                                $('#' + settings.dropZoneId + ' img').remove();
                                $(img).css({ 'max-width': 180, 'max-height': 150 }).insertBefore($('#' + settings.dropZoneId + ' span'));
                            });
                            img.src = d;
                        },
                        error: function () {
                        }
                    });
                }
            }, 500);

        });
    };

    if (typeof dnn === 'undefined') dnn = {};
    dnn.dnnFileUpload = dnn.dnnFileUpload || {};
    dnn.dnnFileUpload.settings = {};
    dnn.dnnFileUpload.setSettings = function (scope, settings) {
        dnn.dnnFileUpload.settings[scope] = settings;
    };
    dnn.dnnFileUpload.getSettings = function (sender) {
        var senderId = sender.get_id();
        var scope = $('#' + senderId).closest('.dnnFileUploadScope').attr('id');
        return dnn.dnnFileUpload.settings[scope];
    };
    dnn.dnnFileUpload.Folders_Changed = function (sender, e) {
        var settings = dnn.dnnFileUpload.getSettings(sender);
        if (!settings) return;

        var item = e.get_item();
        if (item) {
            var folderPath = item.get_value();
            settings.folder = folderPath;
            var service = $.dnnSF();
            var url = service.getServiceRoot('internalservices') + 'fileupload/loadfiles';
            $.ajax({
                url: url,
                type: 'POST',
                data: { FolderPath: folderPath, FileFilter: settings.fileFilter, Required: false },
                beforeSend: service.setModuleHeaders,
                success: function (d) {
                    var combo = $find(settings.filesComboId);
                    combo.clearItems();
                    for (var i = 0; i < d.length; i++) {
                        var txt = d[i].Text;
                        var val = d[i].Value;

                        var comboItem = new Telerik.Web.UI.RadComboBoxItem();
                        comboItem.set_text(txt);
                        comboItem.set_value(val);
                        combo.get_items().add(comboItem);
                        if (i == 0) {
                            comboItem.select();
                        }
                    }


                },
                error: function () {
                }
            });

        }
    };
    dnn.dnnFileUpload.Files_Changed = function (sender, e) {
        var settings = dnn.dnnFileUpload.getSettings(sender);
        if (!settings) return;

        var item = e.get_item();
        if (item) {
            var fileId = item.get_value();
            $('#' + settings.fileIdId).val(fileId);
            var fileName = item.get_text();
            var folderPath = settings.folder;
            var path = folderPath ? folderPath + '/' + fileName : fileName;
            $('#' + settings.filePathId).val(path);
            var service = $.dnnSF();
            var url = service.getServiceRoot('internalservices') + 'fileupload/loadimage';
            if (fileId) {
                $.ajax({
                    url: url,
                    type: 'GET',
                    data: { fileId: fileId },
                    success: function (d) {
                        var img = new Image();
                        $(img).load(function () {
                            $('#' + settings.dropZoneId + ' img').remove();
                            $(img).css({ 'max-width': 180, 'max-height': 150 }).insertBefore($('#' + settings.dropZoneId + ' span'));
                        });
                        img.src = d;
                    },
                    error: function () {
                    }
                });
            }
            else
                $('#' + settings.dropZoneId + ' img').remove();
        }
    };

})(jQuery);