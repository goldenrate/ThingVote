<%@ Control Language="vb" AutoEventWireup="false" Codebehind="HighslideAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.HighslideAppearance" %>
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
                    <td>
                        <asp:Label ID="lblPageSize" runat="server" resourcekey="PageSize"></asp:Label>:
                    </td>
                    <td>
                        <asp:DropDownList ID="rdoPageSize" runat="server" CssClass="Normal">
                            <asp:ListItem value="4" Selected="True"></asp:ListItem>
                            <asp:ListItem value="10"></asp:ListItem>
                            <asp:ListItem value="20"></asp:ListItem>
                            <asp:ListItem value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" resourcekey="Columns"></asp:Label>:
                    </td>
                    <td>
                        <asp:DropDownList ID="rdoColumns" runat="server" CssClass="Normal">
                            <asp:ListItem Text="1"></asp:ListItem>
                            <asp:ListItem Text="2"></asp:ListItem>
                            <asp:ListItem Text="3"></asp:ListItem>
                            <asp:ListItem Text="4"></asp:ListItem>
                            <asp:ListItem Text="5" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="6"></asp:ListItem>
                            <asp:ListItem Text="7"></asp:ListItem>
                            <asp:ListItem Text="10"></asp:ListItem>
                            <asp:ListItem Text="15"></asp:ListItem>
                            <asp:ListItem Text="20"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" resourcekey="Theme"></asp:Label>:
                    </td>
                    <td>
                        <asp:DropDownList ID="rdoTheme" runat="server" CssClass="Normal">
                            <asp:ListItem Text="rounded-white"></asp:ListItem>
                            <asp:ListItem Text="rounded-black"></asp:ListItem>
                            <asp:ListItem Text="outer-glow"></asp:ListItem>
                            <asp:ListItem Text="glossy-dark"></asp:ListItem>
                            <asp:ListItem Text="drop-shadow" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="beveled"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" resourcekey="WrapperClass"></asp:Label>:
                    </td>
                    <td>
                        <asp:DropDownList ID="rdoWrapperClass" runat="server" CssClass="Normal">
                            <asp:ListItem Text="default" Value=""></asp:ListItem>
                            <asp:ListItem Text="dark"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td width="130">
                        <dnn:Label ID="Label4" runat="server" resourcekey="Appearance" Suffix=":"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="lstAppearance" runat="server" CssClass="Normal">
                        </asp:DropDownList>
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
