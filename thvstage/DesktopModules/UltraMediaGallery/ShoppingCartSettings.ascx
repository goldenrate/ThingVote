<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Control Language="vb" AutoEventWireup="false" Codebehind="ShoppingCartSettings.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.ShoppingCartSettings" %>
<div class="UMGSection" style="width:600px;">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader">
            <asp:Label ID="Label6" runat="server" resourcekey="SalesAgreement.Text"
                CssClass="SubHead">
            </asp:Label></td>
    </tr>
    <tr>
        <td align="center">
            <dnn:TextEditor id="txtSalesAgreement" runat="server" width="450" height="270">
                        </dnn:TextEditor>
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
