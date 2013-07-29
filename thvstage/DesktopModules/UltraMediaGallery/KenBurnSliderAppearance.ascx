<%@ Control Language="vb" AutoEventWireup="false" Codebehind="KenBurnSliderAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.KenBurnSliderAppearance" %>
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
                        <dnn:label id="lblTheme" runat="server" resourcekey="Theme" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboTheme" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem selected="True">dark</asp:ListItem>
                                        <asp:ListItem>light</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblTransition" runat="server" resourcekey="Transition" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboTransition" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem selected="True">slide</asp:ListItem>
                                        <asp:ListItem>fade</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label12" runat="server" resourcekey="PauseTime" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboPauseTime" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem selected="True">5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblThumbStyle" runat="server" resourcekey="ThumbStyle" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboThumbStyle" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>thumb</asp:ListItem>
                                        <asp:ListItem selected="True">bullet</asp:ListItem>
                                        <asp:ListItem>none</asp:ListItem>
                                    </asp:dropdownlist>
                                    
                        <div class="divThumb">
                        <asp:label id="lblHideThumbs" runat="server" resourcekey="HideThumbs"></asp:label>
		                <asp:checkbox id="chkHideThumbs" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
		                
                        <asp:label id="lblAmount" runat="server" resourcekey="Amount"></asp:label>
                        <asp:dropdownlist id="cboAmount" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem selected="True">8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                    </asp:dropdownlist>
                        <asp:label id="lblVideoIcon" runat="server" resourcekey="VideoIcon"></asp:label>
                        <asp:checkbox id="chkVideoIcon" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="plPauseOnHover" runat="server" resourcekey="PauseOnHover" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkPauseOnHover" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="plTouchEnabled" runat="server" resourcekey="TouchEnabled" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkTouchEnabled" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
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
jQuery(document).ready(function() {
    var cboThumbStyle = jQuery("#<%=cboThumbStyle.ClientID %>");
    cboThumbStyle.change(function(){
        var thumbStyle = jQuery(this).val();
        if(thumbStyle == 'thumb')
            jQuery(".divThumb").show();
        else
            jQuery(".divThumb").hide();
    });
    cboThumbStyle.change();
});
</script>