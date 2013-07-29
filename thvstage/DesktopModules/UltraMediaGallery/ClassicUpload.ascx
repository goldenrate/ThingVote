<%@ Control Language="vb" AutoEventWireup="false" Codebehind="ClassicUpload.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.ClassicUpload" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<upg:header id="ctlHeader" runat="server" />
<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            <%=Localize("ClassicUpload") %>
        </td>
    </tr>
    <tr>
        <td>
            <table border="0" cellpadding="5" width="100%" class="Normal">
                <tr>
                    <td style="vertical-align: top;">
                        <div class="Group1" style="margin-bottom: 10px;">
                            <%=Localize("ClassicUpload.Help").Replace("[SUPPORTEDMEDIAS]", GetSupportedMedias()) %>
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
                                <%=Localize("ClassicUpload") %>
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
                                    <ol class="Normal" id="olUpload">
                                        <li class="verticalMiddle" style="margin-bottom: 5px;">
                                            <input id="file1" type="file" size="60" name="file" class="NormalTextBox">
                                        </li>
                                        <li class="verticalMiddle" style="margin-bottom: 5px;">
                                            <input id="file2" type="file" size="60" name="file" class="NormalTextBox">
                                        </li>
                                        <li class="verticalMiddle" style="margin-bottom: 5px;">
                                            <input id="file3" type="file" size="60" name="file" class="NormalTextBox">
                                        </li>
                                        <li class="verticalMiddle" style="margin-bottom: 5px;">
                                            <input id="file4" type="file" size="60" name="file" class="NormalTextBox">
                                        </li>
                                        <li class="verticalMiddle" style="margin-bottom: 5px;">
                                            <input id="file5" type="file" size="60" name="file" class="NormalTextBox">
                                        </li>
                                        <li class="verticalMiddle" style="margin-bottom: 5px;">
                                            <input id="file6" type="file" size="60" name="file" class="NormalTextBox">
                                        </li>
                                        <li class="verticalMiddle" style="margin-bottom: 5px;">
                                            <input id="file7" type="file" size="60" name="file" class="NormalTextBox">
                                        </li>
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
	monitorFileSelection();
});

function monitorFileSelection()
{
	var inputs = jQuery("#olUpload input");
	inputs.change(function(){
	    var parent = jQuery(this).parent();
	    parent.find("div").remove();
	    
	    if(this.value != "")
	    {
	        var inputs = jQuery("#olUpload input");
	        var id = this.id;
	        var index = id.substring(4) * 1;
	        if (index == inputs.length)
	        {
	            jQuery("#olUpload").append("<li class='verticalMiddle' style='margin-bottom: 5px;'><input id='file"+(index+1)+"' type='file' size='60' name='file' class='NormalTextBox'></li>");
	            
	            monitorFileSelection();
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
	        
	        var summary = dnn.getVar("fileSummary");
	        if (!summary) summary = "";
	        if (summary != "") summary += ";";
	        summary += id + "=" + this.value;
	        dnn.setVar("fileSummary", summary);
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

