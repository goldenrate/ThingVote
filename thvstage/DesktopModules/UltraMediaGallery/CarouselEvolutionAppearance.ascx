<%@ Control Language="vb" AutoEventWireup="false" Codebehind="CarouselEvolutionAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.CarouselEvolutionAppearance" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucColorPicker" Src="ucColorPicker.ascx" %>
<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            <%=PreferedPresentation(UserId).Name %>
        </td>
    </tr>
    <tr>
        <td style="padding:5px;">


            <table width="100%" class="Normal">
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
			            <dnn:label id="plTextDescription" runat="server" resourcekey="TextDescription"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboTextDescription" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Text="none"></asp:ListItem>
                                                        <asp:ListItem Text="floated" selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="separated"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plCarouselDirection" runat="server" resourcekey="CarouselDirection"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboCarouselDirection" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Text="center-center" selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="center-top"></asp:ListItem>
                                                        <asp:ListItem Text="center-bottom"></asp:ListItem>
                                                        <asp:ListItem Text="left-center"></asp:ListItem>
                                                        <asp:ListItem Text="left-top"></asp:ListItem>
                                                        <asp:ListItem Text="left-bottom"></asp:ListItem>
                                                        <asp:ListItem Text="right-center"></asp:ListItem>
                                                        <asp:ListItem Text="right-top"></asp:ListItem>
                                                        <asp:ListItem Text="right-bottom"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plPosition" runat="server" resourcekey="Position"></dnn:label></td>
		            <td class="Normal">
		                <asp:label id="plTop" runat="server" resourcekey="Top"></asp:label>
		                <asp:textbox id="txtTop" runat="server" width="50px"></asp:textbox>
		                
		                <span id="spanLeft">
                        <asp:label id="plLeft" runat="server" resourcekey="Left"></asp:label>
		                <asp:textbox id="txtLeft" runat="server" width="50px"></asp:textbox>
		                </span>
		                
		                <span id="spanRight">
		                <asp:label id="plRight" runat="server" resourcekey="Right"></asp:label>
		                <asp:textbox id="txtRight" runat="server" width="50px"></asp:textbox>
		                </span>
		                
		                <span id="spanBottom">
                        <asp:label id="plBottom" runat="server" resourcekey="Bottom"></asp:label>
		                <asp:textbox id="txtBottom" runat="server" width="50px"></asp:textbox>
		                </span>
		                
		                <asp:RegularExpressionValidator ID="rev3" runat="server" ErrorMessage="*" ControlToValidate="txtTop"
                                                ValidationExpression="\d*"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="rev4" runat="server" ErrorMessage="*" ControlToValidate="txtLeft"
                                                ValidationExpression="\d*"></asp:RegularExpressionValidator>
		                <asp:RegularExpressionValidator ID="rev5" runat="server" ErrorMessage="*" ControlToValidate="txtRight"
                                                ValidationExpression="\d*"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="rev6" runat="server" ErrorMessage="*" ControlToValidate="txtBottom"
                                                ValidationExpression="\d*"></asp:RegularExpressionValidator>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plMargin" runat="server" resourcekey="Margin"></dnn:label></td>
		            <td class="Normal">
		                <asp:label id="plHMargin" runat="server" resourcekey="Horizontal"></asp:label>
		                <asp:DropDownList ID="cboHMargin" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Text="0.1"></asp:ListItem>
                                                        <asp:ListItem Text="0.2"></asp:ListItem>
                                                        <asp:ListItem Text="0.3"></asp:ListItem>
                                                        <asp:ListItem Text="0.4" selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="0.5"></asp:ListItem>
                                                        <asp:ListItem Text="0.6"></asp:ListItem>
                                                        <asp:ListItem Text="0.7"></asp:ListItem>
                                                        <asp:ListItem Text="0.8"></asp:ListItem>
                                                        <asp:ListItem Text="0.9"></asp:ListItem>
                                                        <asp:ListItem Text="1"></asp:ListItem>
                                                    </asp:DropDownList>
                        <asp:label id="plVMargin" runat="server" resourcekey="Vertical"></asp:label>
		                <asp:DropDownList ID="cboVMargin" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Text="0.1"></asp:ListItem>
                                                        <asp:ListItem Text="0.2" selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="0.3"></asp:ListItem>
                                                        <asp:ListItem Text="0.4"></asp:ListItem>
                                                        <asp:ListItem Text="0.5"></asp:ListItem>
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
			            <dnn:label id="plFrontSize" runat="server" resourcekey="FrontSize"></dnn:label></td>
		            <td class="Normal">
		                <asp:label id="plFrontWidth" runat="server" resourcekey="FrontWidth"></asp:label>
		                <asp:textbox id="txtFrontWidth" runat="server" Text="400" width="50px"></asp:textbox> * 
		                <asp:textbox id="txtFrontHeight" runat="server" Text="300" width="50px"></asp:textbox>
		                <asp:RegularExpressionValidator ID="rev1" runat="server" ErrorMessage="*" ControlToValidate="txtFrontWidth"
                                                ValidationExpression="\d*"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="rev2" runat="server" ErrorMessage="*" ControlToValidate="txtFrontHeight"
                                                ValidationExpression="\d*"></asp:RegularExpressionValidator>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plSlidesPerScroll" runat="server" resourcekey="SlidesPerScroll"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboSlidesPerScroll" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Text="2"></asp:ListItem>
                                                        <asp:ListItem Text="3"></asp:ListItem>
                                                        <asp:ListItem Text="4"></asp:ListItem>
                                                        <asp:ListItem Text="5" selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="6"></asp:ListItem>
                                                        <asp:ListItem Text="7"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plBackOpacity" runat="server" resourcekey="BackOpacity"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboBackOpacity" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Text="1" selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="0.9"></asp:ListItem>
                                                        <asp:ListItem Text="0.8"></asp:ListItem>
                                                        <asp:ListItem Text="0.7"></asp:ListItem>
                                                        <asp:ListItem Text="0.6"></asp:ListItem>
                                                        <asp:ListItem Text="0.5"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plBackZoom" runat="server" resourcekey="BackZoom"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboBackZoom" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Text="0.8" selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="0.7"></asp:ListItem>
                                                        <asp:ListItem Text="0.6"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plSpecialEffect" runat="server" resourcekey="SpecialEffect"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboSpecialEffect" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Text="none"></asp:ListItem>
                                                        <asp:ListItem Text="border"></asp:ListItem>
                                                        <asp:ListItem Text="reflection"></asp:ListItem>
                                                        <asp:ListItem Text="shadow" selected="True"></asp:ListItem>
                                                    </asp:DropDownList> 
                        <asp:label id="lblWhiteBackground" runat="server" resourcekey="WhiteBackground"></asp:label>
		            </td>
	            </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblButtonNav" runat="server" resourcekey="ButtonNav" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="cboButtonNav" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Text="none" selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="bullets"></asp:ListItem>
                                                        <asp:ListItem Text="numbers"></asp:ListItem>
                                                    </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblDirectionNav" runat="server" resourcekey="DirectionNav" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkDirectionNav" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblMouseWheel" runat="server" resourcekey="MouseWheel" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkMouseWheel" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblOpenLinkInNewWindow" runat="server" resourcekey="OpenLinkInNewWindow" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkOpenLinkInNewWindow" runat="server" resourcekey="Yes"></asp:checkbox>
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
</div>

<script type="text/javascript">
jQuery(document).ready(function(){
    var chkAutoPlay = jQuery("#<%=chkAutoPlay.ClientID %>");
    chkAutoPlay.change(function(){
        jQuery("#<%=cboPauseTime.ClientID %>").attr("disabled", !this.checked);
    });
    
    chkAutoPlay.change();
    
    var cboSpecialEffect = jQuery("#<%=cboSpecialEffect.ClientID %>");
    cboSpecialEffect.change(function(){
        if(jQuery(this).val() == "reflection")
            jQuery("#<%=lblWhiteBackground.ClientID %>").show();
        else
            jQuery("#<%=lblWhiteBackground.ClientID %>").hide();
    });
    
    cboSpecialEffect.change();
    
    var cboCarouselDirection = jQuery("#<%=cboCarouselDirection.ClientID %>");
    cboCarouselDirection.change(function(){
        var direction = jQuery(this).val();
        
        if (direction.indexOf("left-") == 0)
            jQuery("#spanLeft").show();
        else
            jQuery("#spanLeft").hide();
        
        if (direction.indexOf("right-") == 0)
            jQuery("#spanRight").show();
        else
            jQuery("#spanRight").hide();
        
        if (direction.indexOf("-bottom") > 0)
            jQuery("#spanBottom").show();
        else
            jQuery("#spanBottom").hide();
    });
    
    cboCarouselDirection.change();
    
    var cboTextDescription = jQuery("#<%=cboTextDescription.ClientID %>");
    cboTextDescription.change(function(){
        var separated = jQuery(this).val() == "separated";
        jQuery("#<%=cboSlidesPerScroll.ClientID %>").attr("disabled", separated);
        //jQuery("#<%=txtTop.ClientID %>").attr("disabled", separated);
        jQuery("#<%=txtLeft.ClientID %>").attr("disabled", separated);
        jQuery("#<%=txtRight.ClientID %>").attr("disabled", separated);
        jQuery("#<%=txtBottom.ClientID %>").attr("disabled", separated);
        jQuery("#<%=cboHMargin.ClientID %>").attr("disabled", separated);
        jQuery("#<%=cboVMargin.ClientID %>").attr("disabled", separated);
    });
    
    cboTextDescription.change();
});
</script>