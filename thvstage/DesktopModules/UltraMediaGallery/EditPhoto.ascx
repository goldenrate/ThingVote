<%@ Control Language="vb" AutoEventWireup="false" Codebehind="EditPhoto.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.EditPhoto" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="../../controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="../../controls/TextEditor.ascx" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<%@ Register TagPrefix="UPG" TagName="TagPicker" Src="TagPicker.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<UPG:header id="ctlHeader" runat="server" />
<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            <%=Localize("Edit") %> "<asp:Label ID="lblTitle" runat="server"></asp:Label>" <span class="Script2">(ID=<asp:Label
                ID="lblPhotoId" runat="server"></asp:Label>)</span>
        </td>
    </tr>
    <tr>
        <td>
            <table border="0" cellpadding="5" width="100%" class="Normal">
                <tr>
                    <td style="vertical-align: top;">
                        <div class="Group1" style="margin-bottom: 10px;">
                            <div class="SubHead" style="margin-bottom: 10px;">
                                <%=Localize("Overview") %></div>
                            <table cellpadding="1" width="100%" class="Normal">
                                <tr>
                                    <td colspan="2" style="text-align:center;">
                                        <asp:HyperLink ID="lnkPreview" runat="server" Target="_blank" CssClass="thumbnail"></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%=Localize("MediaType") %>:
                                    </td>
                                    <td>
                                        <asp:Label ID="lblType" runat="server" CssClass="SubSubHead"></asp:Label>
                                        <asp:Label ID="lblMediaSize" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%=Localize("InAlbum") %>:</td>
                                    <td>
                                        <asp:Label ID="lblAlbum" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%=Localize("Author") %>:
                                    </td>
                                    <td>
                                        <asp:Label ID="lblAuthor" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr id="trTakenDate" runat="server">
                                    <td>
                                        <%=Localize("TakenDate") %>:
                                    </td>
                                    <td class="editdate">
                                        <asp:Label ID="lblTakenDate" runat="server" style="cursor:pointer;"></asp:Label>
                                        <asp:TextBox ID="txtTakenDate" runat="server" width="120px" cssclass="NormalTextBox" style="display:none;"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%=Localize("CreatedDate") %>
                                        :
                                    </td>
                                    <td class="editdate">
                                        <asp:Label ID="lblCreatedDate" runat="server" style="cursor:pointer;"></asp:Label>
                                        <asp:TextBox ID="txtCreatedDate" runat="server" width="120px" cssclass="NormalTextBox" style="display:none;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <asp:Panel ID="pnlOptions" runat="server">
                            <div class="Group2">
                                <div class="SubHead" style="margin-bottom: 10px;">
                                    <%=Localize("Options") %></div>
                                <asp:LinkButton ID="lnkDelete" runat="server" resourcekey="DeleteMedia" Style="display: block;" />
                                <asp:Panel ID="pnlTransfer" runat="server">
                                    <a href="javascript:void(0)" class="Normal" onclick="var style = document.getElementById('divTransfer').style;style.display=='block'?style.display='none':style.display='block';">
                                        <%=Localize("MoveToAnotherAlbum") %></a>
                                    <div id="divTransfer" class="UMGMenuBody" style="display: none;">
                                        <asp:Label ID="Label12" runat="server" resourcekey="lblTransfer"></asp:Label>:
                                        <br />
                                        <asp:DropDownList ID="cboParentAlbum" runat="server" CssClass="NormalTextBox">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:Button ID="btnMove" runat="server" resourcekey="btnMove" CssClass="CommandButton" />
                                    </div>
                                </asp:Panel>
                                <div>
                                    <asp:LinkButton ID="lnkRotateLeft" runat="server" resourcekey="RotateLeft" Style="margin-right: 20px;" />
                                    <asp:LinkButton ID="lnkRotateRight" runat="server" resourcekey="RotateRight" />
                                </div>
                                <asp:LinkButton ID="lnkAlbumLogo" runat="server" resourcekey="AlbumLogo" Style="display: block;" />
                                <asp:Panel ID="pnlCrop" runat="server">
                                    <%=Localize("CropImage") %>
                                    <asp:LinkButton ID="lnkSnipshot" runat="server" Text="Snipshot" />
                                </asp:Panel>
                            </div>
                        </asp:Panel>
                    </td>
                    <td style="vertical-align: top;">
                        <div class="Group3" style="margin-bottom: 10px;">
                            <table class="Normal">
                                <tr>
                                    <td class="header2">
                                        <dnn:Label ID="plTitle" runat="server" resourcekey="Title" Suffix=":"></dnn:Label>
                                        </td>
                                    <td>
                                        <asp:TextBox ID="txtTitle" runat="server" Width="400px" CssClass="NormalTextBox"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="header2">
                                        <dnn:Label ID="lblDescription" runat="server" resourcekey="Description" Suffix=":">
                                        </dnn:Label>
                                    </td>
                                    <td style="text-align: center; width: 400px;">
                                        <div>
                                            <asp:RadioButton ID="rdoBasic" runat="server" GroupName="TextEditor" resourcekey="Basic"
                                                Checked="true" AutoPostBack="true" />
                                            <asp:RadioButton ID="rdoHtml" runat="server" GroupName="TextEditor" resourcekey="Html"
                                                AutoPostBack="true" />
                                        </div>
                                        <asp:TextBox ID="txtDescription" runat="server" Width="400px" Rows="6" TextMode="MultiLine"
                                            CssClass="NormalTextBox"></asp:TextBox>
                                        <asp:Panel ID="pnlTextEditor" runat="server" Visible="False">
                                            <dnn:TextEditor ID="ctlDescription" runat="server" Height="200" Width="400" HtmlEncode="False"
                                                ChooseMode="False" Mode="RICH" />
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="header2">
                                        <dnn:Label ID="Label9" runat="server" resourcekey="Tags" Suffix=":">
                                        </dnn:Label>
                                    </td>
                                    <td>
                                        <div style="text-align: center; width: 397px;">
                                            <UPG:tagpicker id="ctlTagPicker" runat="server">
                                            </UPG:tagpicker>
                                        </div>
                                    </td>
                                </tr>
                                <tr id="trLink" runat="server">
                                    <td class="header2">
                                        <dnn:Label ID="plLink" runat="server" resourcekey="Link" Suffix=":">
                                        </dnn:Label>
                                    </td>
                                    <td>
                                        <asp:Panel ID="pnlRichLink" runat="server">
                                            <asp:Panel ID="pnlCtlLink" runat="server" CssClass="UMGMenuBody linkcontrol">
                                                <dnn:URL ID="ctlLink" runat="server" Width="275" ShowTabs="True" ShowFiles="True"
                                                    ShowUrls="True" UrlType="U" ShowLog="False" ShowNewWindow="False" ShowTrack="False"
                                                    Required="False" />
                                            </asp:Panel>
                                            <asp:HyperLink ID="lnkLink" runat="server" Target="_blank" Visible="false"></asp:HyperLink>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr id="trDownload" runat="server">
                                    <td class="header2">
                                        <dnn:Label ID="Label8" runat="server" resourcekey="RawFile" Suffix=":">
                                        </dnn:Label>
                                    </td>
                                    <td>
                                        <div class="verticalMiddle">
                                            <asp:HyperLink ID="lnkDownload" runat="server" Target="_blank"></asp:HyperLink>
                                            <asp:LinkButton ID="lnkDetach" runat="server" resourcekey="Detach" />
                                            <asp:LinkButton ID="lnkAttach" runat="server" resourcekey="Attach" />
                                        </div>
                                        <asp:Panel ID="pnlAddDownload" runat="server" Visible="false">
                                            <div class="verticalMiddle">
                                                <input id="fileDownload" runat="server" name="File1" size="50" type="file" class="NormalTextBox" />
                                                <asp:LinkButton ID="lnkUpload" runat="server" resourcekey="Upload" />
                                            </div>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr id="trApproval" runat="server">
                                    <td>
                                    <dnn:Label ID="lblApproved" runat="server" resourcekey="Approved" Suffix="?">
                                        </dnn:Label>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkApproved" runat="server" resourcekey="Yes"></asp:CheckBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <asp:Panel ID="pnlMediaSource" runat="server" CssClass="Group3">
                            <div class="SubHead">
                                <%=Localize("MediaSource") %></div>
                            <table cellpadding="5" class="Normal">
                                <tr>
                                    <td class="header2">
                                        <dnn:Label ID="Label3" runat="server" resourcekey="Thumbnail" Suffix=":">
                                        </dnn:Label>
                                    </td>
                                    <td>
                                        <input id="fileThumbnail" runat="server" name="fileThumbnail" size="50" type="file"
                                            class="NormalTextBox" />
                                    </td>
                                </tr>
                                <tr id="trMediaEmbedCode" runat="server">
                                    <td class="header2">
                                        <asp:Label ID="Label4" runat="server" resourcekey="HtmlCode"></asp:Label>:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmbedCode" runat="server" Width="400px" Rows="6" TextMode="MultiLine"
                                            CssClass="NormalTextBox"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr id="trMediaUrl" runat="server">
                                    <td class="header2">
                                        <asp:Label ID="Label5" runat="server" resourcekey="MediaUrl"></asp:Label>
                                        :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMediaUrl" runat="server" Width="400px" CssClass="NormalTextBox"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <p style="text-align: center;">
                            <asp:Button ID="btnSave" runat="server" resourcekey="cmdUpdate" CssClass="CommandButton" />
                            <asp:Button ID="btnCancel" runat="server" resourcekey="cmdCancel" CssClass="CommandButton" />
                        </p>
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

jQuery(document).ready(function(){

    jQuery("#<% =txtTitle.ClientID %>").watermark("<%=Localize("Title.Watermark") %>");
    jQuery("#<% =txtDescription.ClientID %>").watermark("<%=Localize("Description.Watermark") %>");
    
    
    jQuery(".editdate").hover(function(){
        var td = jQuery(this);
        var label = td.find("span");
        var textbox = td.find("input");
        label.hide();
        textbox.show();        
    }, function(){
        var td = jQuery(this);
        var label = td.find("span");
        var textbox = td.find("input");
        label.show();
        textbox.hide();
        
        label.html(textbox.val());        
    });
    
    
    var thumbnail = jQuery(".thumbnail img");
    if(thumbnail.data("large"))
    {
        thumbnail.load(function(){
            thumbnail.imageLens({ imageSrc: thumbnail.data("large") });
        });
    }
});

</script>

