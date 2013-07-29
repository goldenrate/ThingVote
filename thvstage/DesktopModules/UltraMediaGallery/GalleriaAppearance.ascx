<%@ Control Language="vb" AutoEventWireup="false" Codebehind="GalleriaAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.GalleriaAppearance" %>
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
                                                        <asp:ListItem Text="fade"></asp:ListItem>
                                                        <asp:ListItem Text="flash"></asp:ListItem>
                                                        <asp:ListItem Text="pulse"></asp:ListItem>
                                                        <asp:ListItem Text="slide"></asp:ListItem>
                                                        <asp:ListItem Text="fadeslide"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plTouchTransition" runat="server" resourcekey="TouchTransition" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboTouchTransition" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Text="fade"></asp:ListItem>
                                                        <asp:ListItem Text="flash"></asp:ListItem>
                                                        <asp:ListItem Text="pulse"></asp:ListItem>
                                                        <asp:ListItem Text="slide"></asp:ListItem>
                                                        <asp:ListItem Text="fadeslide"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plOtherOptions" runat="server" resourcekey="OtherOptions" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:TextBox ID="txtOtherOptions" runat="server" CssClass="NormalTextBox" Width="400px" Height="80px" Textmode="Multiline"></asp:TextBox>
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
