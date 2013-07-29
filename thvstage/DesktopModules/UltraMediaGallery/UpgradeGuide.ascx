<%@ Control Language="vb" AutoEventWireup="false" Codebehind="UpgradeGuide.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.UpgradeGuide" %>
<table class="Wizard" width="100%" border="0">
    <tr>
        <td class="WizardHeader">
            <font class="Head">
                Upgrade Guide
            </font>
        </td>
    </tr>
    <tr>
        <td class="WizardBody">
        <asp:Label ID="lblMessage" runat="server" CssClass="Normal"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="WizardFooter" align="right">
            <asp:Button ID="btnContinue" Text="Upgrade!" runat="server"></asp:Button>&nbsp;
            <asp:Button ID="btnReturn" Text="Return" runat="server" Visible="false"></asp:Button>
            </td>
    </tr>
</table>
