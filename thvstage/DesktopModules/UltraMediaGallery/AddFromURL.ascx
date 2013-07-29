<%@ Control Language="vb" AutoEventWireup="false" Codebehind="AddFromURL.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.AddFromURL" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<upg:header id="ctlHeader" runat="server" />
<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            <%=Localize("AddFromURL") %>
        </td>
    </tr>
    <tr>
        <td>
            <table border="0" cellpadding="5" width="100%" class="Normal">
                <tr>
                    <td style="vertical-align: top;">
                        <div class="Group1" style="margin-bottom: 10px;">
                            <%=Localize("AddFromURL.Help").Replace("[SUPPORTEDMEDIAS]", GetSupportedMedias()) %>
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
                                <%=Localize("AddFromURL") %>
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
                                <a href="<%=EditUrl("Html5Upload") %>">
                                    <%=Localize("Html5Upload") %>
                                </a>
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
                                    <asp:dropdownlist id="cboParentAlbum" runat="server" CssClass="NormalTextBox">
                    </asp:dropdownlist>
                                </td>
                            </tr>
                            <tr>
                                <td>
                <ol class="Normal" id="olURL">
                    <li class="verticalMiddle" style="margin-bottom: 5px;">
                        <input id="url1" type="text" size="80" name="file" class="NormalTextBox"> </li>
                    <li class="verticalMiddle" style="margin-bottom: 5px;">
                        <input id="url2" type="text" size="80" name="file" class="NormalTextBox"> </li>
                    <li class="verticalMiddle" style="margin-bottom: 5px;">
                        <input id="url3" type="text" size="80" name="file" class="NormalTextBox"> </li>
                </ol>
                                </td>
                            </tr>
                        </table>
                        <asp:button id="btnUpload" runat="server" resourcekey="Upload" cssclass="CommandButton" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</div>

<script type="text/javascript">
jQuery(document).ready(function(){   
	monitorInputSelection();

    jQuery("#url1").watermark("<%=Localize("Image.Watermark") %>");
    jQuery("#url2").watermark("<%=URL2Watermark %>");
    jQuery("#url3").watermark("<%=URL3Watermark %>");
});

function monitorInputSelection()
{
	var inputs = jQuery("#olURL input");
	inputs.focus(function(){
	    this.select();
	});
	
	inputs.change(function(){
	    var parent = jQuery(this).parent();
	    parent.find("div").remove();
	    if(this.value != "" && this.value != "http://" && this.value != "http://yourdomain.com/path/media")
	    {
	        var inputs = jQuery("#olURL input");
	        var id = this.id;
	        var index = id.substring(3) * 1;
	        if (index == inputs.length)
	        {
	            jQuery("#olURL").append("<li class='verticalMiddle' style='margin-bottom: 5px;'><input id='url"+(index+1)+"' type='text' size='80' name='file' class='NormalTextBox'></li>");
	            
	            monitorInputSelection();
	        }
       
	        
	        
	        
	        var type = "";
	        var url = this.value.toLowerCase();
	        if (url.indexOf(".youtube.") > 0)
	        {
	            type = "youtube";
	        }
	        else
	        {
	            var extension = url.substring(url.lastIndexOf("."))
	            if(extension == ".png" || extension == ".jpg" || extension == ".jpeg" || extension == ".jpe" || extension == ".gif")
	            {
	                type = "image";
	            }
	            else if(extension == ".mp4" || extension == ".m4v" || extension == ".flv")
	            {
	                type = "video";
	            }
	            else if(extension == ".mp3")
	            {
	                type = "audio";
	            }
	            else if(extension == ".swf")
	            {
	                type = "swf";
	            }
	            else if (url.indexOf("rtmp:") == 0)
	            {
	                type = "video";
	            }
	        }
	        
	        if (type != "")
	        {
	            parent.append("<div style='margin-left:-22px;display:inline;'><img alt='' src='<%=ResolveUrl("images/") %>correct.png' /></div>");
	        }
	        else
	        {
	            alert("<%=Localize("UnknownFileType") %>");
	        }	        
	    }
	});
}
</script>

<script language="javascript">

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

