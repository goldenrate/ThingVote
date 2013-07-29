<%@ Control Language="vb" AutoEventWireup="false" Codebehind="WidescreenTour2Appearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.WidescreenTour2Appearance" %>
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
                        <asp:Label ID="Label1" runat="server" resourcekey="menuWidth"></asp:Label></td>
                    <td class="Normal">
                        <asp:dropdownlist id="menuWidth" runat="server" CssClass="NormalTextBox">
                            <asp:listitem value="250"></asp:listitem>
                            <asp:listitem value="220"></asp:listitem>
                            <asp:listitem value="200"></asp:listitem>
                            <asp:listitem value="180"></asp:listitem>
                            <asp:listitem value="160"></asp:listitem>
                            <asp:listitem value="150"></asp:listitem>
                        </asp:dropdownlist>px
                        </td>
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
                    <td>
                        <asp:Label ID="Label4" runat="server" resourcekey="showMenu"></asp:Label></td>
                    <td class="Normal">
                        <asp:DropDownList ID="showMenu" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem Value="left"></asp:ListItem>
                            <asp:ListItem Value="right"></asp:ListItem>
                            <asp:ListItem Value="none"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label7" runat="server" resourcekey="foldAndButtons"></asp:Label></td>
                    <td class="Normal">
                        <asp:DropDownList ID="foldAndButtons" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem Value="fold"></asp:ListItem>
                            <asp:ListItem Value="buttons"></asp:ListItem>
                            <asp:ListItem Value="neither"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label5" runat="server" resourcekey="captionStyle"></asp:Label></td>
                    <td class="Normal">
                        <asp:DropDownList ID="captionStyle" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem Value="simple"></asp:ListItem>
                            <asp:ListItem Value="linebyline"></asp:ListItem>
                        </asp:DropDownList>
                        <br /><asp:Label ID="Label6" runat="server" resourcekey="captionStyle1.Help"></asp:Label>
                        <br /><asp:Label ID="Label8" runat="server" resourcekey="captionStyle2.Help"></asp:Label>
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
                <tr>
                    <td class="Normal">
                        <asp:CheckBox ID="loopPlay" runat="server" resourcekey="loopPlay">
                        </asp:CheckBox></td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:CheckBox ID="autoHide" runat="server" resourcekey="autoHide">
                        </asp:CheckBox></td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:CheckBox ID="autoPlaysVideo" runat="server" resourcekey="autoPlaysVideo">
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