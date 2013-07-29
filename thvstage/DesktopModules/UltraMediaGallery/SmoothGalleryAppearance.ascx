<%@ Control Language="vb" AutoEventWireup="false" Codebehind="SmoothGalleryAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.SmoothGalleryAppearance" %>
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
                    <td width="130">
                        <dnn:Label ID="Label2" runat="server" resourcekey="Transition" Suffix=":"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="cboTransition" runat="server" CssClass="Normal">
                            <asp:ListItem value="alpha"></asp:ListItem>
                            <asp:ListItem value="zoom"></asp:ListItem>
                            <asp:ListItem value="slide"></asp:ListItem>
                            <asp:ListItem value="split"></asp:ListItem>
                            <asp:ListItem value="reveal"></asp:ListItem>
                        </asp:DropDownList>
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
                    <td width="130">
                        <dnn:Label ID="plPlaylist" runat="server" resourcekey="Playlist" Suffix=":"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="cboPlaylist" runat="server" CssClass="Normal">
                            <asp:ListItem value="open" selected="true"></asp:ListItem>
                            <asp:ListItem value="closed"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td width="130">
                        <dnn:Label ID="plPlaylistPosition" runat="server" resourcekey="PlaylistPosition" Suffix=":"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="cboPlaylistPosition" runat="server" CssClass="Normal">
                            <asp:ListItem value="top"></asp:ListItem>
                            <asp:ListItem value="right"></asp:ListItem>
                            <asp:ListItem value="bottom" selected="true"></asp:ListItem>
                            <asp:ListItem value="left"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plBackgroundColor" runat="server" resourcekey="BackgroundColor" Suffix=":"></dnn:label>
			        </td>
		            <td class="Normal">
		                <uc1:uccolorpicker id="clrBackgroundColor" runat="server" Color="">
                        </uc1:uccolorpicker>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plPlaylistBgColor" runat="server" resourcekey="PlaylistBgColor" Suffix=":"></dnn:label>
			        </td>
		            <td class="Normal">
		                <uc1:uccolorpicker id="clrPlaylistBgColor" runat="server" Color="">
                        </uc1:uccolorpicker>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plMenuBgColor" runat="server" resourcekey="MenuBgColor" Suffix=":"></dnn:label>
			        </td>
		            <td class="Normal">
		                <uc1:uccolorpicker id="clrMenuBgColor" runat="server" Color="">
                        </uc1:uccolorpicker>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plMenuRolloverColor" runat="server" resourcekey="MenuRolloverColor" Suffix=":"></dnn:label>
			        </td>
		            <td class="Normal">
		                <uc1:uccolorpicker id="clrMenuRolloverColor" runat="server" Color="">
                        </uc1:uccolorpicker>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plThumbBgColor" runat="server" resourcekey="ThumbBgColor" Suffix=":"></dnn:label>
			        </td>
		            <td class="Normal">
		                <uc1:uccolorpicker id="clrThumbBgColor" runat="server" Color="">
                        </uc1:uccolorpicker>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plThumbRolloverColor" runat="server" resourcekey="ThumbRolloverColor" Suffix=":"></dnn:label>
			        </td>
		            <td class="Normal">
		                <uc1:uccolorpicker id="clrThumbRolloverColor" runat="server" Color="">
                        </uc1:uccolorpicker>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plAutoOpenDescription" runat="server" resourcekey="AutoOpenDescription" Suffix=":"></dnn:label>
			        </td>
		            <td class="Normal">
		                <asp:checkbox id="chkAutoOpenDescription" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plLinkToRawFile" runat="server" resourcekey="LinkToRawFile" Suffix=":"></dnn:label>
			        </td>
		            <td class="Normal">
		                <asp:checkbox id="chkLinkToRawFile" runat="server" checked="False" resourcekey="Yes"></asp:checkbox>
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