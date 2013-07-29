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
                        <asp:Label ID="plcaptionBackgroundColor" runat="server" resourcekey="captionBackgroundColor"></asp:Label></td>
                    <td class="Normal">
                        <asp:Label ID="Label1" runat="server" resourcekey="color"></asp:Label>:
                        <uc1:uccolorpicker id="captionBackgroundColor" runat="server">
                        </uc1:uccolorpicker>
                        &nbsp;
                        <asp:Label ID="Label2" runat="server" resourcekey="transparence"></asp:Label>:
                        <asp:DropDownList ID="captionBackgroundAlpha" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem Text="0"></asp:ListItem>
                            <asp:ListItem Text="5"></asp:ListItem>
                            <asp:ListItem Text="10"></asp:ListItem>
                            <asp:ListItem Text="15"></asp:ListItem>
                            <asp:ListItem Text="20"></asp:ListItem>
                            <asp:ListItem Text="25"></asp:ListItem>
                            <asp:ListItem Text="30"></asp:ListItem>
                            <asp:ListItem Text="35"></asp:ListItem>
                            <asp:ListItem Text="40"></asp:ListItem>
                            <asp:ListItem Text="45"></asp:ListItem>
                            <asp:ListItem Text="50"></asp:ListItem>
                            <asp:ListItem Text="55"></asp:ListItem>
                            <asp:ListItem Text="60"></asp:ListItem>
                            <asp:ListItem Text="65"></asp:ListItem>
                            <asp:ListItem Text="70"></asp:ListItem>
                            <asp:ListItem Text="75"></asp:ListItem>
                            <asp:ListItem Text="80"></asp:ListItem>
                            <asp:ListItem Text="85"></asp:ListItem>
                            <asp:ListItem Text="90"></asp:ListItem>
                            <asp:ListItem Text="95"></asp:ListItem>
                            <asp:ListItem Text="100"></asp:ListItem>
                        </asp:DropDownList>%
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="plselectedBackgroundColor" runat="server" resourcekey="selectedBackgroundColor"></asp:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="selectedBackgroundColor" runat="server">
                        </uc1:uccolorpicker></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="plunselectedBackgroundColor" runat="server" resourcekey="unselectedBackgroundColor"></asp:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="unselectedBackgroundColor" runat="server">
                        </uc1:uccolorpicker></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="plcaptionTextColor" runat="server" resourcekey="captionTextColor"></asp:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="captionTextColor" runat="server">
                        </uc1:uccolorpicker></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="pllineColor" runat="server" resourcekey="lineColor"></asp:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="lineColor" runat="server">
                        </uc1:uccolorpicker></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="pltextColor" runat="server" resourcekey="textColor"></asp:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="textColor" runat="server">
                        </uc1:uccolorpicker></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="plselectedTextColor" runat="server" resourcekey="selectedTextColor"></asp:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="selectedTextColor" runat="server">
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
                        <asp:Label ID="plitemWidth" runat="server" resourcekey="itemWidth"></asp:Label></td>
                    <td class="Normal">
                        <asp:TextBox ID="itemWidth" runat="server" Width="40px" CssClass="NormalTextBox"></asp:TextBox>px
                        <asp:RangeValidator ID="RangeValidator4" runat="server" resourcekey="0to300" Type="Integer"
                            MinimumValue="0" MaximumValue="300" ControlToValidate="itemWidth"></asp:RangeValidator>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" runat="server" ControlToValidate="itemWidth"
                            ValidationExpression="\d*" ErrorMessage="*"></asp:RegularExpressionValidator></td>
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
                        <asp:Label ID="Label3" runat="server" resourcekey="secondsperslide"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="plenter" runat="server" resourcekey="enter"></asp:Label></td>
                    <td class="Normal">
                        <asp:TextBox ID="enter" runat="server" Checked="True" Width="145"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td class="Normal">
                        <asp:CheckBox ID="linkInCurrent" runat="server" resourcekey="openLinkInCurrent"></asp:CheckBox></td>
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
