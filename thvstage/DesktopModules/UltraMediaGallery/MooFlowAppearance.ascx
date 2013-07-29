<%@ Control Language="vb" AutoEventWireup="false" Codebehind="MooFlowAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.MooFlowAppearance" %>
<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            <%=PreferedPresentation(UserId).Name %>
        </td>
    </tr>
    <tr>
        <td style="padding:5px;">


            <asp:Label ID="Label1" runat="server" resourcekey="MooFlow.Help" CssClass="Normal"></asp:Label>
            
            
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:Button ID="btnCancel" runat="server" resourcekey="cmdReturn" CssClass="CommandButton" /></td>
    </tr>
</table>
</div>