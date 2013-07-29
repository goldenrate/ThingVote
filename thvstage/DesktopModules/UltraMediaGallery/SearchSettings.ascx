<%@ Control Language="vb" AutoEventWireup="false" Codebehind="SearchSettings.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.SearchSettings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
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
                    <td class="NormalBold" width="150">
                        <dnn:Label ID="plSearchMode" runat="server" Suffix=":">
                                        </dnn:Label></td>
                    <td class="Normal">
                        <asp:RadioButton ID="rdoString" GroupName="SearchMode" resourcekey="String" runat="server" />
                        <asp:RadioButton ID="rdoWord" GroupName="SearchMode" resourcekey="Word" runat="server" /></td>
                </tr>
                <tr>
                    <td class="NormalBold">
                        <dnn:Label ID="plSearchInGallery" runat="server" Suffix=":">
                                        </dnn:Label></td>
                    <td class="Normal">
                        <asp:DropDownList ID="cboModules" runat="server" CssClass="NormalTextBox"
                            DataTextField="text" DataValueField="value" Width="325">
                        </asp:DropDownList></td>
                </tr>
                <tr id="trResultsMode" runat="server">
                    <td class="NormalBold">
                        <dnn:Label ID="plResultsMode" runat="server" Suffix=":">
                                        </dnn:Label></td>
                    <td class="Normal">
                        <asp:RadioButton ID="rdoLightbox" GroupName="ResultsMode" resourcekey="Lightbox" runat="server" />
                        <asp:RadioButton ID="rdoChosenPresentation" GroupName="ResultsMode" resourcekey="ChosenPresentation" runat="server" /></td>
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
