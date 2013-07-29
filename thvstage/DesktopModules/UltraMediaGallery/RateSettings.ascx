<%@ Control Language="vb" AutoEventWireup="false" Codebehind="RateSettings.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.RateSettings" %>
<div class="UMGSection" style="width:600px;">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader">
            <asp:Label ID="Label6" runat="server" resourcekey="ControlTitle_modulesettings.Text"
                CssClass="SubHead">
            </asp:Label></td>
    </tr>
    <tr>
        <td>
            <table cellpadding="3" width="100%" class="Normal">
                <tr>
                    <td width="130">
                        <asp:Label ID="plTemplate" resourcekey="Template" runat="server">
                        </asp:Label></td>
                    <td>
                        <asp:RadioButton ID="rdoDefault" runat="server" GroupName="Template" resourcekey="Default" />
                        <br />
                        <asp:RadioButton ID="rdoCustom" runat="server" GroupName="Template" resourcekey="Custom" />
                        
                        <asp:DropDownList ID="cboTemplates" runat="server" CssClass="NormalTextBox">
                        </asp:DropDownList></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SectionFooter" align="center">
            <asp:Button class="CommandButton" ID="btnUpdate" runat="server" resourcekey="cmdUpdate"
                ></asp:Button>&nbsp;
            <asp:Button class="CommandButton" ID="btnCancel" runat="server" resourcekey="cmdCancel" CausesValidation="False" Text="Cancel"></asp:Button>
        </td>
    </tr>
</table>
</div>
