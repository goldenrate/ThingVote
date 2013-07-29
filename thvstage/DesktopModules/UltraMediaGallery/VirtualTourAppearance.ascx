<%@ Control Language="vb" AutoEventWireup="false" Inherits="BizModules.UltraPhotoGallery.FlashGallerySettingBase" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucColorPicker" Src="ucColorPicker.ascx" %>
<table cellspacing="5" width="100%" id="tblContainer" runat="server">
    <tr>
        <td class="SectionHeader">
            <dnn:sectionhead id="dshColors" runat="server" resourcekey="Colors" section="tblColors"
                IncludeRule="False" CssClass="SubHead" maximageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle1.gif"
                minimageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle2.gif">
            </dnn:sectionhead></td>
    </tr>
    <tr>
        <td class="UMGMenuBody">
            <table id="tblColors" width="100%" runat="server" class="Normal">
                <tr>
                    <td width="200">
                        <asp:Label ID="plnavBackgroundColor" runat="server" resourcekey="navBackgroundColor"></asp:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="navBackgroundColor" runat="server">
                        </uc1:uccolorpicker></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="plprogressBackgroundColor" runat="server" resourcekey="progressBackgroundColor"></asp:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="progressBackgroundColor" runat="server">
                        </uc1:uccolorpicker></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="plprogressColor" runat="server" resourcekey="progressColor"></asp:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="progressColor" runat="server">
                        </uc1:uccolorpicker></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="pltextColor" runat="server" resourcekey="textColor"></asp:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="textColor" runat="server">
                        </uc1:uccolorpicker></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SectionHeader">
            <dnn:sectionhead id="dshAppearance" runat="server" resourcekey="AppearanceAndBehaviors"
                section="tblColors" IncludeRule="False" CssClass="SubHead" maximageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle1.gif"
                minimageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle2.gif">
            </dnn:sectionhead></td>
    </tr>
    <tr>
        <td class="UMGMenuBody">
            <table id="tblAppearance" width="100%" runat="server" class="Normal">
                <tr>
                    <td width="200">
                        <asp:Label ID="pltextSize" runat="server" resourcekey="textSize"></asp:Label></td>
                    <td class="Normal">
                        <asp:DropDownList ID="textSize" runat="server">
                            <asp:ListItem Value="9"></asp:ListItem>
                            <asp:ListItem Value="10"></asp:ListItem>
                            <asp:ListItem Value="11"></asp:ListItem>
                            <asp:ListItem Value="12"></asp:ListItem>
                            <asp:ListItem Value="13"></asp:ListItem>
                            <asp:ListItem Value="14"></asp:ListItem>
                            <asp:ListItem Value="16"></asp:ListItem>
                            <asp:ListItem Value="18"></asp:ListItem>
                            <asp:ListItem Value="20"></asp:ListItem>
                            <asp:ListItem Value="24"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="plspeed" runat="server" resourcekey="speed"></asp:Label></td>
                    <td class="Normal">
                        <asp:DropDownList ID="speed" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem Text="2"></asp:ListItem>
                            <asp:ListItem Text="3"></asp:ListItem>
                            <asp:ListItem Text="4"></asp:ListItem>
                            <asp:ListItem Text="5"></asp:ListItem>
                            <asp:ListItem Text="6"></asp:ListItem>
                            <asp:ListItem Text="7"></asp:ListItem>
                            <asp:ListItem Text="8"></asp:ListItem>
                            <asp:ListItem Text="9"></asp:ListItem>
                            <asp:ListItem Text="10"></asp:ListItem>
                            <asp:ListItem Text="12"></asp:ListItem>
                            <asp:ListItem Text="15"></asp:ListItem>
                            <asp:ListItem Text="30"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label1" runat="server" resourcekey="secondsperslide"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="pltransitionSpeed" runat="server" resourcekey="transitionSpeed"></asp:Label></td>
                    <td class="Normal">
                        <asp:DropDownList ID="transitionSpeed" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem Text="1"></asp:ListItem>
                            <asp:ListItem Text="2"></asp:ListItem>
                            <asp:ListItem Text="3"></asp:ListItem>
                            <asp:ListItem Text="4"></asp:ListItem>
                            <asp:ListItem Text="5"></asp:ListItem>
                            <asp:ListItem Text="6"></asp:ListItem>
                            <asp:ListItem Text="7"></asp:ListItem>
                            <asp:ListItem Text="8"></asp:ListItem>
                            <asp:ListItem Text="9"></asp:ListItem>
                            <asp:ListItem Text="10"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label2" runat="server" resourcekey="secondsperslide"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="pldepth" runat="server" resourcekey="depth"></asp:Label></td>
                    <td class="Normal">
                        <asp:TextBox ID="depth" runat="server" Width="40px" CssClass="NormalTextBox"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator4" runat="server" resourcekey="0to100" Type="Integer"
                            MinimumValue="0" MaximumValue="10000" ControlToValidate="depth"></asp:RangeValidator>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" runat="server" ControlToValidate="depth"
                            ValidationExpression="\d*" ErrorMessage="*"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td>
                        </td>
                    <td class="Normal">
                        <asp:CheckBox ID="loopPlay" runat="server" resourcekey="loopPlay" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td class="Normal">
                        <asp:CheckBox ID="hideNavigationBar" runat="server" resourcekey="hideNavigationBar" />
                    </td>
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
