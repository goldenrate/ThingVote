<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Html5Upload.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.Html5Upload" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<upg:header id="ctlHeader" runat="server" />
<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            <%=Localize("Html5Upload") %>
        </td>
    </tr>
    <tr>
        <td>
            <table border="0" cellpadding="5" width="100%" class="Normal">
                <tr>
                    <td style="vertical-align: top;">
                        <div class="Group1" style="margin-bottom: 10px;">
                            <%=Localize("Html5Upload.Help").Replace("[SUPPORTEDMEDIAS]", GetSupportedMedias()) %>
                        </div>
                        <div class="Group2">
                            <div class="SubHead" style="margin-bottom: 10px;">
                                <%=Localize("OtherUploadOptions") %></div>
                            <div>
                                <a href="<%=EditUrl("Upload") %>">
                                    <%=Localize("FlashUpload") %>
                                </a>
                            </div>
                            <div>
                                <a href="<%=EditUrl("ClassicUpload") %>">
                                    <%=Localize("ClassicUpload") %>
                                </a>
                            </div>
                            <div>
                                <a href="<%=EditUrl("ChooseFile") %>">
                                    <%=Localize("ChooseFile") %>
                                </a>
                            </div>
                            <div>
                                <a href="<%=EditUrl("AddFromURL") %>">
                                    <%=Localize("AddFromURL") %>
                                </a>
                            </div>
                            <div>
                                <a href="<%=EditUrl("AddFromHTML") %>">
                                    <%=Localize("AddFromHTML") %>
                                </a>
                            </div>
                            <div>
                                <a href="<%=EditUrl("CopyAndPaste") %>">
                                    <%=Localize("CopyAndPaste") %>
                                </a>
                            </div>
                            <div>
                                <%=Localize("Html5Upload") %>
                            </div>
                            <div>
                                <a href="<%=EditUrl("ImportFB") %>" class="SubHead">
                                    <%=Localize("ImportFB") %>
                                </a>
                            </div>
                        </div>
                    </td>
                    <td style="text-align: center;">
                        <table class="Normal">
                            <tr>
                                <td style="text-align: right;">
                                    <%=Localize("AddtoAlbum") %>:
                                    <asp:image id="imgAlbum" runat="server" imageurl="~/DesktopModules/UltraMediaGallery/images/albumicon.gif" />
                                    <asp:dropdownlist id="cboParentAlbum" runat="server" CssClass="NormalTextBox" AutoPostBack="True">
                    </asp:dropdownlist>
                                </td>
                            </tr>
                            <tr>
                                <td>
		<div id="dropbox">
			<span class="message">Drop one or more media files here to upload. <br /><i>Currently work in Firefox 3.6+, Chrome and Safari 6, Opera possibly in version 11 and possibly IE 10.</i></span>
			
			<div class="browse"><div class="header">Or select some files to upload:</div> <input type="file" class="fileselection" multiple="multiple" name="kfm_file[]"/>
			<!--input type="button" class="upload" value="Upload" /-->
			</div>
		</div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</div>

<script type="text/javascript">

function isclickable(option)
{
    var cboParentAlbum = document.getElementById("<%=cboParentAlbum.ClientID %>");
    var level = cboParentAlbum.options[cboParentAlbum.selectedIndex].text.lastIndexOf("--");
    
    var belowLevel;
    
    if (cboParentAlbum.selectedIndex < cboParentAlbum.length - 1)
        belowLevel = cboParentAlbum.options[cboParentAlbum.selectedIndex + 1].text.lastIndexOf("--");
    
    if (belowLevel > level)
    {
        alert("<%=Localize("AlbumNotSelectable") %>");
        return false;
    }
    return true;
}

</script>

<script type="text/javascript">
jQuery(function(){
    var allowedExtensions = "<%=Join(GetSupportedMediaExtensions(),",") %>".split(",");
    var modulePath = "<%=ModulePath %>";
    var uploadPath = modulePath + 'Html5UploadPage.aspx?PortalId=<%=PortalId %>&ModuleId=<%=ModuleId %>&AlbumId=<%=cboParentAlbum.SelectedValue %>';

var dropbox=jQuery("#dropbox"),message=jQuery(".message",dropbox);
dropbox.filedrop({bulkupload:<%= BulkUpload %>,maxfilesize:20,url:uploadPath,uploadFinished:function(a,b,c){0>=c.result?(alert(c.message),jQuery.data(b).addClass("error")):jQuery.data(b).addClass("done")},error:function(a,b){switch(a){case "BrowserNotSupported":showMessage("Your browser does not support HTML5 file uploads!");break;case "TooManyFiles":alert("Too many files! Please select less files each time");break;case "FileTooLarge":alert(b.name+" is too large! Please upload files up to 20mb (configurable).")}},beforeEach:function(a){for(var a=
"*"+a.name.substring(a.name.lastIndexOf(".")).toLowerCase(),b=0;b<allowedExtensions.length;b++)if(allowedExtensions[b].trim()==a)return!0;alert("This kind of media is not supported in this gallery!");return!1},uploadStarted:function(a,b){createImage(b)},progressUpdated:function(a,b,c){jQuery.data(b).find(".progress").width(c)}});var template='<div class="preview"><span class="imageHolder"><img /><span class="uploaded"></span><span class="imageinfo"></span></span><div class="progressHolder"><div class="progress"></div></div></div>';
function createImage(a){var b=jQuery(template),c=jQuery("img",b);if(a.type.match(/^image\//)){c.attr("src",modulePath+"Css/dropbox/images/loading.gif");if(a.size < 1048576/*1MB*/){var d=new FileReader;d.onload=function(a){c.attr("src",a.target.result)};d.readAsDataURL(a);}}else c.attr("src",modulePath+"Css/dropbox/images/medias.jpg");message.hide();b.appendTo(dropbox);jQuery.data(a,b);b=jQuery(".imageinfo",b);d=1048576<a.size?(Math.round(100*a.size/1048576)/100).toString()+"MB":(Math.round(100*a.size/1024)/100).toString()+"KB";b.text(a.name+" | "+d)}
function showMessage(a){message.html(a)}var fileselection=jQuery(".fileselection");fileselection.change(function(){var a={};a.files=fileselection[0].files;var b=jQuery.Event("drop");b.dataTransfer=a;dropbox.trigger(b)});
});

</script>