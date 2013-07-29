<%@ Control Language="vb" AutoEventWireup="false" Codebehind="UMGClassicAppearance.ascx.vb" Inherits="BizModules.UltraPhotoGallery.UMGClassicAppearance" %>
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
                        <dnn:label id="plLayout" runat="server" resourcekey="ResponsiveLayout" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="responsiveLayout" runat="server" checked="False" resourcekey="Yes"></asp:checkbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="plFastLoadMode" runat="server" resourcekey="FastLoadMode" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="fastLoadMode" runat="server" checked="False" resourcekey="Yes"></asp:checkbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:Label ID="plbackgroundColor" runat="server" resourcekey="backgroundColor" Suffix=":"></dnn:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="backgroundColor" runat="server">
                        </uc1:uccolorpicker></td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="Label1" runat="server" resourcekey="slideshowBackground" Suffix=":"></dnn:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="slideshowBackground" runat="server">
                        </uc1:uccolorpicker></td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plTitleColor" runat="server" resourcekey="titleColor" Suffix=":"></dnn:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="titleColor" runat="server">
                        </uc1:uccolorpicker></td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plNewPeriod" runat="server" resourcekey="newPeriod" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="newPeriod" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem selected="True">7</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>30</asp:ListItem>
                                        <asp:ListItem>60</asp:ListItem>
                                        <asp:ListItem>90</asp:ListItem>
                                        <asp:ListItem>180</asp:ListItem>
                                        <asp:ListItem>365</asp:ListItem>
                                    </asp:dropdownlist>
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
                    <td>
                        <dnn:Label ID="plThumbWidth" runat="server" resourcekey="thumbWidth" Suffix=":"></dnn:Label></td>
                    <td class="Normal">
                        <asp:DropDownList ID="thumbWidth" runat="server" CssClass="Normal">
                            <asp:ListItem Value="30"></asp:ListItem>
                            <asp:ListItem Value="35"></asp:ListItem>
                            <asp:ListItem Value="40" selected="True"></asp:ListItem>
                            <asp:ListItem Value="45"></asp:ListItem>
                            <asp:ListItem Value="50"></asp:ListItem>
                        </asp:DropDownList>
                        </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plScaleMode" runat="server" resourcekey="scaleMode" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="scaleMode" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem Value="no" Text="no scale"></asp:ListItem>
                                        <asp:ListItem selected="True">fit</asp:ListItem>
                                        <asp:ListItem>max</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plAnimSpeed" runat="server" resourcekey="animSpeed" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="animSpeed" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>100</asp:ListItem>
                                        <asp:ListItem>200</asp:ListItem>
                                        <asp:ListItem>300</asp:ListItem>
                                        <asp:ListItem>400</asp:ListItem>
                                        <asp:ListItem>500</asp:ListItem>
                                        <asp:ListItem selected="True">600</asp:ListItem>
                                        <asp:ListItem>700</asp:ListItem>
                                        <asp:ListItem>800</asp:ListItem>
                                        <asp:ListItem>1000</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plShowDesc" runat="server" resourcekey="showDesc" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="showDesc" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>none</asp:ListItem>
                                        <asp:ListItem selected="True">topright</asp:ListItem>
                                        <asp:ListItem>bottomright</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td><dnn:label id="plUIParts" runat="server" resourcekey="uiparts" Suffix=":"></dnn:label></td>
                    <td class="Normal">
                            <asp:CheckBox ID="quickNav" runat="server" resourcekey="quickNav">
                            </asp:CheckBox>
                            <br />
                            <asp:CheckBox ID="allowrating" runat="server" resourcekey="rating">
                            </asp:CheckBox>
                            <asp:CheckBox ID="showsocial" runat="server" resourcekey="social">
                            </asp:CheckBox>
                            <span class="sociallinks">
                                <asp:CheckBox ID="chkFacebook" runat="server" Checked="true" Text="Facebook"></asp:CheckBox>
                                <asp:CheckBox ID="chkTwitter" runat="server" Checked="true" Text="Twitter"></asp:CheckBox>
                                <asp:CheckBox ID="chkLinkedIn" runat="server" Checked="true" Text="LinkedIn"></asp:CheckBox>
                                <asp:CheckBox ID="chkEmail" runat="server" Checked="true" Text="Email"></asp:CheckBox>
                                <asp:CheckBox ID="chkGooglePlus" runat="server" Checked="true" Text="Google+"></asp:CheckBox>
                                <asp:CheckBox ID="chkPinterest" runat="server" Checked="true" Text="Pinterest"></asp:CheckBox>
                            </span>
                            <br />
                            <asp:CheckBox ID="hideoverlays" runat="server" resourcekey="hideoverlays">
                            </asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td><dnn:label id="plBehaviors" runat="server" resourcekey="behaviors" Suffix=":"></dnn:label></td>
                    <td class="Normal">
                            <asp:CheckBox ID="autoPlayVideo" runat="server" resourcekey="autoPlayVideo">
                            </asp:CheckBox>
                            <br />
                            <asp:CheckBox ID="showVideoControls" runat="server" resourcekey="showVideoControls">
                            </asp:CheckBox>
                            <br />
                            <asp:CheckBox ID="openLinkInNewWindow" runat="server" resourcekey="openLinkInNewWindow">
                            </asp:CheckBox>
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

    var allowrating = jQuery("#<%=allowrating.ClientID %>");
    allowrating.change(function(){
        var showsocial = jQuery("#<%=showsocial.ClientID %>");
        if (this.checked)
        {
            showsocial.attr("disabled", true);
            showsocial.attr("checked", true);
        }
        else
        {
            showsocial.attr("disabled", false);
        }
    });
    
    allowrating.change();    
    
    
    
    var showsocial = jQuery("#<%=showsocial.ClientID %>");
    showsocial.change(function(){
        var sociallinks = jQuery(".sociallinks");
        if (this.checked)
        {
            sociallinks.show();
        }
        else
        {
            sociallinks.hide();
        }
    });
    
    showsocial.change();  
    
});
</script>