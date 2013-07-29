<%@ Control Language="vb" AutoEventWireup="false" Inherits="BizModules.UltraPhotoGallery.FlashGallerySettingBase" %>
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
				<td width="200"><asp:label id="plthemeColorDark" runat="server" suffix=":" resourcekey="themeColorDark"></asp:label></td>
				<td class="Normal"><uc1:uccolorpicker id="themeColorDark" runat="server"></uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td><asp:label id="plthemeColorLight" runat="server" suffix=":" resourcekey="themeColorLight"></asp:label></td>
				<td class="Normal"><uc1:uccolorpicker id="themeColorLight" runat="server"></uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td><asp:label id="plbgColor" runat="server" suffix=":" resourcekey="bgColor"></asp:label></td>
				<td class="Normal"><uc1:uccolorpicker id="bgColor" runat="server"></uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td><asp:label id="plalbumTitleColor" runat="server" suffix=":" resourcekey="albumTitleColor"></asp:label></td>
				<td class="Normal"><uc1:uccolorpicker id="albumTitleColor" runat="server"></uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td><asp:label id="plvideoTextColor" runat="server" suffix=":" resourcekey="videoTextColor"></asp:label></td>
				<td class="Normal"><uc1:uccolorpicker id="videoTextColor" runat="server"></uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td><asp:label id="pllineColor" runat="server" suffix=":" resourcekey="lineColor"></asp:label></td>
				<td class="Normal"><uc1:uccolorpicker id="lineColor" runat="server"></uc1:uccolorpicker></td>
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
					<asp:label id="plspeed" runat="server" resourcekey="speed" suffix=":"></asp:label></td>
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
					</td>
			</tr>
			<tr>
				<td>
					<asp:label id="plalbumPadding" runat="server" resourcekey="albumPadding" suffix=":"></asp:label></td>
				<td class="Normal">
				<asp:DropDownList ID="albumPadding" Width="60" runat="server" CssClass="Normal">
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
						<asp:ListItem Value="55"></asp:ListItem>
						<asp:ListItem Value="60"></asp:ListItem>
						<asp:ListItem Value="65"></asp:ListItem>
						<asp:ListItem Value="70"></asp:ListItem>
						<asp:ListItem Value="75"></asp:ListItem>
						<asp:ListItem Value="80"></asp:ListItem>
						<asp:ListItem Value="85"></asp:ListItem>
						<asp:ListItem Value="90"></asp:ListItem>
						<asp:ListItem Value="95"></asp:ListItem>
						<asp:ListItem Value="100"></asp:ListItem>
					</asp:DropDownList>px
					</td>
			</tr>
			<tr>
				<td>
					<asp:label id="plclickToPlay" runat="server" resourcekey="clickToPlay" suffix="?"></asp:label></td>
				<td class="Normal">
					<asp:checkbox id="clickToPlay" runat="server" resourcekey="Yes" />
				</td>
			</tr>
			<tr>
				<td>
					<asp:label id="plautoPlay" runat="server" resourcekey="autoPlay" suffix="?"></asp:label></td>
				<td class="Normal">
					<asp:checkbox id="autoPlay" runat="server" resourcekey="Yes" />
				</td>
			</tr>
			<tr>
				<td>
					<asp:label id="plvideoFitToStage" runat="server" resourcekey="videoFitToStage" suffix="?"></asp:label></td>
				<td class="Normal">
					<asp:checkbox id="videoFitToStage" runat="server" resourcekey="Yes" />
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
