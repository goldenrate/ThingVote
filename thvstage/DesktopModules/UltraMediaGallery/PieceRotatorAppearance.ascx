<%@ Control Language="vb" AutoEventWireup="false" Codebehind="PieceRotatorAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.PieceRotatorAppearance" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>

<table cellSpacing="5" width="100%" id="tblContainer" runat="server">
	<tr>
		<td class="SectionHeader"><dnn:sectionhead id="dshSettings" runat="server" resourcekey="Settings" section="tblSettings" IncludeRule="False" CssClass="SubHead" maximageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle1.gif"
                minimageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle2.gif">
            </dnn:SectionHead></td>
	</tr>
	<tr>
		<td class="UMGMenuBody">
			<table id="tblSettings" width="100%" runat="server" class="Normal">
			<tr>
			<td style="text-align:left;">
				<div style="width:100%; height:200px;overflow:scroll;color:#666666;">
				    Use following setting options to control colors and behaviors of the rotator.
                    <br />
                    <br />
<span style="color:#000000;">LoaderColor</span> = "0x333333" - Color of the cubes before the first image appears, also the color of the back sides of the cube, which become visible at some transition types
                    <br />
<span style="color:#000000;">InnerSideColor</span> = "0x222222" - Color of the inner sides of the cube when sliced
                    <br />
<span style="color:#000000;">SideShadowAlpha</span> = "0.8" - Sides get darker when moved away from the front. This is the degree of darkness - 0 == no change, 1 == 100% black
                    <br />
<span style="color:#000000;">DropShadowAlpha</span> = "0.7" - Alpha of the drop shadow - 0 == no shadow, 1 == opaque
                    <br />
<span style="color:#000000;">DropShadowDistance</span> = "25" - Distance of the shadow from the bottom of the image
                    <br />
<span style="color:#000000;">DropShadowScale</span> = "0.95" - As the shadow is blurred, it appears wider that the actual image, when not resized. Thus it's a good idea to make it slightly smaller. - 1 would be no resizing at all.
                    <br />
<span style="color:#000000;">DropShadowBlurX</span> = "40" - Blur of the drop shadow on the x-axis
                    <br />
<span style="color:#000000;">DropShadowBlurY</span> = "4" - Blur of the drop shadow on the y-axis
                    <br />
<span style="color:#000000;">MenuDistanceX</span> = "20" - Distance between two menu items (from center to center)
                    <br />
<span style="color:#000000;">MenuDistanceY</span> = "50" - Distance of the menu from the bottom of the image
                    <br />
<span style="color:#000000;">MenuColor1</span> = "0x999999" - Color of an inactive menu item
                    <br />
<span style="color:#000000;">MenuColor2</span> = "0x333333" - Color of an active menu item
                    <br />
<span style="color:#000000;">MenuColor3</span> = "0xFFFFFF" - Color of the inner circle of an active menu item. Should equal the background color of the whole thing.
                    <br />
<span style="color:#000000;">ControlSize</span> = "100" - Size of the controls, which appear on rollover (play, stop, info, link)
                    <br />
<span style="color:#000000;">ControlDistance</span> = "20" - Distance between the controls (from the borders)
                    <br />
<span style="color:#000000;">ControlColor1</span> = "0x222222" - Background color of the controls
                    <br />
<span style="color:#000000;">ControlColor2</span> = "0xFFFFFF" - Font color of the controls
                    <br />
<span style="color:#000000;">ControlAlpha</span> = "0.8" - Alpha of a control, when mouse is not over
                    <br />
<span style="color:#000000;">ControlAlphaOver</span> = "0.95" - Alpha of a control, when mouse is over
                    <br />
<span style="color:#000000;">ControlsX</span> = "450" - X-position of the point, which aligns the controls (measured from [0,0] of the image)
                    <br />
<span style="color:#000000;">ControlsY</span> = "280" - Y-position of the point, which aligns the controls (measured from [0,0] of the image)
                    <br />
<span style="color:#000000;">ControlsAlign</span> = "center" - Type of alignment from the point [controlsX, controlsY] - can be "center", "left" or "right"
                    <br />
<span style="color:#000000;">TooltipHeight</span> = "31" - Height of the tooltip surface in the menu
                    <br />
<span style="color:#000000;">TooltipColor</span> = "0x222222" - Color of the tooltip surface in the menu
                    <br />
<span style="color:#000000;">TooltipTextY</span> = "5" - Y-distance of the tooltip text field from the top of the tooltip
                    <br />
<span style="color:#000000;">TooltipTextStyle</span> = "P-Italic" - The style of the tooltip text, specified in the CSS file
                    <br />
<span style="color:#000000;">TooltipTextColor</span> = "0xFFFFFF" - Color of the tooltip text
                    <br />
<span style="color:#000000;">TooltipMarginLeft</span> = "5" - Margin of the text to the left end of the tooltip
                    <br />
<span style="color:#000000;">TooltipMarginRight</span> = "7" - Margin of the text to the right end of the tooltip
                    <br />
<span style="color:#000000;">TooltipTextSharpness</span> = "50" - Sharpness of the tooltip text (-400 to 400) - see Adobe Docs
                    <br />
<span style="color:#000000;">TooltipTextThickness</span> = "-100" - Thickness of the tooltip text (-400 to 400) - see Adobe Docs
                    <br />
<span style="color:#000000;">InfoWidth</span> = "400" - The width of the info text field
                    <br />
<span style="color:#000000;">InfoBackground</span> = "0xFFFFFF" - The background color of the info text field
                    <br />
<span style="color:#000000;">InfoBackgroundAlpha</span> = "0.95" - The alpha of the background of the info text, the image shines through, when smaller than 1
                    <br />
<span style="color:#000000;">InfoMargin</span> = "15" - The margin of the text field in the info section to all sides
                    <br />
<span style="color:#000000;">InfoSharpness</span> = "0" - Sharpness of the info text (see above)
                    <br />
<span style="color:#000000;">InfoThickness</span> = "0" - Thickness of the info text (see above)
                    <br />
<span style="color:#000000;">Autoplay</span> = "10" - Number of seconds from one transition to another, if not stopped. Set to 0 to disable autoplay
                    <br />
<span style="color:#000000;">FieldOfView</span> = "45" - see the official Adobe Docs
                    <br />
<span style="color:#000000;">MediaBlankAreaColor</span> = "0x000000" - The color of the blank areas of medias
                    <br />
<span style="color:#000000;">ShowVideoAndFlashThumb</span> = "False" - Show the thumbnail of videos and flash contents</div>
			</td>
	        </tr><tr>
				<td class="Normal">
					<asp:textbox id="txtSettings" runat="server" width="100%" height="150px" textmode="multiline" cssclass="NormalTextbox"></asp:textbox></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="SectionHeader"><dnn:sectionhead id="dshTransitions" runat="server" resourcekey="Transitions" section="tblTransitions" IncludeRule="False" CssClass="SubHead" maximageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle1.gif"
                minimageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle2.gif">
            </dnn:SectionHead></td>
	</tr>
	<tr>
		<td class="UMGMenuBody">
			<table id="tblTransitions" width="100%" runat="server" class="Normal">
			<tr>
				<td style="text-align:left;">
					<div style="width:100%; height:200px;overflow:scroll;color:#666666;">
You can add as many transitions to the Piecemaker as you want. These transitions will be started in the order they are specified in the XML file. This order is entirely independent from the order of contents. Once the last transition is reached, it starts over again with the first transition.
                        <br />
Every transition needs to have the following six attributes assigned to it:
                        <br />
                        <br />
Pieces = "9" - Number of pieces to which the image is sliced
                        <br />
Time = "1.2" - Time for one cube to turn
                        <br />
Transition = "easeInOutBack" - Transition type of the Tweener class. For more info on these types see the official Tweener Documentation and go to "Transition Types". The best results are achieved by those transition types, which begin with easeInOut.
                        <br />
Delay = "0.1" - Delay between the start of one cube to the start of the next cube
                        <br />
DepthOffset = "300" - The offset during transition on the z-axis. Value between 100 and 1000 are recommended. But go for experiments. :)
                        <br />
CubeDistance = "30" - The distance between the cubes during transition. Values between 5 and 50 are recommended. But go for experiments.:)                    </div></td>
	        </tr><tr>
				<td class="Normal">
								<asp:textbox id="txtTransitions" runat="server" width="100%" height="150px" textmode="multiline" cssclass="NormalTextbox"></asp:textbox></td>
			</tr>
			</table>
		</td>
	</tr>
</table>
<p align="center">
	<asp:linkbutton class="CommandButton" id="cmdLoadDefault" runat="server" resourcekey="cmdLoadDefault"
		text="" borderstyle="none" CausesValidation="false"></asp:linkbutton>&nbsp;
	<asp:linkbutton class="CommandButton" id="cmdSaveAsDefault" runat="server" resourcekey="cmdSaveAsDefault"
		text="" borderstyle="none"></asp:linkbutton>&nbsp;
	<asp:linkbutton class="CommandButton" id="cmdUpdate" runat="server" resourcekey="cmdUpdate" text=""
		borderstyle="none"></asp:linkbutton>&nbsp;
	<asp:linkbutton class="CommandButton" id="cmdCancel" runat="server" resourcekey="cmdCancel" text=""
		borderstyle="none" causesvalidation="False"></asp:linkbutton>
</p>