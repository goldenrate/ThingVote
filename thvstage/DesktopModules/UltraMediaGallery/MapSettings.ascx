<%@ Control Language="vb" AutoEventWireup="false" Codebehind="MapSettings.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.MapSettings" %>
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
                    <td>
                        <asp:Label ID="plMapSize" resourcekey="MapSize" runat="server">
                        </asp:Label></td>
                    <td>
                        <asp:DropDownList ID="cboWidth" runat="server" CssClass="NormalTextBox">
                        <asp:ListItem Value="400"></asp:ListItem>
                        <asp:ListItem Value="420"></asp:ListItem>
                        <asp:ListItem Value="440"></asp:ListItem>
                        <asp:ListItem Value="460"></asp:ListItem>
                        <asp:ListItem Value="480"></asp:ListItem>
                        <asp:ListItem Value="500"></asp:ListItem>
                        <asp:ListItem Value="520"></asp:ListItem>
                        <asp:ListItem Value="540"></asp:ListItem>
                        <asp:ListItem Value="560"></asp:ListItem>
                        <asp:ListItem Value="580"></asp:ListItem>
                        <asp:ListItem Value="600" Selected="true"></asp:ListItem>
                        <asp:ListItem Value="650"></asp:ListItem>
                        <asp:ListItem Value="700"></asp:ListItem>
                        <asp:ListItem Value="750"></asp:ListItem>
                        <asp:ListItem Value="800"></asp:ListItem>
                        </asp:DropDownList>px x 
                        <asp:DropDownList ID="cboHeight" runat="server" CssClass="NormalTextBox">
                        <asp:ListItem Value="300"></asp:ListItem>
                        <asp:ListItem Value="320"></asp:ListItem>
                        <asp:ListItem Value="340"></asp:ListItem>
                        <asp:ListItem Value="360"></asp:ListItem>
                        <asp:ListItem Value="370"></asp:ListItem>
                        <asp:ListItem Value="400"></asp:ListItem>
                        <asp:ListItem Value="420" Selected="true"></asp:ListItem>
                        <asp:ListItem Value="440"></asp:ListItem>
                        <asp:ListItem Value="460"></asp:ListItem>
                        <asp:ListItem Value="480"></asp:ListItem>
                        <asp:ListItem Value="500"></asp:ListItem>
                        <asp:ListItem Value="550"></asp:ListItem>
                        <asp:ListItem Value="600"></asp:ListItem>
                        </asp:DropDownList>px
                        </td>
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
