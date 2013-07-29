<%@ Control Language="vb" AutoEventWireup="false" Codebehind="ThreeDWallAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.ThreeDWallAppearance" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucColorPicker" Src="ucColorPicker.ascx" %>
<table width="100%" runat="server" class="Normal">
                <tr>
                    <td class="header">
                        <asp:Label ID="Label19" runat="server" resourcekey="BackgroungColor"></asp:Label>
                    </td>
                    <td>
                        <uc1:uccolorpicker id="backgroundColor" runat="server" Color="">
                        </uc1:uccolorpicker>
                        </td>
                        </tr>

    <tr>
                    <td class="header">
                        <asp:Label ID="Label4" runat="server" resourcekey="Max_Slides"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" resourcekey="Max_Slides.Help"></asp:Label>
                        <asp:DropDownList ID="cboMaxSlides" runat="server" CssClass="NormalTextBox">
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
                        </asp:DropDownList>,
                        <asp:Label ID="Label6" runat="server" resourcekey="Choose_Slides1.Text"></asp:Label>
                        <asp:DropDownList ID="cboChooseSlides" runat="server" CssClass="NormalTextBox">
                            <asp:ListItem>Predefined</asp:ListItem>
                            <asp:ListItem>Random</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label7" runat="server" resourcekey="Choose_Slides2.Text"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <asp:Label ID="Label8" runat="server" resourcekey="Controls"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkBottomNavigation" runat="server" resourcekey="BottomNavigation" Checked="True" />
                        <asp:CheckBox ID="chkTopNavigation" runat="server" resourcekey="TopNavigation" Checked="True" />
                        </td></tr>
</table>

<p style="text-align:center;">
            <asp:Button ID="btnSave" runat="server" resourcekey="cmdUpdate" CssClass="CommandButton" />
            <asp:Button ID="btnCancel" runat="server" resourcekey="cmdCancel" CssClass="CommandButton" /></td>
</p>
