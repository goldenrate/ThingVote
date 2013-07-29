<%@ Control Language="vb" AutoEventWireup="false" Codebehind="SharePG.ascx.vb" Inherits="BizModules.UltraPhotoGallery.SharePG" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<UPG:Header ID="ctlHeader" runat="server" />
<table cellspacing="0" cellpadding="2" width="500" border="0" align="center">
    <tr>
        <td class="SubSubHead">
            <asp:Label ID="Label1" runat="server" resourcekey="ShareLink"></asp:Label>:
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:Label ID="Label2" runat="server" resourcekey="ShareLink.Help" CssClass="Normal"></asp:Label>
            <p>
                <asp:Label ID="lblShareLink" runat="server"></asp:Label></p>
            <p>
            </p>
        </td>
    </tr>
    <tr>
        <td class="SubSubHead">
            <asp:Label ID="Label6" runat="server" resourcekey="Presentation"></asp:Label>:
        </td>
    </tr>
    <tr>
        <td>
            <table class="Normal">
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" resourcekey="Presentation.Help" CssClass="Normal"></asp:Label></td>
                    <td>
                            <asp:DropDownList ID="cboPresentation" runat="server" AutoPostBack="true" DataTextField="Name"
                                DataValueField="ItemId" CssClass="NormalTextBox">
                            </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" resourcekey="Presentation2.Help" CssClass="Normal"></asp:Label></td>
                </tr>
            </table>
            <p>
            </p>
        </td>
    </tr>
    <tr>
        <td align="center">
            <table width="100%">
                <tr>
                    <td>
                        <asp:Button ID="btnCancel" runat="server" resourcekey="cmdCancel" CssClass="CommandButton" /></td>
                    <td align="right">
                        <asp:Button ID="btnUpdate" runat="server" resourcekey="cmdUpdate" CssClass="CommandButton" /></td>
                </tr>
            </table>
    </tr>
</table>
