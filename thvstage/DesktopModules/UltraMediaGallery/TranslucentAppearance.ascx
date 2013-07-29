<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TranslucentAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.TranslucentAppearance" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucColorPicker" Src="ucColorPicker.ascx" %>

<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            Slides & Transitions
        </td>
    </tr>
    <tr>
        <td style="padding:5px;">


            <table width="100%" class="Normal">
                <tr>
                    <td class="header">
                        <dnn:label id="plLayout" runat="server" resourcekey="ResponsiveLayout" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="responsiveLayout" runat="server" checked="False" resourcekey="Yes"></asp:checkbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label4" runat="server" resourcekey="Max_Slides" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboMaxSlides" runat="server" cssclass="NormalTextBox">
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
                                        <asp:ListItem selected="True">20</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                        <asp:ListItem>30</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                <td class="header">
                        <dnn:label id="lblSortOrder" runat="server" resourcekey="SortOrder" Suffix=":"></dnn:label>
                    </td>
                    <td>
                    <asp:dropdownlist id="cboChooseSlides" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem Value="Predefined"></asp:ListItem>
                                        <asp:ListItem Value="Random"></asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                    </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label12" runat="server" resourcekey="PauseTime" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkAutoPlay" runat="server" checked="True" resourcekey="DoAutoPlay"></asp:checkbox>
                        <asp:dropdownlist id="cboPauseTime" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem selected="True">5</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                    </asp:dropdownlist>
                                    <asp:label id="Label14" runat="server" resourcekey="Seconds.Text"></asp:label>
                    </td>
                </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plTransition" runat="server" resourcekey="Transition" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboTransition" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Value="1" Text="Move"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="Fade"></asp:ListItem>
                                                        <asp:ListItem Value="3" Text="Slide In"></asp:ListItem>
                                                        <asp:ListItem Value="4" Text="Slide Out"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="plTransitionSpeed" runat="server" resourcekey="TransitionSpeed" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboTransitionSpeed" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>100</asp:ListItem>
                                        <asp:ListItem>200</asp:ListItem>
                                        <asp:ListItem>300</asp:ListItem>
                                        <asp:ListItem>500</asp:ListItem>
                                        <asp:ListItem>600</asp:ListItem>
                                        <asp:ListItem>700</asp:ListItem>
                                        <asp:ListItem selected="True">800</asp:ListItem>
                                        <asp:ListItem>1000</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
            </table>


        </td>
    </tr>
</table>
</div>

<div class="UMGSection" style="margin-top:5px;">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            Align & Resize
        </td>
    </tr>
    <tr>
        <td style="padding:5px;">


            <table width="100%" class="Normal">
                <tr>
		            <td class="header">
			            <dnn:label id="plImageResize" runat="server" resourcekey="ImageResize" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboImageResize" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Value="fill"></asp:ListItem>
                                                        <asp:ListItem Value="fit"></asp:ListItem>
                                                        <asp:ListItem Value="no"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plAlignCenter" runat="server" resourcekey="AlignCenter" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:CheckBox ID="chkAlignCenter" runat="server" resourcekey="Yes" CssClass="NormalTextBox">
                                                   </asp:CheckBox>
		            </td>
	            </tr>
            </table>


        </td>
    </tr>
</table>
</div>

<div class="UMGSection" style="margin-top:5px;">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            Buttons Appearance
        </td>
    </tr>
    <tr>
        <td style="padding:5px;">


            <table width="100%" class="Normal">
                <tr>
		            <td class="header">
			            <dnn:label id="plButtonSize" runat="server" resourcekey="ButtonSize" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboButtonSize" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Value="12"></asp:ListItem>
                                                        <asp:ListItem Value="14"></asp:ListItem>
                                                        <asp:ListItem Value="16"></asp:ListItem>
                                                        <asp:ListItem Value="18"></asp:ListItem>
                                                        <asp:ListItem Value="20" selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="22"></asp:ListItem>
                                                        <asp:ListItem Value="24"></asp:ListItem>
                                                        <asp:ListItem Value="26"></asp:ListItem>
                                                        <asp:ListItem Value="28"></asp:ListItem>
                                                        <asp:ListItem Value="30"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plButtonColor" runat="server" resourcekey="ButtonColor" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <uc1:uccolorpicker id="clrButtonColor" runat="server" Color="">
                        </uc1:uccolorpicker>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plMargin" runat="server" resourcekey="Margin" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboButtonMargin" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Value="0"></asp:ListItem>
                                                        <asp:ListItem Value="2"></asp:ListItem>
                                                        <asp:ListItem Value="4" selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="6"></asp:ListItem>
                                                        <asp:ListItem Value="8"></asp:ListItem>
                                                        <asp:ListItem Value="10"></asp:ListItem>
                                                        <asp:ListItem Value="12"></asp:ListItem>
                                                        <asp:ListItem Value="14"></asp:ListItem>
                                                        <asp:ListItem Value="16"></asp:ListItem>
                                                        <asp:ListItem Value="18"></asp:ListItem>
                                                        <asp:ListItem Value="20"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plSpace" runat="server" resourcekey="Space" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboButtonSpace" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Value="0"></asp:ListItem>
                                                        <asp:ListItem Value="2" selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="4"></asp:ListItem>
                                                        <asp:ListItem Value="6"></asp:ListItem>
                                                        <asp:ListItem Value="8"></asp:ListItem>
                                                        <asp:ListItem Value="10"></asp:ListItem>
                                                        <asp:ListItem Value="12"></asp:ListItem>
                                                        <asp:ListItem Value="14"></asp:ListItem>
                                                        <asp:ListItem Value="16"></asp:ListItem>
                                                        <asp:ListItem Value="18"></asp:ListItem>
                                                        <asp:ListItem Value="20"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plOpacity" runat="server" resourcekey="Opacity" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboButtonOpacity" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Value="0.1"></asp:ListItem>
                                                        <asp:ListItem Value="0.2"></asp:ListItem>
                                                        <asp:ListItem Value="0.3"></asp:ListItem>
                                                        <asp:ListItem Value="0.4"></asp:ListItem>
                                                        <asp:ListItem Value="0.5"></asp:ListItem>
                                                        <asp:ListItem Value="0.6"></asp:ListItem>
                                                        <asp:ListItem Value="0.7" selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="0.8"></asp:ListItem>
                                                        <asp:ListItem Value="0.9"></asp:ListItem>
                                                        <asp:ListItem Value="1"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plVisibility" runat="server" resourcekey="Visibility" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:CheckBox ID="chkNext" runat="server" resourcekey="NextButton" CssClass="NormalTextBox">
                                                   </asp:CheckBox>
                        <asp:CheckBox ID="chkBack" runat="server" resourcekey="BackButton" CssClass="NormalTextBox">
                                                   </asp:CheckBox>
                        <asp:CheckBox ID="chkTimer" runat="server" resourcekey="Timer" CssClass="NormalTextBox">
                                                   </asp:CheckBox>
                        <asp:CheckBox ID="chkNumbers" runat="server" resourcekey="Numbers" CssClass="NormalTextBox">
                                                   </asp:CheckBox>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plNumbers" runat="server" resourcekey="Numbers" Suffix=":"></dnn:label></td>
		            <td class="Normal">
                        <asp:CheckBox ID="chkNumbersAutoHide" runat="server" resourcekey="NumbersAutoHide" CssClass="NormalTextBox">
                                                   </asp:CheckBox>
                        <asp:CheckBox ID="chkNumbersHorizontal" runat="server" resourcekey="NumbersHorizontal" CssClass="NormalTextBox">
                                                   </asp:CheckBox>
		            </td>
	            </tr>
            </table>


        </td>
    </tr>
</table>
</div>

<div class="UMGSection" style="margin-top:5px;">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            Caption Area
        </td>
    </tr>
    <tr>
        <td style="padding:5px;">


            <table width="100%" class="Normal">
                <tr>
		            <td class="header">
			            <dnn:label id="plFloatMode" runat="server" resourcekey="FloatMode" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:CheckBox ID="chkFloatMode" runat="server" resourcekey="Yes" CssClass="NormalTextBox">
                                                   </asp:CheckBox>
                                                   
                        <asp:label id="plWidth" runat="server" resourcekey="Width"></asp:label>
                        <asp:TextBox ID="txtCaptionWidth" runat="server" Width="30px" CssClass="NormalTextBox">
                                                   </asp:TextBox>
                        <asp:label id="plHeight" runat="server" resourcekey="Height"></asp:label>
                        <asp:TextBox ID="txtCaptionHeight" runat="server" Width="30px" CssClass="NormalTextBox">
                                                   </asp:TextBox>
                                                   
                        <asp:label id="plPosition" runat="server" resourcekey="Position"></asp:label>
                        <asp:TextBox ID="txtCaptionPositionX" runat="server" Width="30px" CssClass="NormalTextBox">
                                                   </asp:TextBox>,
                        <asp:TextBox ID="txtCaptionPositionY" runat="server" Width="30px" CssClass="NormalTextBox">
                                                   </asp:TextBox>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plAllowSelection" runat="server" resourcekey="AllowSelection" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:CheckBox ID="chkAllowSelection" runat="server" resourcekey="Yes" CssClass="NormalTextBox">
                                                   </asp:CheckBox>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plBlur" runat="server" resourcekey="Blur" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboBlur" runat="server" CssClass="NormalTextBox">
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
                                                        <asp:ListItem Value="11"></asp:ListItem>
                                                        <asp:ListItem Value="12" selected="True"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plCaptionMargin" runat="server" resourcekey="CaptionMargin" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboCaptionMargin" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Value="0" selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="2"></asp:ListItem>
                                                        <asp:ListItem Value="4"></asp:ListItem>
                                                        <asp:ListItem Value="6"></asp:ListItem>
                                                        <asp:ListItem Value="8"></asp:ListItem>
                                                        <asp:ListItem Value="10"></asp:ListItem>
                                                        <asp:ListItem Value="12"></asp:ListItem>
                                                        <asp:ListItem Value="14"></asp:ListItem>
                                                        <asp:ListItem Value="16"></asp:ListItem>
                                                        <asp:ListItem Value="18"></asp:ListItem>
                                                        <asp:ListItem Value="20"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plPadding" runat="server" resourcekey="Padding" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboCaptionPadding" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Value="0"></asp:ListItem>
                                                        <asp:ListItem Value="2"></asp:ListItem>
                                                        <asp:ListItem Value="4"></asp:ListItem>
                                                        <asp:ListItem Value="6"></asp:ListItem>
                                                        <asp:ListItem Value="8"></asp:ListItem>
                                                        <asp:ListItem Value="10"></asp:ListItem>
                                                        <asp:ListItem Value="12" selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="14"></asp:ListItem>
                                                        <asp:ListItem Value="16"></asp:ListItem>
                                                        <asp:ListItem Value="18"></asp:ListItem>
                                                        <asp:ListItem Value="20"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plCaptionBgColor" runat="server" resourcekey="CaptionBgColor" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <uc1:uccolorpicker id="clrCaptionBgColor" runat="server" Color="">
                        </uc1:uccolorpicker>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plCaptionOpacity" runat="server" resourcekey="CaptionBgOpacity" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboCaptionBgOpacity" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Value="0.0"></asp:ListItem>
                                                        <asp:ListItem Value="0.1" selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="0.2"></asp:ListItem>
                                                        <asp:ListItem Value="0.3"></asp:ListItem>
                                                        <asp:ListItem Value="0.4"></asp:ListItem>
                                                        <asp:ListItem Value="0.5"></asp:ListItem>
                                                        <asp:ListItem Value="0.6"></asp:ListItem>
                                                        <asp:ListItem Value="0.7"></asp:ListItem>
                                                        <asp:ListItem Value="0.8"></asp:ListItem>
                                                        <asp:ListItem Value="0.9"></asp:ListItem>
                                                        <asp:ListItem Value="1"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plRadius" runat="server" resourcekey="Radius" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboRadius" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Value="0"></asp:ListItem>
                                                        <asp:ListItem Value="1"></asp:ListItem>
                                                        <asp:ListItem Value="2"></asp:ListItem>
                                                        <asp:ListItem Value="3"></asp:ListItem>
                                                        <asp:ListItem Value="4"></asp:ListItem>
                                                        <asp:ListItem Value="5"></asp:ListItem>
                                                        <asp:ListItem Value="6" selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="7"></asp:ListItem>
                                                        <asp:ListItem Value="8"></asp:ListItem>
                                                        <asp:ListItem Value="9"></asp:ListItem>
                                                        <asp:ListItem Value="10"></asp:ListItem>
                                                        <asp:ListItem Value="11"></asp:ListItem>
                                                        <asp:ListItem Value="12"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plShadow" runat="server" resourcekey="Shadow" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboShadow" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Value="0.0"></asp:ListItem>
                                                        <asp:ListItem Value="0.1"></asp:ListItem>
                                                        <asp:ListItem Value="0.2"></asp:ListItem>
                                                        <asp:ListItem Value="0.3" selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="0.4"></asp:ListItem>
                                                        <asp:ListItem Value="0.5"></asp:ListItem>
                                                        <asp:ListItem Value="0.6"></asp:ListItem>
                                                        <asp:ListItem Value="0.7"></asp:ListItem>
                                                        <asp:ListItem Value="0.8"></asp:ListItem>
                                                        <asp:ListItem Value="0.9"></asp:ListItem>
                                                        <asp:ListItem Value="1"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plBorder" runat="server" resourcekey="Border" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboBorder" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Value="0" Text="0px"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="1px" selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="2px"></asp:ListItem>
                                                        <asp:ListItem Value="3" Text="3px"></asp:ListItem>
                                                        <asp:ListItem Value="4" Text="4px"></asp:ListItem>
                                                        <asp:ListItem Value="5" Text="5px"></asp:ListItem>
                                                    </asp:DropDownList>
                        <asp:label id="plColor" runat="server" resourcekey="Color"></asp:label>
                        <uc1:uccolorpicker id="clrBorderColor" runat="server" Color="FFFFFF">
                        </uc1:uccolorpicker>
                        <asp:label id="plBorderOpacity" runat="server" resourcekey="BorderOpacity"></asp:label>
		                <asp:DropDownList ID="cboBorderOpacity" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Value="0.0"></asp:ListItem>
                                                        <asp:ListItem Value="0.1"></asp:ListItem>
                                                        <asp:ListItem Value="0.2" selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="0.3"></asp:ListItem>
                                                        <asp:ListItem Value="0.4"></asp:ListItem>
                                                        <asp:ListItem Value="0.5"></asp:ListItem>
                                                        <asp:ListItem Value="0.6"></asp:ListItem>
                                                        <asp:ListItem Value="0.7"></asp:ListItem>
                                                        <asp:ListItem Value="0.8"></asp:ListItem>
                                                        <asp:ListItem Value="0.9"></asp:ListItem>
                                                        <asp:ListItem Value="1"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
            </table>


        </td>
    </tr>
</table>
</div>

<div class="UMGSection" style="margin-top:5px;">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            Individual slide settings
        </td>
    </tr>
    <tr>
        <td style="padding:5px;">


            <table width="100%" class="Normal">
                <tr>
		            <td class="header">
			            <dnn:label id="plIndividualSettings" runat="server" resourcekey="IndividualSettings" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:TextBox ID="txtIndividualSettings" runat="server" Width="400px" TextMode="multiline" Rows="4" CssClass="NormalTextBox">
                                                   </asp:TextBox>
		            </td>
	            </tr>
            </table>


        </td>
    </tr>
</table>
</div>

<p style="text-align:center;">
    <asp:Button ID="btnSave" runat="server" resourcekey="cmdUpdate" CssClass="CommandButton" />
    <asp:Button ID="btnCancel" runat="server" resourcekey="cmdCancel" CssClass="CommandButton" />
</p>

<script type="text/javascript">
jQuery(document).ready(function(){
    var chkAutoPlay = jQuery("#<%=chkAutoPlay.ClientID %>");
    chkAutoPlay.change(function(){
        jQuery("#<%=cboPauseTime.ClientID %>").attr("disabled", !this.checked);
    });
    
    chkAutoPlay.change();    

    var chkNumbers = jQuery("#<%=chkNumbers.ClientID %>");
    chkNumbers.change(function(){
        jQuery("#<%=chkNumbersAutoHide.ClientID %>").attr("disabled", !this.checked);
        jQuery("#<%=chkNumbersHorizontal.ClientID %>").attr("disabled", !this.checked);
    });
    
    chkNumbers.change();    

    var chkFloatMode = jQuery("#<%=chkFloatMode.ClientID %>");
    chkFloatMode.change(function(){
        jQuery("#<%=txtCaptionWidth.ClientID %>").attr("disabled", !this.checked);
        jQuery("#<%=txtCaptionPositionX.ClientID %>").attr("disabled", !this.checked);
        jQuery("#<%=txtCaptionPositionY.ClientID %>").attr("disabled", !this.checked);
    });
    
    chkFloatMode.change();    
});
</script>