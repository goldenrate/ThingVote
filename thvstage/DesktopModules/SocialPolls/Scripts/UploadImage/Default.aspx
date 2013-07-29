<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .bar {
            height: 18px;
            background: green;
        }
    </style>

</head>
<body>
    <script   type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script   type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/jquery-ui.min.js"></script>
    <script  type="text/javascript" src="js/jquery.fileupload.js"></script>
   <script  type="text/javascript" src="js/jquery.iframe-transport.js"></script>
    
   
      
    <script>
        $(function () {
            $('#fileupload').fileupload({
                replaceFileInput:false,
                dataType: 'json',
                url: '<% =ResolveUrl("AjaXFileHandler.ashx") %>',
                progressall: function (e, data) {
                    var progress = parseInt(data.loaded / data.total * 100, 10);
                    $('#progress .bar').css('width', progress + '%');
                },
                add: function (e, data) {
                    data.context = $('<p/>').text('Uploading...').appendTo(document.body);
                    data.submit();
                },
                done: function (e, data) {                    
                    $.each(data.result, function (index, file) {
                        $('<p/>').text(file).appendTo('body');
                        $('#uploadImage').attr('src', file);
                    });
                }
            });
        });

        $(function () {
            $('#uploadImage').on('click', function () {
                $('#fileupload').trigger('click');
            });
        });
</script>
    <form id="form1" runat="server">
    <div>
         <input id="fileupload" type="file" name="file" style="display:none" />
        <div id="progress" style="width:250px;">
            <div class="bar" style="width: 0%;"></div>
        </div>
        <img id="uploadImage" src="../images/imagePlaceHolder.fw.png" style="width:141px;" />
        <div id="uploadedImage">
            <asp:Image ID="Image1" src="" runat="server" />
        </div>
        <div id="fileNames"></div>
    </div>
    </form>
</body>
</html>
