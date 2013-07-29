<%@ Control Language="vb" AutoEventWireup="false" Inherits="BizModules.UltraPhotoGallery.FlashGallerySettingBase" %>
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
                        <asp:Label ID="plfadeAmount" runat="server" resourcekey="fadeAmount"></asp:Label></td>
                    <td class="Normal">
                        <asp:DropDownList ID="fadeAmount" runat="server" CssClass="Normal">
                            <asp:ListItem Value="0"></asp:ListItem>
                            <asp:ListItem Value="5"></asp:ListItem>
                            <asp:ListItem Value="10"></asp:ListItem>
                            <asp:ListItem Value="15"></asp:ListItem>
                            <asp:ListItem Value="20"></asp:ListItem>
                            <asp:ListItem Value="25"></asp:ListItem>
                            <asp:ListItem Value="30"></asp:ListItem>
                            <asp:ListItem Value="35"></asp:ListItem>
                            <asp:ListItem Value="40"></asp:ListItem>
                            <asp:ListItem Value="45"></asp:ListItem>
                            <asp:ListItem Value="50"></asp:ListItem>
                        </asp:DropDownList>%
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" resourcekey="startPosition"></asp:Label></td>
                    <td class="Normal">
                        x:<asp:TextBox ID="startX" runat="server" Width="40px" CssClass="NormalTextBox"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rev7" runat="server" ControlToValidate="startX"
                            ValidationExpression="\d*" ErrorMessage="*"></asp:RegularExpressionValidator>
                        &nbsp; y:
                        <asp:TextBox ID="startY" runat="server" Width="40px" CssClass="NormalTextBox"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rev8" runat="server" ControlToValidate="startY"
                            ValidationExpression="\d*" ErrorMessage="*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" resourcekey="endPosition"></asp:Label>
                    </td>
                    <td class="Normal">
                        x:<asp:TextBox ID="endX" runat="server" Width="40px" CssClass="NormalTextBox"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="endX"
                            ValidationExpression="\d*" ErrorMessage="*"></asp:RegularExpressionValidator>
                        &nbsp; y:<asp:TextBox ID="endY" runat="server" Width="40px" CssClass="NormalTextBox"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rev2" runat="server" resourcekey="InvalidInput"
                            ControlToValidate="endY" ValidationExpression="\d*" ErrorMessage="Invalid input"></asp:RegularExpressionValidator>
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
                        <asp:CheckBox ID="navigationButtons" runat="server" resourcekey="showNavigationButtons">
                        </asp:CheckBox></td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:CheckBox ID="randomTop" runat="server" resourcekey="randomTop"></asp:CheckBox></td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:CheckBox ID="openLinkInNewWindow" runat="server" resourcekey="openLinkInNewWindow">
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
