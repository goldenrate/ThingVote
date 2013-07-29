<%@ Control Language="vb" AutoEventWireup="false" Codebehind="MediaLibraryAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.MediaLibraryAppearance" %>
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
                    <td width="130">
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
                    <td>
                        <asp:Label ID="Label1" runat="server" resourcekey="GroupMediaBy"></asp:Label>:
                    </td>
                    <td>
                        <asp:DropDownList ID="lstGroupMediaBy" runat="server" CssClass="Normal">
                            <asp:ListItem Value="day"></asp:ListItem>
                            <asp:ListItem Value="month"></asp:ListItem>
                            <asp:ListItem Value="year"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label6" runat="server" resourcekey="of"></asp:Label>
                        <asp:DropDownList ID="lstGroupDate" runat="server" CssClass="Normal">
                            <asp:ListItem Value="takenDate"></asp:ListItem>
                            <asp:ListItem Value="createdDate"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="Label4" runat="server" resourcekey="DefaultChoices" Suffix=":"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="lstDefaultChoices" runat="server" CssClass="Normal">
                            <asp:ListItem Text="all" Value=""></asp:ListItem>
                            <asp:ListItem Text="images" Value="/images"></asp:ListItem>
                            <asp:ListItem Text="videos" Value="/videos"></asp:ListItem>
                            <asp:ListItem Text="audios" Value="/audios"></asp:ListItem>
                            <asp:ListItem Text="flashs" Value="/flashs"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label5" runat="server" resourcekey="or"></asp:Label>
                        <asp:TextBox ID="txtDefaultChoices" runat="server" Width="200px" CssClass="NormalTextBox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="lblShowTitle" runat="server" resourcekey="ShowTitle" suffix=":"></dnn:Label>
                    </td>
                    <td>
                        <asp:checkbox id="chkShowTitle" runat="server" resourcekey="Yes"></asp:checkbox>
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