<%@ Control Language="vb" AutoEventWireup="false" Codebehind="HtmlslideAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.HtmlslideAppearance" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucColorPicker" Src="ucColorPicker.ascx" %>

<script type="text/javascript" src="<%=ResolveUrl("htmlslide/scripts/jquery.tools.min.js") %>"></script>

<style type="text/css">

/* tooltip styling. by default the element to be styled is .tooltip  */
.tooltip {
	display:none;
	background-image:url('<%=ModulePath+"images/tooltipbg.png" %>');
	background-repeat:no-repeat;
	padding-left:15px;
	padding-top:15px;
	padding-right:5px;
	padding-bottom:5px;
}

</style>

<script type="text/javascript">
$(document).ready(function() {
    $("#<%=rdoTemplate.ClientID %> span[title]").tooltip({position:"bottom right"});
});

</script>

<table cellspacing="5" width="100%" id="tblContainer" runat="server">
	<tr>
		<td class="SectionHeader"><dnn:sectionhead id="dshTemplate" runat="server" resourcekey="TemplateAndMode" section="tblTemplate" IncludeRule="False" CssClass="SubHead" maximageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle1.gif"
                minimageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle2.gif">
            </dnn:SectionHead></td>
	</tr>
	<tr>
		<td class="UMGMenuBody">
			<table id="tblTemplate" width="100%" runat="server" class="Normal">
                <tr>
                    <td>
                        <asp:Label ID="Label21" runat="server" resourcekey="Slideshow_Mode"></asp:Label></td>
                    <td>
                    <asp:RadioButtonList ID="rdoSlideshow_Mode" runat="server" RepeatDirection="Vertical"
                            CssClass="Normal" AutoPostBack="true">
                            <asp:ListItem Value="Image" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="Freetext"></asp:ListItem>
                        </asp:RadioButtonList>
                        <div class="UMGMenuBody" style="width:300px;">
                            <asp:Panel ID="pnlImageSlideshow" runat="server">
                            <asp:Label ID="Label2" runat="server" resourcekey="Transition_Image"></asp:Label>:
                            <asp:DropDownList ID="rdoTransition_Image" runat="server" CssClass="Normal">
                            </asp:DropDownList>
                            <br />
                                <asp:Label ID="Label3" runat="server" resourcekey="Transition_Caption"></asp:Label>:
                                <asp:DropDownList ID="rdoTransition_Caption" runat="server" CssClass="Normal">
                            </asp:DropDownList>
                            </asp:Panel>
                            <asp:Panel ID="pnlFreetextSlideshow" runat="server" Visible="false">
                            <asp:Label ID="Label25" runat="server" resourcekey="Transition_Freetext"></asp:Label>:
                                <asp:DropDownList ID="rdoTransition_Freetext" runat="server" CssClass="Normal">
                            </asp:DropDownList>
                            </asp:Panel>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="130">
                        <dnn:Label ID="Label1" runat="server" resourcekey="Template"></dnn:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rdoTemplate" runat="server" RepeatDirection="Horizontal"
                            CssClass="Normal" RepeatColumns="5">
                        </asp:RadioButtonList>
                    </td>
                </tr>
                </table>
                </td></tr>
                	<tr>
		<td class="SectionHeader"><dnn:sectionhead id="dshOptions" runat="server" resourcekey="Options" section="tblOptions" IncludeRule="False" CssClass="SubHead" maximageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle1.gif"
                minimageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle2.gif">
            </dnn:SectionHead></td>
	</tr>
	<tr>
		<td class="UMGMenuBody">
			<table id="tblOptions" width="100%" runat="server" class="Normal">
                <tr>
                    <td width="130">
                        <asp:Label ID="Label20" runat="server" resourcekey="Easing"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="rdoEasing" runat="server" CssClass="Normal">
                            <asp:ListItem Text="Default(swing)" Value="swing"></asp:ListItem>
                            <asp:ListItem Value="linear"></asp:ListItem>
                            <asp:ListItem Text="InQuad" Value="easeInQuad"></asp:ListItem>
                            <asp:ListItem Text="OutQuad" Value="easeOutQuad"></asp:ListItem>
                            <asp:ListItem Text="InOutQuad" Value="easeInOutQuad"></asp:ListItem>
                            <asp:ListItem Text="InCubic" Value="easeInCubic"></asp:ListItem>
                            <asp:ListItem Text="OutCubic" Value="easeOutCubic"></asp:ListItem>
                            <asp:ListItem Text="InOutCubic" Value="easeInOutCubic"></asp:ListItem>
                            <asp:ListItem Text="InQuart" Value="easeInQuart"></asp:ListItem>
                            <asp:ListItem Text="OutQuart" Value="easeOutQuart"></asp:ListItem>
                            <asp:ListItem Text="InOutQuart" Value="easeInOutQuart"></asp:ListItem>
                            <asp:ListItem Text="InQuint" Value="easeInQuint"></asp:ListItem>
                            <asp:ListItem Text="OutQuint" Value="easeOutQuint"></asp:ListItem>
                            <asp:ListItem Text="InOutQuint" Value="easeInOutQuint"></asp:ListItem>
                            <asp:ListItem Text="InSine" Value="easeInSine"></asp:ListItem>
                            <asp:ListItem Text="OutSine" Value="easeOutSine"></asp:ListItem>
                            <asp:ListItem Text="InOutSine" Value="easeInOutSine"></asp:ListItem>
                            <asp:ListItem Text="InExpo" Value="easeInExpo"></asp:ListItem>
                            <asp:ListItem Text="OutExpo" Value="easeOutExpo"></asp:ListItem>
                            <asp:ListItem Text="InOutExpo" Value="easeInOutExpo"></asp:ListItem>
                            <asp:ListItem Text="InCirc" Value="easeInCirc"></asp:ListItem>
                            <asp:ListItem Text="OutCirc" Value="easeOutCirc"></asp:ListItem>
                            <asp:ListItem Text="InOutCirc" Value="easeInOutCirc"></asp:ListItem>
                            <asp:ListItem Text="InElastic" Value="easeInElastic"></asp:ListItem>
                            <asp:ListItem Text="OutElastic" Value="easeOutElastic"></asp:ListItem>
                            <asp:ListItem Text="InOutElastic" Value="easeInOutElastic"></asp:ListItem>
                            <asp:ListItem Text="InBack" Value="easeInBack"></asp:ListItem>
                            <asp:ListItem Text="OutBack" Value="easeOutBack"></asp:ListItem>
                            <asp:ListItem Text="InOutBack" Value="easeInOutBack"></asp:ListItem>
                            <asp:ListItem Text="InBounce" Value="easeInBounce"></asp:ListItem>
                            <asp:ListItem Text="OutBounce" Value="easeOutBounce"></asp:ListItem>
                            <asp:ListItem Text="InOutBounce" Value="easeInOutBounce"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" resourcekey="Max_Slides"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" resourcekey="Max_Slides.Help"></asp:Label>
                        <asp:DropDownList ID="cboMaxSlides" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem Value="0"></asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>25</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                        </asp:DropDownList>,
                        <asp:Label ID="Label6" runat="server" resourcekey="Choose_Slides1.Text"></asp:Label>
                        <asp:DropDownList ID="cboChooseSlides" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem>Predefined</asp:ListItem>
                            <asp:ListItem>Random</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label7" runat="server" resourcekey="Choose_Slides2.Text"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" resourcekey="AutoPlay"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkDoAutoPlay" runat="server" resourcekey="DoAutoPlay" Checked="True" />
                        <asp:Label ID="Label9" runat="server" resourcekey="AutoPlay1.Help"></asp:Label>
                        <asp:DropDownList ID="cboAutoPlay" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem Selected="true">5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label10" runat="server" resourcekey="AutoPlay2.Help"></asp:Label>
                        <asp:DropDownList ID="cboLoopPlay" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem>Stop</asp:ListItem>
                            <asp:ListItem>Loop</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label11" runat="server" resourcekey="LoopPlay.Help"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label12" runat="server" resourcekey="Visibility"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label13" runat="server" resourcekey="Visibility.Help"></asp:Label>
                        <br />
                        <asp:CheckBoxList ID="chkVisibility" runat="server" RepeatDirection="Horizontal" RepeatColumns="5"
                            CssClass="NormalTextBox">
                            <asp:ListItem Value="Countdown"></asp:ListItem>
                            <asp:ListItem Value="Caption"></asp:ListItem>
                            <asp:ListItem Value="CaptionTitle"></asp:ListItem>
                            <asp:ListItem Value="CaptionDescription"></asp:ListItem>
                            <asp:ListItem Value="Buttons"></asp:ListItem>
                            <asp:ListItem Value="Navi"></asp:ListItem>
                            <asp:ListItem Value="More"></asp:ListItem>
                            <asp:ListItem Value="Loading"></asp:ListItem>
                            <asp:ListItem Value="ThumbsList"></asp:ListItem>
                            <asp:ListItem Value="XOfY"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label14" runat="server" resourcekey="ArrowKey"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="cboArrowKey" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem Value="Use"></asp:ListItem>
                            <asp:ListItem Value="DonotUse"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label15" runat="server" resourcekey="ArrowKey.Help"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label16" runat="server" resourcekey="MouseOver"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label17" runat="server" resourcekey="MouseOver.Help"></asp:Label>
                        <asp:DropDownList ID="cboMouseOver" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem Value="DoNothing"></asp:ListItem>
                            <asp:ListItem Value="MoveTo"></asp:ListItem>
                            <asp:ListItem Value="Scroll"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label18" runat="server" resourcekey="Colors"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label19" runat="server" resourcekey="BackgroungColor"></asp:Label>
                        <uc1:uccolorpicker id="backgroundColor" runat="server" Color="">
                        </uc1:uccolorpicker>
                        <br />
                        
                        <asp:Label ID="Label22" runat="server" resourcekey="TextColor"></asp:Label>
                        <uc1:uccolorpicker id="textColor" runat="server" Color="">
                        </uc1:uccolorpicker>
                        <asp:Label ID="Label24" runat="server" resourcekey="TextSize"></asp:Label>
                        <asp:DropDownList ID="cboTextSize" runat="server" CssClass="NormalTextBox">
                        <asp:ListItem Value="8"></asp:ListItem>
                        <asp:ListItem Value="9"></asp:ListItem>
                        <asp:ListItem Value="10"></asp:ListItem>
                        <asp:ListItem Value="11"></asp:ListItem>
                        <asp:ListItem Value="12" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="13"></asp:ListItem>
                        <asp:ListItem Value="15"></asp:ListItem>
                        <asp:ListItem Value="18"></asp:ListItem>
                        </asp:DropDownList>
                        px
                        <br />
                        
                        <asp:Label ID="Label23" runat="server" resourcekey="CaptionTitleColor"></asp:Label>
                        <uc1:uccolorpicker id="captionTitleColor" runat="server" Color="">
                        </uc1:uccolorpicker>
                    </td>
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
