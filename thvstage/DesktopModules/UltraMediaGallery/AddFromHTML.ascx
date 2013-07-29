<%@ Control Language="vb" AutoEventWireup="false" Codebehind="AddFromHTML.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.AddFromHTML" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<upg:header id="ctlHeader" runat="server" />
<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            <%=Localize("AddFromHTML") %>
        </td>
    </tr>
    <tr>
        <td>
            <table border="0" cellpadding="5" width="100%" class="Normal">
                <tr>
                    <td style="vertical-align: top;">
                        <div class="Group1" style="margin-bottom: 10px;">
                            <%=Localize("AddFromHTML.Help").Replace("[SUPPORTEDMEDIAS]", GetSupportedMedias()) %>
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
                                <%=Localize("AddFromHTML") %>
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
                                    <table class="Normal" style="width:520px;text-align:left;">
                                        <tr>
                                            <td class="header2">
                                                <dnn:Label ID="Label2" runat="server" resourcekey="MediaType" Suffix=":">
                                                </dnn:Label></td>
                                            <td>
                                                <asp:RadioButtonList runat="server" ID="rdoMediaType" RepeatDirection="Horizontal" CssClass="NormalTextBox">
                                                <asp:ListItem Value="video" Selected="true"></asp:ListItem>
                                                <asp:ListItem Value="audio"></asp:ListItem>
                                                <asp:ListItem Value="flash"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="header2">
                                                <dnn:Label ID="Label3" runat="server" resourcekey="Title" Suffix=":">
                                                </dnn:Label></td>
                                            <td>
                                                <asp:textbox id="txtTitle" runat="server" width="400px" cssclass="NormalTextBox"></asp:textbox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="header2">
                                                <dnn:Label ID="Label4" runat="server" resourcekey="HtmlCode" Suffix=":">
                                                </dnn:Label></td>
                                            <td>
                                                <asp:textbox id="txtHtmlContent" runat="server" width="400px" rows="6" textmode="MultiLine"
                                        cssclass="NormalTextBox"></asp:textbox>
                                            </td>
                                        </tr>
                                    </table>
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
	
    jQuery("#<%=txtTitle.ClientID %>").watermark("<%=Localize("Title.Watermark") %>");
    jQuery("#<%=txtHtmlContent.ClientID %>").watermark("<%=Localize("HtmlCode.Watermark") %>");
});

function monitorInputSelection()
{
	var inputs = jQuery("#<%=txtHtmlContent.ClientID %>");
	inputs.change(function(){
        var txtTitle = jQuery("#<%=txtTitle.ClientID %>");
        var strFromYoutube = "<Retrieve from Youtube>";
        
        var url = this.value.toLowerCase();
        if (url.indexOf("<object") == 0 && url.indexOf(".youtube.") > 0 && url.indexOf("/v/") > 0)
        {
            type = "youtube";
            
            txtTitle.attr('disabled', 'disabled');
            
            txtTitle.attr("value", strFromYoutube);
        }
        else
        {
            txtTitle.removeAttr('disabled');
            
            if (txtTitle.attr("value") == strFromYoutube) txtTitle.attr("value", "");
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

