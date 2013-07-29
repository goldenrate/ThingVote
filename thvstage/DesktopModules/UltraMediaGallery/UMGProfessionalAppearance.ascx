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
				<td width="200">
					<asp:Label ID="Label0" runat="server" resourcekey="backgroundColor"></asp:Label></td>
				<td class="Normal">
					<uc1:uccolorpicker id="backgroundColor" runat="server">
					</uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label1" runat="server" resourcekey="albumBackgroundColor"></asp:Label></td>
				<td class="Normal">
					<uc1:uccolorpicker id="albumBackgroundColor" runat="server">
					</uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label2" runat="server" resourcekey="controlBackgroundColor"></asp:Label></td>
				<td class="Normal">
					<uc1:uccolorpicker id="controlBackgroundColor" runat="server">
					</uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label3" runat="server" resourcekey="thumbBorderColor"></asp:Label></td>
				<td class="Normal">
					<uc1:uccolorpicker id="thumbBorderColor" runat="server">
					</uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label4" runat="server" resourcekey="activeThumbBorderColor"></asp:Label></td>
				<td class="Normal">
					<uc1:uccolorpicker id="activeThumbBorderColor" runat="server">
					</uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label5" runat="server" resourcekey="albumTitleColor"></asp:Label></td>
				<td class="Normal">
					<uc1:uccolorpicker id="albumTitleColor" runat="server">
					</uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label6" runat="server" resourcekey="albumSubTitleColor"></asp:Label></td>
				<td class="Normal">
					<uc1:uccolorpicker id="albumSubTitleColor" runat="server">
					</uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label7" runat="server" resourcekey="albumTextColor"></asp:Label></td>
				<td class="Normal">
					<uc1:uccolorpicker id="albumTextColor" runat="server">
					</uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label8" runat="server" resourcekey="menuTextColor"></asp:Label></td>
				<td class="Normal">
					<uc1:uccolorpicker id="menuTextColor" runat="server">
					</uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label9" runat="server" resourcekey="windowTextColor"></asp:Label></td>
				<td class="Normal">
					<uc1:uccolorpicker id="windowTextColor" runat="server">
					</uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label10" runat="server" resourcekey="windowCaptionTextColor"></asp:Label></td>
				<td class="Normal">
					<uc1:uccolorpicker id="windowCaptionTextColor" runat="server">
					</uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label11" runat="server" resourcekey="exifTextColor"></asp:Label></td>
				<td class="Normal">
					<uc1:uccolorpicker id="exifTextColor" runat="server">
					</uc1:uccolorpicker></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="SectionHeader"><dnn:sectionhead id="dshAppearance" runat="server" resourcekey="Appearance" section="tblColors" IncludeRule="False" CssClass="SubHead" maximageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle1.gif"
                minimageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle2.gif">
            </dnn:SectionHead></td>
	</tr>
	<tr>
		<td class="UMGMenuBody">
			<table id="tblAppearance" width="100%" runat="server" class="Normal">
			<tr>
				<td width="200">
					<asp:Label ID="Label12" runat="server" resourcekey="controlBackgroundAlpha"></asp:Label></td>
				<td class="Normal">
					<asp:DropDownList ID="controlBackgroundAlpha" runat="server" CssClass="Normal">
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
					</asp:DropDownList>%
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label13" runat="server" resourcekey="thumbWidth"></asp:Label></td>
				<td class="Normal">
					<asp:DropDownList ID="thumbWidth" runat="server" CssClass="Normal">
						<asp:ListItem Value="20"></asp:ListItem>
						<asp:ListItem Value="22"></asp:ListItem>
						<asp:ListItem Value="24"></asp:ListItem>
						<asp:ListItem Value="26"></asp:ListItem>
						<asp:ListItem Value="28"></asp:ListItem>
						<asp:ListItem Value="30"></asp:ListItem>
						<asp:ListItem Value="32"></asp:ListItem>
						<asp:ListItem Value="34"></asp:ListItem>
						<asp:ListItem Value="36"></asp:ListItem>
						<asp:ListItem Value="38"></asp:ListItem>
						<asp:ListItem Value="40"></asp:ListItem>
						<asp:ListItem Value="42"></asp:ListItem>
						<asp:ListItem Value="44"></asp:ListItem>
						<asp:ListItem Value="46"></asp:ListItem>
						<asp:ListItem Value="48"></asp:ListItem>
						<asp:ListItem Value="50"></asp:ListItem>
						<asp:ListItem Value="55"></asp:ListItem>
						<asp:ListItem Value="60"></asp:ListItem>
						<asp:ListItem Value="65"></asp:ListItem>
						<asp:ListItem Value="70"></asp:ListItem>
						<asp:ListItem Value="80"></asp:ListItem>
					</asp:DropDownList><asp:Label ID="Label30" runat="server" resourcekey="px"></asp:Label>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label14" runat="server" resourcekey="thumbHeight"></asp:Label></td>
				<td class="Normal">
					<asp:DropDownList ID="thumbHeight" runat="server" CssClass="Normal">
						<asp:ListItem Value="20"></asp:ListItem>
						<asp:ListItem Value="22"></asp:ListItem>
						<asp:ListItem Value="24"></asp:ListItem>
						<asp:ListItem Value="26"></asp:ListItem>
						<asp:ListItem Value="28"></asp:ListItem>
						<asp:ListItem Value="30"></asp:ListItem>
						<asp:ListItem Value="32"></asp:ListItem>
						<asp:ListItem Value="34"></asp:ListItem>
						<asp:ListItem Value="36"></asp:ListItem>
						<asp:ListItem Value="38"></asp:ListItem>
						<asp:ListItem Value="40"></asp:ListItem>
						<asp:ListItem Value="42"></asp:ListItem>
						<asp:ListItem Value="44"></asp:ListItem>
						<asp:ListItem Value="46"></asp:ListItem>
						<asp:ListItem Value="48"></asp:ListItem>
						<asp:ListItem Value="50"></asp:ListItem>
						<asp:ListItem Value="55"></asp:ListItem>
						<asp:ListItem Value="60"></asp:ListItem>
						<asp:ListItem Value="65"></asp:ListItem>
						<asp:ListItem Value="70"></asp:ListItem>
						<asp:ListItem Value="80"></asp:ListItem>
					</asp:DropDownList><asp:Label ID="Label31" runat="server" resourcekey="px"></asp:Label>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label15" runat="server" resourcekey="speed"></asp:Label></td>
				<td class="Normal">
					<asp:DropDownList ID="speed" runat="server" CssClass="Normal">
						<asp:ListItem Value="2"></asp:ListItem>
						<asp:ListItem Value="3"></asp:ListItem>
						<asp:ListItem Value="4"></asp:ListItem>
						<asp:ListItem Value="5"></asp:ListItem>
						<asp:ListItem Value="6"></asp:ListItem>
						<asp:ListItem Value="7"></asp:ListItem>
						<asp:ListItem Value="8"></asp:ListItem>
						<asp:ListItem Value="9"></asp:ListItem>
						<asp:ListItem Value="10"></asp:ListItem>
					</asp:DropDownList><asp:Label ID="Label32" runat="server" resourcekey="seconds"></asp:Label>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label16" runat="server" resourcekey="thumbRows"></asp:Label></td>
				<td class="Normal">
					<asp:DropDownList ID="thumbRows" runat="server" CssClass="Normal">
						<asp:ListItem Value="1"></asp:ListItem>
						<asp:ListItem Value="2"></asp:ListItem>
						<asp:ListItem Value="3"></asp:ListItem>
						<asp:ListItem Value="4"></asp:ListItem>
						<asp:ListItem Value="5"></asp:ListItem>
					</asp:DropDownList><asp:Label ID="Label33" runat="server" resourcekey="rows"></asp:Label>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label17" runat="server" resourcekey="maxColumns"></asp:Label></td>
				<td class="Normal">
					<asp:DropDownList ID="maxColumns" runat="server" CssClass="Normal">
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
					</asp:DropDownList><asp:Label ID="Label34" runat="server" resourcekey="columns"></asp:Label>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label25" runat="server" resourcekey="logo"></asp:Label></td>
				<td class="Normal">
					<asp:TextBox ID="logo" width="250" runat="server" class="NormalTextBox"></asp:TextBox></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label28" runat="server" resourcekey="noMenu"></asp:Label></td>
				<td class="Normal">
					<asp:CheckBox ID="noMenu" runat="server"></asp:CheckBox></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="SectionHeader"><dnn:sectionhead id="dshBahaviors" runat="server" resourcekey="Bahaviors" section="tblColors" IncludeRule="False" CssClass="SubHead" maximageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle1.gif"
                minimageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle2.gif">
            </dnn:SectionHead></td>
	</tr>
	<tr>
		<td class="UMGMenuBody">
			<table id="tblBahaviors" width="100%" runat="server" class="Normal">
			<tr>
				<td width="200">
					<asp:Label ID="Label18" runat="server" resourcekey="autoPlay"></asp:Label></td>
				<td class="Normal">
					<asp:CheckBox ID="autoPlay" runat="server"></asp:CheckBox></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label19" runat="server" resourcekey="showInformationBox"></asp:Label></td>
				<td class="Normal">
					<asp:CheckBox ID="showInformationBox" runat="server"></asp:CheckBox></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label20" runat="server" resourcekey="autoHideControls"></asp:Label></td>
				<td class="Normal">
					<asp:CheckBox ID="autoHideControls" runat="server"></asp:CheckBox></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label21" runat="server" resourcekey="playInFullScreen"></asp:Label></td>
				<td class="Normal">
					<asp:CheckBox ID="playInFullScreen" runat="server"></asp:CheckBox></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label22" runat="server" resourcekey="useEmbedFonts"></asp:Label></td>
				<td class="Normal">
					<asp:CheckBox ID="useEmbedFonts" runat="server"></asp:CheckBox><asp:Label ID="Label23" runat="server" resourcekey="useEmbedFonts.Help"></asp:Label></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label24" runat="server" resourcekey="showExifInDefault"></asp:Label></td>
				<td class="Normal">
					<asp:CheckBox ID="showExifInDefault" runat="server"></asp:CheckBox></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label27" runat="server" resourcekey="enlargeInDefault"></asp:Label></td>
				<td class="Normal">
					<asp:CheckBox ID="enlargeInDefault" runat="server"></asp:CheckBox></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label26" runat="server" resourcekey="alwaysAllowDownload"></asp:Label></td>
				<td class="Normal">
					<asp:CheckBox ID="alwaysAllowDownload" runat="server"></asp:CheckBox></td>
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
