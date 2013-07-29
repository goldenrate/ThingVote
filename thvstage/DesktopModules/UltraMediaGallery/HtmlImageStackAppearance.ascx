<%@ Control Language="vb" AutoEventWireup="false" Codebehind="HtmlImageStackAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.HtmlImageStackAppearance" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucColorPicker" Src="ucColorPicker.ascx" %>
<table cellspacing="5" width="100%" id="tblContainer" runat="server">
    <tr>
        <td class="SectionHeader">
            <dnn:sectionhead id="dshColorsAndAppearance" runat="server" resourcekey="ColorsAndAppearance"
                section="tblColors" IncludeRule="False" CssClass="SubHead" maximageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle1.gif"
                minimageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle2.gif">
            </dnn:sectionhead></td>
    </tr>
    <tr>
        <td class="UMGMenuBody">
            <table id="tblColors" width="100%" runat="server" class="Normal">
                <tr>
                    <td width="150">
                        <asp:Label ID="plbackgroundColor" runat="server" resourcekey="backgroundColor"></asp:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="backgroundColor" runat="server">
                        </uc1:uccolorpicker></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" resourcekey="playSpeed"></asp:Label></td>
                    <td class="Normal">
                        <asp:dropdownlist id="playSpeed" runat="server" CssClass="NormalTextBox">
                            <asp:listitem value="10"></asp:listitem>
                            <asp:listitem value="7"></asp:listitem>
                            <asp:listitem value="6"></asp:listitem>
                            <asp:listitem value="5" selected="true"></asp:listitem>
                            <asp:listitem value="4"></asp:listitem>
                            <asp:listitem value="3"></asp:listitem>
                        </asp:dropdownlist>
                        <asp:Label ID="Label3" runat="server" resourcekey="seconds"></asp:Label>
                        </td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label7" runat="server" resourcekey="showButtons"></asp:Label></td>
                    <td class="Normal">
                        <asp:CheckBox ID="showButtons" runat="server" resourcekey="Yes">
                        </asp:CheckBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label5" runat="server" resourcekey="showCaption"></asp:Label></td>
                    <td class="Normal">
                        <asp:CheckBox ID="showCaption" runat="server" resourcekey="Yes">
                        </asp:CheckBox>
                        </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SectionHeader">
            <dnn:sectionhead id="dshBehaviors" runat="server" resourcekey="Behaviors" section="tblBehaviors"
                IncludeRule="False" CssClass="SubHead" maximageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle1.gif"
                minimageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle2.gif">
            </dnn:sectionhead></td>
    </tr>
    <tr>
        <td class="UMGMenuBody">
            <table id="tblBehaviors" width="100%" runat="server" class="Normal">
                <tr>
                    <td class="Normal">
                        <asp:CheckBox ID="autoPlay" runat="server" resourcekey="autoPlay">
                        </asp:CheckBox></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:Button ID="btnSave" runat="server" resourcekey="cmdUpdate" CssClass="CommandButton" />
            <asp:Button ID="btnCancel" runat="server" resourcekey="cmdCancel" CssClass="CommandButton" /></td>
    </tr>
</table>