<%@ Control Language="vb" AutoEventWireup="false" Codebehind="SideNavAppearance.ascx.vb" Inherits="BizModules.UltraPhotoGallery.Presentation.SideNavAppearance" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucColorPicker" Src="ucColorPicker.ascx" %>

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
				<td width="200"><asp:label id="plbackgroundColor" runat="server" resourcekey="backgroundColor"></asp:label></td>
				<td class="Normal"><uc1:uccolorpicker id="backgroundColor" runat="server"></uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td><asp:label id="plthumbnailBackgroundColor" runat="server" resourcekey="thumbnailBackgroundColor"></asp:label></td>
				<td class="Normal"><uc1:uccolorpicker id="thumbnailBackgroundColor" runat="server"></uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td><asp:label id="plcontrolBarBackgroundColor" runat="server" resourcekey="controlBarBackgroundColor"></asp:label></td>
				<td class="Normal"><uc1:uccolorpicker id="controlBarBackgroundColor" runat="server"></uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td><asp:label id="pltextColor" runat="server" resourcekey="textColor"></asp:label></td>
				<td class="Normal"><uc1:uccolorpicker id="textColor" runat="server"></uc1:uccolorpicker></td>
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
						<asp:label id="pltextSize" runat="server" resourcekey="textSize"></asp:label></td>
					<td class="Normal">
						<asp:dropdownlist id="textSize" runat="server" CssClass="NormalTextBox">
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
						        </asp:dropdownlist></td>
				</tr>
				<tr>
					<td>
						<asp:label id="plspeed" runat="server" resourcekey="speed"></asp:label></td>
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
                                <asp:label id="Label1" runat="server" resourcekey="secondsperslide"></asp:label>
                                </td>
				</tr>
							<tr>
								<td>
									<asp:label id="plautoStart" runat="server" resourcekey="autoStart"></asp:label></td>
								<td class="Normal">
									<asp:CheckBox id="autoPlay" runat="server" resourcekey="Yes" Checked="True"></asp:CheckBox></td>
							</tr>
				<tr>
					<td>
						<asp:label id="plcontrolBarHeight" runat="server" resourcekey="controlBarHeight"></asp:label></td>
					<td class="Normal">
					<asp:DropDownList ID="controlBarHeight" runat="server" CssClass="NormalTextBox">
                                    <asp:ListItem Text="20"></asp:ListItem>
                                    <asp:ListItem Text="25"></asp:ListItem>
                                    <asp:ListItem Text="30"></asp:ListItem>
                                    <asp:ListItem Text="35"></asp:ListItem>
                                    <asp:ListItem Text="40"></asp:ListItem>
                                    <asp:ListItem Text="45"></asp:ListItem>
                                    <asp:ListItem Text="50"></asp:ListItem>
                                    <asp:ListItem Text="55"></asp:ListItem>
                                    <asp:ListItem Text="60"></asp:ListItem>
                                </asp:DropDownList>px</td>
				</tr>
				<tr>
					<td>
						<asp:label id="pltransition" runat="server" resourcekey="transition"></asp:label></td>
					<td class="Normal">
						<asp:dropdownlist id="transition" runat="server" CssClass="NormalTextBox">
							<asp:ListItem Value="Fade-in"></asp:ListItem>
							<asp:ListItem Value="Wipe"></asp:ListItem>
							<asp:ListItem Value="Curtain"></asp:ListItem>
							<asp:ListItem Value="Dissolve"></asp:ListItem>
							<asp:ListItem Value="Fly-in"></asp:ListItem>
							<asp:ListItem Value="Zoom"></asp:ListItem>
							<asp:ListItem Value="Squeeze"></asp:ListItem>
							<asp:ListItem Value="Repeat"></asp:ListItem>
						</asp:dropdownlist></td>
				</tr>
				<tr>
					<td>
						<asp:label id="plthumbnailPosition" runat="server" resourcekey="thumbnailPosition"></asp:label></td>
					<td class="Normal">
						<asp:dropdownlist id="thumbnailPosition" runat="server" CssClass="NormalTextBox">
							<asp:ListItem Value="Left"></asp:ListItem>
							<asp:ListItem Value="Right"></asp:ListItem>
						</asp:dropdownlist></td>
				</tr>
				<tr>
					<td>
						<asp:label id="plOnClick" runat="server" resourcekey="onClick"></asp:label></td>
					<td class="Normal">
						<asp:dropdownlist id="onClick" runat="server" CssClass="NormalTextBox">
							<asp:ListItem Value="Open"></asp:ListItem>
							<asp:ListItem Value="Exif"></asp:ListItem>
							<asp:ListItem Value="Save"></asp:ListItem>
							<asp:ListItem Value="Link"></asp:ListItem>
							<asp:ListItem Value="Download"></asp:ListItem>
							<asp:ListItem Value="Lightbox"></asp:ListItem>
							<asp:ListItem Value="Nothing"></asp:ListItem>
						</asp:dropdownlist></td>
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
