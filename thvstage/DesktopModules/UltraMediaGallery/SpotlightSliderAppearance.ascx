<%@ Control Language="vb" AutoEventWireup="false" Codebehind="SpotlightSliderAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.SpotlightSliderAppearance" %>
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
                        <dnn:Label ID="Label19" runat="server" resourcekey="BackgroungColor"></dnn:Label>
                    </td>
                    <td>
                        <uc1:uccolorpicker id="backgroundColor" runat="server" Color="">
                        </uc1:uccolorpicker>
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
                        <dnn:label id="lblNumberOfColumns" runat="server" resourcekey="NumberOfColumns" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboNumberOfColumns" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem selected="True">3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblNewPeriod" runat="server" resourcekey="NewPeriod" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboNewPeriod" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem value="0"></asp:ListItem>
                                        <asp:ListItem value="1"></asp:ListItem>
                                        <asp:ListItem value="2"></asp:ListItem>
                                        <asp:ListItem value="3"></asp:ListItem>
                                        <asp:ListItem value="5"></asp:ListItem>
                                        <asp:ListItem selected="True" value="7"></asp:ListItem>
                                        <asp:ListItem value="14"></asp:ListItem>
                                        <asp:ListItem value="30"></asp:ListItem>
                                        <asp:ListItem value="91"></asp:ListItem>
                                        <asp:ListItem value="182"></asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblNavigation" runat="server" resourcekey="Navigation" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkNavigation" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblOpenLinkInNewWindow" runat="server" resourcekey="OpenLinkInNewWindow" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkOpenLinkInNewWindow" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
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
    
});
</script>