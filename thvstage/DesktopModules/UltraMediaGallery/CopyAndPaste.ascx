<%@ Control Language="vb" AutoEventWireup="false" Codebehind="CopyAndPaste.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.CopyAndPaste" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<upg:header id="ctlHeader" runat="server" />
<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            <%=Localize("CopyAndPaste") %>
        </td>
    </tr>
    <tr>
        <td>
            <table border="0" cellpadding="5" width="100%" class="Normal">
                <tr>
                    <td style="vertical-align: top;">
                        <div class="Group1" style="margin-bottom: 10px;">
                            <%=Localize("CopyAndPaste.Help").Replace("[SUPPORTEDMEDIAS]", GetSupportedMedias()) %>
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
                                <%=Localize("CopyAndPaste") %>
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
                                    <asp:dropdownlist id="cboParentAlbum" runat="server" CssClass="NormalTextBox" AutoPostBack="True">
                    </asp:dropdownlist>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <applet code="image.uploader" name="Image Uploader" width="600" height="450" hspace="0" vspace="0" align="middle" archive="<%=ResolveUrl("applet/jUpload.jar") %>" id="Ultra Media Gallery Image Uploader">
					<param name="FontSize" value="13" />
					<param name="FontName" value="Arial" />
                                      <param name="upload_url" value="<%=GetDomain() + ResolveUrl("jUpload.aspx") + "?AlbumId="+cboParentAlbum.SelectedValue+"&Session="+SessionId %>" />
                                      
                                      <div style="width:600px;height:430px;">
                                      <div class="Head">Java not installed</div>
                                      <div class="Normal">
                                      To use this feature, please install <a href="http://www.java.com" target="_blank">Java</a>.
                                      </div>
                                      </div>
                                    </applet>
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

