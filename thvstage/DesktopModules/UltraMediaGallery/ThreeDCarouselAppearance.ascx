<%@ Control Language="vb" AutoEventWireup="false" Codebehind="ThreeDCarouselAppearance.ascx.vb" Inherits="BizModules.UltraPhotoGallery.Presentation.ThreeDCarouselAppearance" %>
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
				<td><asp:label id="plcaptionBackgroundColor" runat="server" resourcekey="captionBackgroundColor"></asp:label></td>
				<td class="Normal"><uc1:uccolorpicker id="captionBackgroundColor" runat="server"></uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td><asp:label id="pltextColor" runat="server" resourcekey="textColor"></asp:label></td>
				<td class="Normal"><uc1:uccolorpicker id="textColor" runat="server"></uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td><asp:label id="plcaptionTextColor" runat="server" resourcekey="captionTextColor"></asp:label></td>
				<td class="Normal"><uc1:uccolorpicker id="captionTextColor" runat="server"></uc1:uccolorpicker></td>
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
			        <asp:label id="plmargin" runat="server" resourcekey="margin"></asp:label></td>
		        <td class="Normal">
		        <asp:DropDownList ID="margin" runat="server" CssClass="NormalTextBox">
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
                                        </asp:DropDownList>px</td>
	        </tr>
	        <tr>
		        <td>
			        <asp:label id="plellipseAspectRatio" runat="server" resourcekey="ellipseAspectRatio"></asp:label></td>
		        <td class="Normal">
		        <asp:DropDownList ID="ellipseAspectRatio" runat="server" CssClass="NormalTextBox">
                                            <asp:ListItem Text="0"></asp:ListItem>
                                            <asp:ListItem Text="0.05"></asp:ListItem>
                                            <asp:ListItem Text="0.1"></asp:ListItem>
                                            <asp:ListItem Text="0.15"></asp:ListItem>
                                            <asp:ListItem Text="0.20"></asp:ListItem>
                                            <asp:ListItem Text="0.25"></asp:ListItem>
                                            <asp:ListItem Text="0.30"></asp:ListItem>
                                            <asp:ListItem Text="0.35"></asp:ListItem>
                                            <asp:ListItem Text="0.40"></asp:ListItem>
                                            <asp:ListItem Text="0.45"></asp:ListItem>
                                            <asp:ListItem Text="0.50"></asp:ListItem>
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
		        <td>
			        <asp:label id="plperspective" runat="server" resourcekey="perspective"></asp:label></td>
		        <td class="Normal">
		        <asp:DropDownList ID="perspective" runat="server" CssClass="NormalTextBox">
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
                                            <asp:ListItem Text="110"></asp:ListItem>
                                            <asp:ListItem Text="115"></asp:ListItem>
                                            <asp:ListItem Text="110"></asp:ListItem>
                                            <asp:ListItem Text="115"></asp:ListItem>
                                            <asp:ListItem Text="120"></asp:ListItem>
                                            <asp:ListItem Text="125"></asp:ListItem>
                                            <asp:ListItem Text="130"></asp:ListItem>
                                            <asp:ListItem Text="135"></asp:ListItem>
                                            <asp:ListItem Text="140"></asp:ListItem>
                                            <asp:ListItem Text="145"></asp:ListItem>
                                            <asp:ListItem Text="150"></asp:ListItem>
                                            <asp:ListItem Text="155"></asp:ListItem>
                                            <asp:ListItem Text="160"></asp:ListItem>
                                            <asp:ListItem Text="165"></asp:ListItem>
                                            <asp:ListItem Text="170"></asp:ListItem>
                                            <asp:ListItem Text="175"></asp:ListItem>
                                            <asp:ListItem Text="180"></asp:ListItem>
                                            <asp:ListItem Text="185"></asp:ListItem>
                                            <asp:ListItem Text="190"></asp:ListItem>
                                            <asp:ListItem Text="195"></asp:ListItem>
                                            <asp:ListItem Text="200"></asp:ListItem>
                                        </asp:DropDownList></td>
	        </tr>
	        <tr>
		        <td>
			        <asp:label id="plyOffset" runat="server" resourcekey="yOffset"></asp:label></td>
		        <td class="Normal">
		        <asp:DropDownList ID="yOffset" runat="server" CssClass="NormalTextBox">
                                            <asp:ListItem Text="0"></asp:ListItem>
                                            <asp:ListItem Text="10"></asp:ListItem>
                                            <asp:ListItem Text="20"></asp:ListItem>
                                            <asp:ListItem Text="30"></asp:ListItem>
                                            <asp:ListItem Text="40"></asp:ListItem>
                                            <asp:ListItem Text="50"></asp:ListItem>
                                            <asp:ListItem Text="60"></asp:ListItem>
                                            <asp:ListItem Text="70"></asp:ListItem>
                                            <asp:ListItem Text="80"></asp:ListItem>
                                            <asp:ListItem Text="90"></asp:ListItem>
                                            <asp:ListItem Text="100"></asp:ListItem>
                                            <asp:ListItem Text="110"></asp:ListItem>
                                            <asp:ListItem Text="110"></asp:ListItem>
                                            <asp:ListItem Text="120"></asp:ListItem>
                                            <asp:ListItem Text="130"></asp:ListItem>
                                            <asp:ListItem Text="140"></asp:ListItem>
                                            <asp:ListItem Text="150"></asp:ListItem>
                                            <asp:ListItem Text="160"></asp:ListItem>
                                            <asp:ListItem Text="170"></asp:ListItem>
                                            <asp:ListItem Text="180"></asp:ListItem>
                                            <asp:ListItem Text="190"></asp:ListItem>
                                            <asp:ListItem Text="200"></asp:ListItem>
                                            <asp:ListItem Text="200"></asp:ListItem>
                                            <asp:ListItem Text="210"></asp:ListItem>
                                            <asp:ListItem Text="210"></asp:ListItem>
                                            <asp:ListItem Text="220"></asp:ListItem>
                                            <asp:ListItem Text="230"></asp:ListItem>
                                            <asp:ListItem Text="240"></asp:ListItem>
                                            <asp:ListItem Text="250"></asp:ListItem>
                                            <asp:ListItem Text="260"></asp:ListItem>
                                            <asp:ListItem Text="270"></asp:ListItem>
                                            <asp:ListItem Text="280"></asp:ListItem>
                                            <asp:ListItem Text="290"></asp:ListItem>
                                            <asp:ListItem Text="300"></asp:ListItem>
                                            <asp:ListItem Text="300"></asp:ListItem>
                                            <asp:ListItem Text="310"></asp:ListItem>
                                            <asp:ListItem Text="310"></asp:ListItem>
                                            <asp:ListItem Text="320"></asp:ListItem>
                                            <asp:ListItem Text="330"></asp:ListItem>
                                            <asp:ListItem Text="340"></asp:ListItem>
                                            <asp:ListItem Text="350"></asp:ListItem>
                                            <asp:ListItem Text="360"></asp:ListItem>
                                            <asp:ListItem Text="370"></asp:ListItem>
                                            <asp:ListItem Text="380"></asp:ListItem>
                                            <asp:ListItem Text="390"></asp:ListItem>
                                            <asp:ListItem Text="400"></asp:ListItem>
                                        </asp:DropDownList>px</td>
	        </tr>
	        <tr>
		        <td>
			        <asp:label id="plbackground" runat="server" resourcekey="background"></asp:label></td>
		        <td class="Normal">
			        <INPUT id="fileBackground" style="WIDTH: 300px" type="file" size="36" name="File2" runat="server">
			        <BR>
			        <asp:label id="lblbackground" runat="server"></asp:label>&nbsp;
			        <asp:linkbutton id="cmdRemoveBackground" runat="server" CausesValidation="False" resourcekey="Remove"></asp:linkbutton>
		        </td>
	        </tr>
	        <tr>
		        <td valign="top">
			        <asp:label id="pllogo" runat="server" resourcekey="logo"></asp:label></td>
		        <td class="Normal">
			        <INPUT id="fileLogo" style="WIDTH: 300px" type="file" size="36" name="File2" runat="server">
			        <br>
			        <asp:image id="imgLogo" runat="server"></asp:image>&nbsp;
			        <asp:linkbutton id="cmdRemoveLogo" runat="server" CausesValidation="False" resourcekey="Remove"></asp:linkbutton>
			        <br>
			        <asp:label id="Label1" runat="server" resourcekey="position"></asp:label>, x:
			        <asp:textbox id="logoPosition_X" runat="server" Width="40px" CssClass="NormalTextBox"></asp:textbox>
			        <asp:regularexpressionvalidator id="rev7" runat="server" ControlToValidate="logoPosition_X"
				        ValidationExpression="\d*" ErrorMessage="*"></asp:regularexpressionvalidator>
				         &nbsp; y:
			        <asp:textbox id="logoPosition_Y" runat="server" Width="40px" CssClass="NormalTextBox"></asp:textbox>
			        <asp:regularexpressionvalidator id="Regularexpressionvalidator8" runat="server" ControlToValidate="logoPosition_Y"
				        ValidationExpression="\d*" ErrorMessage="*"></asp:regularexpressionvalidator>
				        ,
                    <asp:label id="Label2" runat="server" resourcekey="linkUrl"></asp:label>:<asp:textbox id="logoLink" runat="server" Width="200px" CssClass="NormalTextBox"></asp:textbox>
		        </td>
	        </tr>
	        <tr>
		        <td>
		        <asp:label id="Label3" runat="server" resourcekey="Speed"></asp:label>
			        </td>
		        <td class="Normal">
		        <asp:label id="Label4" runat="server" resourcekey="default"></asp:label>:
		        <asp:dropdownlist id="defaultSpeed" runat="server" CssClass="NormalTextBox">
							        <asp:ListItem Value="0"></asp:ListItem>
							        <asp:ListItem Value="0.01"></asp:ListItem>
							        <asp:ListItem Value="0.02"></asp:ListItem>
							        <asp:ListItem Value="0.03"></asp:ListItem>
							        <asp:ListItem Value="0.04"></asp:ListItem>
							        <asp:ListItem Value="0.05"></asp:ListItem>
							        <asp:ListItem Value="0.06"></asp:ListItem>
							        <asp:ListItem Value="0.07"></asp:ListItem>
							        <asp:ListItem Value="0.08"></asp:ListItem>
							        <asp:ListItem Value="0.09"></asp:ListItem>
							        <asp:ListItem Value="0.1"></asp:ListItem>
						        </asp:dropdownlist>
		         &nbsp; 
		         <asp:label id="Label5" runat="server" resourcekey="max"></asp:label>
		         <asp:dropdownlist id="maxSpeed" runat="server" CssClass="NormalTextBox">
							        <asp:ListItem Value="0"></asp:ListItem>
							        <asp:ListItem Value="0.01"></asp:ListItem>
							        <asp:ListItem Value="0.02"></asp:ListItem>
							        <asp:ListItem Value="0.03"></asp:ListItem>
							        <asp:ListItem Value="0.04"></asp:ListItem>
							        <asp:ListItem Value="0.05"></asp:ListItem>
							        <asp:ListItem Value="0.06"></asp:ListItem>
							        <asp:ListItem Value="0.07"></asp:ListItem>
							        <asp:ListItem Value="0.08"></asp:ListItem>
							        <asp:ListItem Value="0.09"></asp:ListItem>
							        <asp:ListItem Value="0.1"></asp:ListItem>
						        </asp:dropdownlist>
			        </td>
	        </tr>
	        <tr>
		        <td>
			        </td>
		        <td class="Normal">
			        <asp:checkbox id="manuallyNav" runat="server" resourcekey="showNavigationButtons"></asp:checkbox></td>
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
						<asp:label id="plOnClick" runat="server" resourcekey="OnClick"></asp:label></td>
					<td class="Normal">
						<asp:dropdownlist id="onClick" runat="server" CssClass="NormalTextBox">
							<asp:ListItem Value="Open"></asp:ListItem>
							<asp:ListItem Value="Link"></asp:ListItem>
							<asp:ListItem Value="LinkInCurrent"></asp:ListItem>
							<asp:ListItem Value="Lightbox"></asp:ListItem>
							<asp:ListItem Value="Nothing"></asp:ListItem>
						</asp:dropdownlist></td>
				</tr>
	            <tr>
		            <td></td>
		            <td class="Normal">
			            <asp:checkbox id="clickToStop" runat="server" resourcekey="clickToStop"></asp:checkbox></td>
	            </tr>
	            <tr>
		            <td></td>
		            <td class="Normal">
			            <asp:checkbox id="mute" runat="server" resourcekey="mute"></asp:checkbox></td>
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
