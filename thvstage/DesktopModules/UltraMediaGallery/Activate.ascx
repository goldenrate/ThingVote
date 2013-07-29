<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Activate.ascx.vb" Inherits="BizModules.UltraPhotoGallery.Activate" %>
<table border="0" cellspacing="0">
    <tr>
        <td>
            <table cellpadding="3" width="100%">
                <tr>
                    <td class="Normal" colspan="2">
                        <asp:Label ID="lblEnterSerialNo" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="Normal" width="150" align="right">
                        <asp:Label ID="plSerialNo" runat="server" resourcekey="SerialNo">
                        </asp:Label>:</td>
                    <td class="Normal">
                        <asp:TextBox ID="txtSerialNo" runat="server" Width="300px" CssClass="NormalTextBox"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" align="center" style="color: #FF0000">
                        <asp:Label ID="lblMessage" CssClass="Normal" runat="server"></asp:Label></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:LinkButton class="CommandButton" ID="cmdUpdate" runat="server" resourcekey="Activate"
                BorderStyle="none"></asp:LinkButton>&nbsp;
            <asp:LinkButton class="CommandButton" ID="cmdManual" runat="server" resourcekey="cmdManual"
                BorderStyle="none"></asp:LinkButton>&nbsp;
            <asp:LinkButton class="CommandButton" ID="cmdCancel" runat="server" resourcekey="cmdCancel"
                BorderStyle="none"></asp:LinkButton></td>
    </tr>
</table>
