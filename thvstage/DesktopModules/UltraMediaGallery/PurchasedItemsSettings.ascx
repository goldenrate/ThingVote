<%@ Control Language="vb" AutoEventWireup="false" Codebehind="PurchasedItemsSettings.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.PurchasedItemsSettings" %>
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
            <table cellpadding="3" width="100%">
                <tr>
                    <td class="SubHead" width="150">
                        <asp:Label ID="plPageSize" runat="server" resourcekey="plPageSize"></asp:Label>:</td>
                    <td class="Normal">
                        <asp:DropDownList ID="cboPageSize" Width="128" runat="server" CssClass="Normal">
                            <asp:ListItem Value="1"></asp:ListItem>
                            <asp:ListItem Value="2"></asp:ListItem>
                            <asp:ListItem Value="3"></asp:ListItem>
                            <asp:ListItem Value="4"></asp:ListItem>
                            <asp:ListItem Value="5"></asp:ListItem>
                            <asp:ListItem Value="6"></asp:ListItem>
                            <asp:ListItem Value="7"></asp:ListItem>
                            <asp:ListItem Value="8"></asp:ListItem>
                            <asp:ListItem Value="9"></asp:ListItem>
                            <asp:ListItem Value="10"></asp:ListItem>
                            <asp:ListItem Value="15"></asp:ListItem>
                            <asp:ListItem Value="25"></asp:ListItem>
                            <asp:ListItem Value="50"></asp:ListItem>
                            <asp:ListItem Value="100"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="SubHead" width="150">
                        <asp:Label ID="plInvoicePrefix" runat="server" resourcekey="plInvoicePrefix"></asp:Label>:</td>
                    <td class="Normal">
                        <asp:TextBox ID="txtInvoicePrefix" Width="80px" runat="server" CssClass="NormalTextBox"></asp:TextBox></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SectionFooter" align="center">
            <asp:Button class="CommandButton" ID="btnUpdate" runat="server" resourcekey="cmdUpdate"
                ></asp:Button>&nbsp;
            <asp:Button class="CommandButton" ID="btnCancel" runat="server" resourcekey="cmdCancel"
                CausesValidation="False" Text="Cancel"></asp:Button>
        </td>
    </tr>
</table>
</div>
