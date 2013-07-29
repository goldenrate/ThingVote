<%@ Control Language="vb" AutoEventWireup="false" Inherits="BizModules.UltraPhotoGallery.FlashGallerySettingBase" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucColorPicker" Src="ucColorPicker.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<table cellSpacing="5" width="100%" id="tblContainer" runat="server">
	<tr>
		<td class="SectionHeader"><dnn:sectionhead id="dshColors" runat="server" resourcekey="Colors" section="tblColors" IncludeRule="False" CssClass="SubHead" maximageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle1.gif"
                minimageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle2.gif">
            </dnn:SectionHead></td>
	</tr>
	<tr>
		<td class="UMGMenuBody">
			<table id="tblColors" width="100%" runat="server" class="Normal">
			<tr>
				<td width="200"><asp:label id="plthumbnailBorder" runat="server" resourcekey="thumbnailBorder"></asp:label></td>
				<td class="Normal">
				<uc1:uccolorpicker id="thumbnail_border_color" runat="server"></uc1:uccolorpicker>
				<asp:dropdownlist id="thumbnail_border_size" runat="server" CssClass="NormalTextBox">
							        <asp:ListItem Value="0"></asp:ListItem>
							        <asp:ListItem Value="1"></asp:ListItem>
							        <asp:ListItem Value="2"></asp:ListItem>
							        <asp:ListItem Value="3"></asp:ListItem>
							        <asp:ListItem Value="4"></asp:ListItem>
							        <asp:ListItem Value="5"></asp:ListItem>
							        <asp:ListItem Value="6"></asp:ListItem>
							        <asp:ListItem Value="7"></asp:ListItem>
							        <asp:ListItem Value="8"></asp:ListItem>
							        <asp:ListItem Value="9"></asp:ListItem>
							        <asp:ListItem Value="10"></asp:ListItem>
						        </asp:dropdownlist>
				<asp:Label ID="plpixels" runat="server" resourcekey="pixels"></asp:Label>
				</td>
			</tr>
			<tr>
				<td><asp:label id="plphotoBorder" runat="server" resourcekey="photoBorder"></asp:label></td>
				<td class="Normal"><uc1:uccolorpicker id="photo_border_color" runat="server"></uc1:uccolorpicker>
				<asp:dropdownlist id="photo_border_size" runat="server" CssClass="NormalTextBox">
							        <asp:ListItem Value="0"></asp:ListItem>
							        <asp:ListItem Value="1"></asp:ListItem>
							        <asp:ListItem Value="2"></asp:ListItem>
							        <asp:ListItem Value="3"></asp:ListItem>
							        <asp:ListItem Value="4"></asp:ListItem>
							        <asp:ListItem Value="5"></asp:ListItem>
							        <asp:ListItem Value="6"></asp:ListItem>
							        <asp:ListItem Value="7"></asp:ListItem>
							        <asp:ListItem Value="8"></asp:ListItem>
							        <asp:ListItem Value="9"></asp:ListItem>
							        <asp:ListItem Value="10"></asp:ListItem>
						        </asp:dropdownlist>
				<asp:Label ID="Label1" runat="server" resourcekey="pixels"></asp:Label>
				</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="SectionHeader"><dnn:sectionhead id="dshAppearance" runat="server" resourcekey="AppearanceAndBehaviors" section="tblColors" IncludeRule="False" CssClass="SubHead" maximageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle1.gif"
                minimageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle2.gif">
            </dnn:SectionHead></td>
	</tr>
	<tr>
		<td class="UMGMenuBody">
			<table id="tblAppearance" width="100%" runat="server" class="Normal">
			<tr>
				<td width="200">
					<asp:label id="pltweenDuration" runat="server" resourcekey="tweenDuration"></asp:label></td>
				<td class="Normal">
					<asp:dropdownlist id="tween_duration" runat="server" CssClass="NormalTextBox">
							        <asp:ListItem Value="0.1"></asp:ListItem>
							        <asp:ListItem Value="0.2"></asp:ListItem>
							        <asp:ListItem Value="0.3"></asp:ListItem>
							        <asp:ListItem Value="0.4"></asp:ListItem>
							        <asp:ListItem Value="0.5"></asp:ListItem>
							        <asp:ListItem Value="0.6"></asp:ListItem>
							        <asp:ListItem Value="0.7"></asp:ListItem>
							        <asp:ListItem Value="0.8"></asp:ListItem>
							        <asp:ListItem Value="0.9"></asp:ListItem>
							        <asp:ListItem Value="1"></asp:ListItem>
						        </asp:dropdownlist></td>
			</tr>
			<tr>
				<td>
					<asp:label id="plshowFullScreen" runat="server" resourcekey="showFullScreen"></asp:label></td>
				<td class="Normal">
					<asp:checkbox id="fullscreen_button" runat="server" />
				</td>
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
