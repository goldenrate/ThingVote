<%@ Control Language="vb" AutoEventWireup="false" Codebehind="PhotoCalendarSettings.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.PhotoCalendarSettings" %>
<div class="UMGSection" style="width:600px;">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader">
            <asp:Label ID="Label6" runat="server" resourcekey="ControlTitle_modulesettings.Text"
                CssClass="SubHead">
            </asp:Label></td>
    </tr>
    <tr>
        <td>
            <table cellpadding="3" width="100%">
                <tr>
                    <td class="Normal">
                        <asp:Label ID="Label1" runat="server" resourcekey="RetrieveFrom.Text"></asp:Label>
                        <asp:DropDownList ID="cboModules" runat="server" AutoPostBack="true" CssClass="NormalTextBox"
                            DataValueField="value" DataTextField="text">
                        </asp:DropDownList>
                        <p>
                        <asp:Label ID="Label2" runat="server" resourcekey="DefaultMonth.Text"></asp:Label>:
                        <asp:DropDownList ID="cboMonths" runat="server" CssClass="NormalTextBox">
                        </asp:DropDownList>
                        </p>
                        <p>
                            <asp:CheckBox ID="chkUseLightbox" runat="server" CssClass="NormalTextBox" resourcekey="Lightbox">
                            </asp:CheckBox>
                        </p>
                        <p>
                            <asp:CheckBox ID="chkWeekCalendar" CssClass="NormalTextBox" runat="server" resourcekey="WeekCalendar"></asp:CheckBox>
                        </p>
                        <p>
                            <asp:CheckBox ID="chkGroupbyTakendate" CssClass="NormalTextBox" runat="server" resourcekey="GropuByTakenDate"></asp:CheckBox>
                        </p>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SectionFooter" align="center">
            <asp:Button class="CommandButton" ID="btnUpdate" runat="server" resourcekey="cmdUpdate"
                ></asp:Button>&nbsp;
            <asp:Button class="CommandButton" ID="btnCancel" runat="server" resourcekey="cmdCancel"
                CausesValidation="False" Text="Cancel"></asp:Button>
        </td>
    </tr>
</table>
</div>
