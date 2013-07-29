<%@ Control Language="vb" AutoEventWireup="false" Codebehind="MacStyleAppearance.ascx.vb" Inherits="BizModules.UltraPhotoGallery.MacStyleAppearance" %>
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
                    <td width="200">
                        <asp:Label ID="plbackgroundColor" runat="server" resourcekey="backgroundColor"></asp:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="backgroundColor" runat="server">
                        </uc1:uccolorpicker></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="plspace" runat="server" resourcekey="space"></asp:Label></td>
                    <td class="Normal">
                        <asp:DropDownList ID="space" runat="server" CssClass="Normal">
                            <asp:ListItem Value="20"></asp:ListItem>
                            <asp:ListItem Value="25"></asp:ListItem>
                            <asp:ListItem Value="30"></asp:ListItem>
                            <asp:ListItem Value="35"></asp:ListItem>
                            <asp:ListItem Value="40"></asp:ListItem>
                            <asp:ListItem Value="45"></asp:ListItem>
                            <asp:ListItem Value="50"></asp:ListItem>
                            <asp:ListItem Value="55"></asp:ListItem>
                            <asp:ListItem Value="60"></asp:ListItem>
                            <asp:ListItem Value="65"></asp:ListItem>
                            <asp:ListItem Value="70"></asp:ListItem>
                            <asp:ListItem Value="75"></asp:ListItem>
                            <asp:ListItem Value="80"></asp:ListItem>
                        </asp:DropDownList>px</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" resourcekey="centerSpace"></asp:Label></td>
                    <td class="Normal">
                        <asp:DropDownList ID="centerSpace" runat="server" CssClass="Normal">
                            <asp:ListItem Value="60"></asp:ListItem>
                            <asp:ListItem Value="70"></asp:ListItem>
                            <asp:ListItem Value="80"></asp:ListItem>
                            <asp:ListItem Value="90"></asp:ListItem>
                            <asp:ListItem Value="100"></asp:ListItem>
                            <asp:ListItem Value="110"></asp:ListItem>
                            <asp:ListItem Value="120"></asp:ListItem>
                            <asp:ListItem Value="130"></asp:ListItem>
                            <asp:ListItem Value="140"></asp:ListItem>
                            <asp:ListItem Value="150"></asp:ListItem>
                            <asp:ListItem Value="160"></asp:ListItem>
                        </asp:DropDownList>px</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" resourcekey="yOffset"></asp:Label></td>
                    <td class="Normal">
                        <asp:DropDownList ID="yOffset" runat="server" CssClass="Normal">
                            <asp:ListItem Value="-50"></asp:ListItem>
                            <asp:ListItem Value="-40"></asp:ListItem>
                            <asp:ListItem Value="-30"></asp:ListItem>
                            <asp:ListItem Value="-20"></asp:ListItem>
                            <asp:ListItem Value="-10"></asp:ListItem>
                            <asp:ListItem Value="0"></asp:ListItem>
                            <asp:ListItem Value="10"></asp:ListItem>
                            <asp:ListItem Value="20"></asp:ListItem>
                            <asp:ListItem Value="30"></asp:ListItem>
                            <asp:ListItem Value="40"></asp:ListItem>
                            <asp:ListItem Value="50"></asp:ListItem>
                        </asp:DropDownList>px</td>
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
                        <asp:CheckBox ID="albumNavigation" runat="server" resourcekey="albumNavigation"></asp:CheckBox></td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:CheckBox ID="useIPhoneFrame" runat="server" resourcekey="useIPhoneFrame">
                        </asp:CheckBox></td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:CheckBox ID="useEmbedFonts" runat="server" resourcekey="useEmbedFonts">
                        </asp:CheckBox></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton class="CommandButton" ID="cmdLoadDefault" runat="server" resourcekey="cmdLoadDefault"
        Text="" BorderStyle="none" CausesValidation="false"></asp:LinkButton>&nbsp;
    <asp:LinkButton class="CommandButton" ID="cmdSaveAsDefault" runat="server" resourcekey="cmdSaveAsDefault"
        Text="" BorderStyle="none"></asp:LinkButton>&nbsp;
    <asp:LinkButton class="CommandButton" ID="cmdUpdate" runat="server" resourcekey="cmdUpdate"
        Text="" BorderStyle="none"></asp:LinkButton>&nbsp;
    <asp:LinkButton class="CommandButton" ID="cmdCancel" runat="server" resourcekey="cmdCancel"
        Text="" BorderStyle="none" CausesValidation="False"></asp:LinkButton>
</p>
