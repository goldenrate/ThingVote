<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TripleLayerSliderAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.TripleLayerSliderAppearance" %>
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
                                    <asp:checkbox id="chkPauseOnHover" runat="server" checked="True" resourcekey="PauseOnHover"></asp:checkbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label11" runat="server" resourcekey="AnimSpeed" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboAnimSpeed" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>100</asp:ListItem>
                                        <asp:ListItem>200</asp:ListItem>
                                        <asp:ListItem>300</asp:ListItem>
                                        <asp:ListItem selected="True">500</asp:ListItem>
                                        <asp:ListItem>750</asp:ListItem>
                                        <asp:ListItem>1000</asp:ListItem>
                                    </asp:dropdownlist>
                                    <asp:label id="Label13" runat="server" resourcekey="Milliseconds.Text"></asp:label>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblArrowButtons" runat="server" resourcekey="ArrowButtons" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboArrowButtons" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem Value="Always"></asp:ListItem>
                                        <asp:ListItem Value="OnHover"></asp:ListItem>
                                        <asp:ListItem Value="Disabled"></asp:ListItem>
                                    </asp:dropdownlist>
                        <asp:dropdownlist id="cboArrowButtonsPosition" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem Value="Inside"></asp:ListItem>
                                        <asp:ListItem Value="Outside"></asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblNavigation" runat="server" resourcekey="Navigation" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboNavigation" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem Value="Bullets"></asp:ListItem>
                                        <asp:ListItem Value="Thumbnails"></asp:ListItem>
                                        <asp:ListItem Value="Neither"></asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label10" runat="server" resourcekey="LiquidLayout"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="cboLiquidLayout" runat="server" checked="True" resourcekey="Enabled"></asp:checkbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblBackground" runat="server" resourcekey="Background" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboBackground" runat="server" cssclass="NormalTextBox">
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblFirstLayer" runat="server" resourcekey="FirstLayer" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboFirstLayer" runat="server" cssclass="NormalTextBox">
                                    </asp:dropdownlist>
                                    <a href="http://www.bizmodules.net/portals/0/downloads/TLS_Layers.zip" onclick="alert('<%=Localize("DownloadMore.Help") %>');"><asp:label id="lblDownloadMore" runat="server" resourcekey="DownloadMore"></asp:label></a>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblFirstLayerDistance" runat="server" resourcekey="FirstLayerDistance" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:textbox id="txtFirstLayerDistance" runat="server" width="100"></asp:textbox>
                        <asp:rangevalidator id="RangeValidator1" runat="server" Text="0 ~ 100" controltovalidate="txtFirstLayerDistance"
                                                    maximumvalue="100" minimumvalue="0" type="Integer"></asp:rangevalidator>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblFirstLayerDirection" runat="server" resourcekey="FirstLayerDirection" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboFirstLayerDirection" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem Value="ltr"></asp:ListItem>
                                        <asp:ListItem Value="rtl"></asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblSecondLayer" runat="server" resourcekey="SecondLayer" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboSecondLayer" runat="server" cssclass="NormalTextBox">
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblSecondLayerDistance" runat="server" resourcekey="SecondLayerDistance" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:textbox id="txtSecondLayerDistance" runat="server" width="100"></asp:textbox>
                        <asp:rangevalidator id="RangeValidator2" runat="server" Text="0 ~ 100" controltovalidate="txtSecondLayerDistance"
                                                    maximumvalue="100" minimumvalue="0" type="Integer"></asp:rangevalidator>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblSecondLayerDirection" runat="server" resourcekey="SecondLayerDirection" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboSecondLayerDirection" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem Value="ltr"></asp:ListItem>
                                        <asp:ListItem Value="rtl"></asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblCaptionPosition" runat="server" resourcekey="CaptionPosition" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:textbox id="txtCaptionPosition" runat="server" width="400"></asp:textbox>
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
        jQuery("#<%=chkPauseOnHover.ClientID %>").attr("disabled", !this.checked);
    });
    
    chkAutoPlay.change();
    
    var cboSecondLayer = jQuery("#<%=cboSecondLayer.ClientID %>");
    cboSecondLayer.change(function(){
        jQuery("#<%=txtSecondLayerDistance.ClientID %>").attr("disabled", jQuery(this).val() == "");
        jQuery("#<%=cboSecondLayerDirection.ClientID %>").attr("disabled", jQuery(this).val() == "");
    });
    
    cboSecondLayer.change();
});
</script>