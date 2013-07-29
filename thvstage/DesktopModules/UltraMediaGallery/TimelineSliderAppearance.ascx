<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TimelineSliderAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.TimelineSliderAppearance" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

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
                        <dnn:label id="lblSortBy" runat="server" resourcekey="SortBy" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboSortBy" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem selected="True" value="default"></asp:ListItem>
                                        <asp:ListItem value="createdtime"></asp:ListItem>
                                        <asp:ListItem value="takentime"></asp:ListItem>
                                    </asp:dropdownlist>
                        <span class='timeunit'>
                            <asp:label id="lblUnit" runat="server" resourcekey="Unit"></asp:label>
                            <asp:dropdownlist id="cboTimeUnit" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem selected="True">day</asp:ListItem>
                                        <asp:ListItem>month</asp:ListItem>
                                        <asp:ListItem>year</asp:ListItem>
                                    </asp:dropdownlist>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="plPauseTime" runat="server" resourcekey="PauseTime" Suffix=":"></dnn:label>
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
                        <dnn:label id="lblTransition" runat="server" resourcekey="Transition" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboTransition" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem selected="True" value="slide"></asp:ListItem>
                                        <asp:ListItem value="fade"></asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblShowDescription" runat="server" resourcekey="ShowDescription" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboDescription" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem selected="True" value="onhover"></asp:ListItem>
                                        <asp:ListItem value="always"></asp:ListItem>
                                        <asp:ListItem value="no"></asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblQuickNav" runat="server" resourcekey="QuickNav" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboQuickNav" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem selected="True" value="onhover"></asp:ListItem>
                                        <asp:ListItem value="always"></asp:ListItem>
                                        <asp:ListItem value="no"></asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblXOfY" runat="server" resourcekey="XOfY" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboXOfY" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem selected="True" value="onhover"></asp:ListItem>
                                        <asp:ListItem value="always"></asp:ListItem>
                                        <asp:ListItem value="no"></asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblNoOfPhotos" runat="server" resourcekey="NoOfPhotos" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboNoOfPhotos" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem selected="True" value="morethanone"></asp:ListItem>
                                        <asp:ListItem value="always"></asp:ListItem>
                                        <asp:ListItem value="no"></asp:ListItem>
                                    </asp:dropdownlist>
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

    var cboSortBy = jQuery("#<%=cboSortBy.ClientID %>");
    cboSortBy.change(function(){
        if (jQuery(this).val() != "default")
            jQuery(".timeunit").show();
        else
            jQuery(".timeunit").hide();
    });
    
    cboSortBy.change();    
});
</script>