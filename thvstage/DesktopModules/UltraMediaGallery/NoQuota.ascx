<%@ Control Language="vb" AutoEventWireup="false" Codebehind="NoQuota.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.NoQuota" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<UPG:Header ID="ctlHeader" runat="server" />
<table class="UMGSection" cellpadding="5" width="550">
    <tr>
        <td class="SubHead SectionHeader">
            <asp:Label ID="Label2" runat="server" resourcekey="NoQuota"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:Label ID="lblNoQuotaHelp" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:Button ID="btnCancel" runat="server" resourcekey="cmdReturn" CssClass="CommandButton" />
        </td>
    </tr>
</table>
