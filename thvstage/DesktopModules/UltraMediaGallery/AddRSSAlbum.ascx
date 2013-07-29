<%@ Control Language="vb" AutoEventWireup="false" Codebehind="AddRSSAlbum.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.AddRSSAlbum" %>
<%@ Register TagPrefix="uc1" TagName="RolePicker" Src="ucRolePicker.ascx" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<UPG:Header ID="ctlHeader" runat="server" />
<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            <%=Localize("AddRSSAlbum") %>
        </td>
    </tr>
    <tr>
        <td>
            <table border="0" cellpadding="5" width="100%" class="Normal">
                <tr>
                    <td style="vertical-align: top;">
                        <div class="Group1" style="margin-bottom: 10px;">
                            <%=Localize("AddRSSAlbum.Help") %>
                        </div>
                        <div class="Group2">
                            <div class="SubHead" style="margin-bottom: 10px;">
                                <%=Localize("OtherAlbumOptions") %></div>
                            <div>
                                <a href="<%=EditUrl("AddStdAlbum") %>"><%=Localize("AddStandardAlbum") %></a>
                            </div>
                            <div>
                                <%=Localize("AddRSSAlbum") %>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="Group3" style="margin-bottom: 10px;">
                            <div class="SubHead" style="margin-bottom: 10px;">
                                <%=Localize("BasicInformation") %></div>
                            <table class="Normal">
                                <tr id="trParentAlbums" runat="server">
                                    <td class="header2">
                                        <dnn:Label ID="Label4" runat="server" resourcekey="ParentAlbum" Suffix=":"></dnn:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="lstParentAlbums" runat="server" CssClass="NormalTextBox" Width="400px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                <td class="header2">
                                    <dnn:Label ID="Label1" runat="server" resourcekey="RssUrl" Suffix=":"></dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtRssUrl" runat="server" Width="400px" CssClass="NormalTextBox"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRssUrl" resourcekey="Required"></asp:RequiredFieldValidator></td>
                            </tr>
                            </table>
                        </div>
                        <div class="Group3">
                            <div class="SubHead" style="margin-bottom: 10px;">
                                <%=Localize("AdvancedOptions") %></div>
                                <table class="Normal">
                                    <tr>
                                        <td class="header2">
                                            <dnn:Label ID="Label15" runat="server" resourcekey="Owner" Suffix=":"></dnn:Label>
                                            </td>
                                        <td>
                                            <asp:TextBox ID="txtUserName" runat="server" Width="300px" CssClass="NormalTextBox" autocomplete="off"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr id="trViewRoles" runat="server">
                                        <td class="header2">
                                            <dnn:Label ID="Label11" runat="server" resourcekey="ViewRoles" Suffix=":"></dnn:Label>
                                        </td>
                                        <td>
                                            <uc1:rolepicker id="Rolepicker3" runat="server" DisplayAllUsers="True">
                                            </uc1:rolepicker></td>
                                    </tr>
                                    <tr>
                                        <td class="header2">
                                            <dnn:Label ID="lblDefaultAlbum" runat="server" resourcekey="DefaultAlbum" Suffix="?"></dnn:Label>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkDefaultAlbum" resourcekey="Yes" runat="server"></asp:CheckBox>
                                        </td>
                                    </tr>
                                </table>
                        </div>
                        <p style="text-align: center;">
                            <asp:Button ID="btnSave" runat="server" resourcekey="cmdUpdate" CssClass="CommandButton" />
                            <asp:Button ID="btnCancel" runat="server" resourcekey="cmdCancel" CssClass="CommandButton"
                                CausesValidation="False" />
                        </p>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</div>

<script type="text/javascript">
function showOptionsDetail()
{
    document.getElementById("divOptionSummary").style.display="none";
    document.getElementById("divOptionDetail").style.display="block";
}

jQuery(document).ready(function(){
    jQuery("#<% =txtRssUrl.ClientID %>").watermark("<%=Localize("RssUrl.Watermark") %>");

});
</script>