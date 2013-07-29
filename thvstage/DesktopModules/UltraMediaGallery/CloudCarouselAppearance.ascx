<%@ Control Language="vb" AutoEventWireup="false" Codebehind="CloudCarouselAppearance.ascx.vb" Inherits="BizModules.UltraPhotoGallery.Presentation.CloudCarouselAppearance" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucColorPicker" Src="ucColorPicker.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<table id="tblAppearance" width="100%" runat="server" class="Normal">
	<tr>
		<td class="header">
			<asp:label id="plbackground" runat="server" resourcekey="background"></asp:label></td>
		<td class="Normal">
			<asp:checkbox id="chkbackground" runat="server" resourcekey="background.Help"></asp:checkbox></td>
	</tr>
	<tr>
		<td class="header">
			<asp:label id="plmouseWheel" runat="server" resourcekey="mouseWheel"></asp:label></td>
		<td class="Normal">
			<asp:checkbox id="chkmouseWheel" runat="server" resourcekey="mouseWheel.Help"></asp:checkbox></td>
	</tr>
	<tr>
		<td class="header">
			<asp:label id="plbringToFront" runat="server" resourcekey="bringToFront"></asp:label></td>
		<td class="Normal">
			<asp:checkbox id="chkbringToFront" runat="server" resourcekey="bringToFront.Help"></asp:checkbox></td>
	</tr>
	<tr>
		<td class="header">
			<dnn:label id="plclickEvent" runat="server" resourcekey="clickEvent"></dnn:label></td>
		<td class="Normal">
		    <asp:DropDownList ID="clickEvent" runat="server" CssClass="NormalTextBox">
                                            <asp:ListItem Text="nothing"></asp:ListItem>
                                            <asp:ListItem Text="lightbox" selected="True"></asp:ListItem>
                                            <asp:ListItem Text="rawfile"></asp:ListItem>
                                            <asp:ListItem Text="link"></asp:ListItem>
                                        </asp:DropDownList>
		</td>
	</tr>

	<tr>
		<td class="header">
			<dnn:label id="plminScale" runat="server" resourcekey="minScale"></dnn:label></td>
		<td class="Normal">
		    <asp:DropDownList ID="minScale" runat="server" CssClass="NormalTextBox">
                                            <asp:ListItem Text="0.25"></asp:ListItem>
                                            <asp:ListItem Text="0.30"></asp:ListItem>
                                            <asp:ListItem Text="0.35"></asp:ListItem>
                                            <asp:ListItem Text="0.40"></asp:ListItem>
                                            <asp:ListItem Text="0.45"></asp:ListItem>
                                            <asp:ListItem Text="0.50" selected="True"></asp:ListItem>
                                            <asp:ListItem Text="0.55"></asp:ListItem>
                                            <asp:ListItem Text="0.60"></asp:ListItem>
                                            <asp:ListItem Text="0.65"></asp:ListItem>
                                            <asp:ListItem Text="0.70"></asp:ListItem>
                                            <asp:ListItem Text="0.75"></asp:ListItem>
                                            <asp:ListItem Text="0.80"></asp:ListItem>
                                            <asp:ListItem Text="0.85"></asp:ListItem>
                                            <asp:ListItem Text="0.90"></asp:ListItem>
                                            <asp:ListItem Text="0.95"></asp:ListItem>
                                            <asp:ListItem Text="1"></asp:ListItem>
                                        </asp:DropDownList>	
		</td>
	</tr>
	<tr>
		<td class="header">
			<dnn:label id="plreflHeight" runat="server" resourcekey="reflHeight"></dnn:label></td>
		<td class="Normal">
		    <asp:DropDownList ID="reflHeight" runat="server" CssClass="NormalTextBox">
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
                                            <asp:ListItem Text="50" selected="True"></asp:ListItem>
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
                                        </asp:DropDownList>
		</td>
	</tr>
	<tr>
		<td class="header">
			<dnn:label id="plreflGap" runat="server" resourcekey="reflGap"></dnn:label></td>
		<td class="Normal">
		    <asp:DropDownList ID="reflGap" runat="server" CssClass="NormalTextBox">
                                            <asp:ListItem Text="0"></asp:ListItem>
                                            <asp:ListItem Text="1"></asp:ListItem>
                                            <asp:ListItem Text="2" selected="True"></asp:ListItem>
                                            <asp:ListItem Text="3"></asp:ListItem>
                                            <asp:ListItem Text="4"></asp:ListItem>
                                            <asp:ListItem Text="5"></asp:ListItem>
                                        </asp:DropDownList>
		</td>
	</tr>
	<tr>
		<td class="header">
			<dnn:label id="plreflOpacity" runat="server" resourcekey="reflOpacity"></dnn:label></td>
		<td class="Normal">
		    <asp:DropDownList ID="reflOpacity" runat="server" CssClass="NormalTextBox">
                                            <asp:ListItem Text="0"></asp:ListItem>
                                            <asp:ListItem Text="0.1"></asp:ListItem>
                                            <asp:ListItem Text="0.2"></asp:ListItem>
                                            <asp:ListItem Text="0.3"></asp:ListItem>
                                            <asp:ListItem Text="0.4"></asp:ListItem>
                                            <asp:ListItem Text="0.5" selected="True"></asp:ListItem>
                                            <asp:ListItem Text="0.6"></asp:ListItem>
                                            <asp:ListItem Text="0.7"></asp:ListItem>
                                            <asp:ListItem Text="0.8"></asp:ListItem>
                                            <asp:ListItem Text="0.9"></asp:ListItem>
                                            <asp:ListItem Text="1"></asp:ListItem>
                                        </asp:DropDownList>
		</td>
	</tr>
	<tr>
		<td class="header">
			<dnn:label id="plxPos" runat="server" resourcekey="xPos"></dnn:label></td>
		<td class="Normal">
		    <asp:TextBox ID="xPos" runat="server" CssClass="NormalTextBox" width="50px">
                                        </asp:TextBox>
            <asp:label id="plxPosDefault" runat="server" resourcekey="xPosDefault"></asp:label>
		</td>
	</tr>
	<tr>
		<td class="header">
			<dnn:label id="plyPos" runat="server" resourcekey="yPos"></dnn:label></td>
		<td class="Normal">
		    <asp:TextBox ID="yPos" runat="server" CssClass="NormalTextBox" width="50px">
                                        </asp:TextBox>
            <asp:label id="plyPosDefault" runat="server" resourcekey="yPosDefault"></asp:label>
		</td>
	</tr>
	<tr>
		<td class="header">
			<dnn:label id="plxRadius" runat="server" resourcekey="xRadius"></dnn:label></td>
		<td class="Normal">
		    <asp:TextBox ID="xRadius" runat="server" CssClass="NormalTextBox" width="50px">
                                        </asp:TextBox>
            <asp:label id="plxRadiusDefault" runat="server" resourcekey="xRadiusDefault"></asp:label>
		</td>
	</tr>
	<tr>
		<td class="header">
			<dnn:label id="plyRadius" runat="server" resourcekey="yRadius"></dnn:label></td>
		<td class="Normal">
		    <asp:TextBox ID="yRadius" runat="server" CssClass="NormalTextBox" width="50px">
                                        </asp:TextBox>
            <asp:label id="plyRadiusDefault" runat="server" resourcekey="yRadiusDefault"></asp:label>
		</td>
	</tr>
	<tr>
		<td class="header">
			<dnn:label id="plspeed" runat="server" resourcekey="speed"></dnn:label></td>
		<td class="Normal">
		    <asp:DropDownList ID="speed" runat="server" CssClass="NormalTextBox">
                                            <asp:ListItem Text="0.1"></asp:ListItem>
                                            <asp:ListItem Text="0.15"></asp:ListItem>
                                            <asp:ListItem Text="0.2"></asp:ListItem>
                                            <asp:ListItem Text="0.25"></asp:ListItem>
                                            <asp:ListItem Text="0.3"></asp:ListItem>
                                        </asp:DropDownList>
		</td>
	</tr>
	<tr>
		<td class="header">
			<dnn:label id="plautoRotate" runat="server" resourcekey="autoRotate"></dnn:label></td>
		<td class="Normal">
		    <asp:DropDownList ID="autoRotate" runat="server" CssClass="NormalTextBox">
                                            <asp:ListItem Text="no"></asp:ListItem>
                                            <asp:ListItem Text="left"></asp:ListItem>
                                            <asp:ListItem Text="right"></asp:ListItem>
                                        </asp:DropDownList>
		</td>
	</tr>
	<tr>
		<td class="header">
			<dnn:label id="plautoRotateDelay" runat="server" resourcekey="autoRotateDelay"></dnn:label></td>
		<td class="Normal">
		    <asp:DropDownList ID="autoRotateDelay" runat="server" CssClass="NormalTextBox">
                                            <asp:ListItem Text="1000"></asp:ListItem>
                                            <asp:ListItem Text="1500"></asp:ListItem>
                                            <asp:ListItem Text="2000"></asp:ListItem>
                                            <asp:ListItem Text="2500"></asp:ListItem>
                                            <asp:ListItem Text="3000"></asp:ListItem>
                                            <asp:ListItem Text="3500"></asp:ListItem>
                                            <asp:ListItem Text="4000"></asp:ListItem>
                                            <asp:ListItem Text="4500"></asp:ListItem>
                                            <asp:ListItem Text="5000"></asp:ListItem>
                                        </asp:DropDownList>
		</td>
	</tr>
</table>
<p align="center">
	<asp:linkbutton class="CommandButton" id="cmdUpdate" runat="server" resourcekey="cmdUpdate" text=""
		borderstyle="none"></asp:linkbutton>&nbsp;
	<asp:linkbutton class="CommandButton" id="cmdCancel" runat="server" resourcekey="cmdCancel" text=""
		borderstyle="none" causesvalidation="False"></asp:linkbutton>
</p>
