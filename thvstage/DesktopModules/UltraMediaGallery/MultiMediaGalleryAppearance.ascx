<%@ Control Language="vb" AutoEventWireup="false" Codebehind="MultiMediaGalleryAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.MultiMediaGalleryAppearance" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucColorPicker" Src="ucColorPicker.ascx" %>
<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            <%=PreferedPresentation(UserId).Name %>
        </td>
    </tr>
    <tr>
        <td style="padding:5px;">


            <table width="100%" class="Normal">
                <tr>
                    <td width="130">
                        <asp:Label ID="Label2" runat="server" resourcekey="ColorScheme"></asp:Label>:
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rdoColorScheme" runat="server" CssClass="Normal" RepeatColumns="2">
                            <asp:ListItem value="dark" selected="True"></asp:ListItem>
                            <asp:ListItem value="light"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
            
            
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:Button ID="btnSave" runat="server" resourcekey="cmdUpdate" CssClass="CommandButton" />
            <asp:Button ID="btnCancel" runat="server" resourcekey="cmdCancel" CssClass="CommandButton" /></td>
    </tr>
</table>
</div>