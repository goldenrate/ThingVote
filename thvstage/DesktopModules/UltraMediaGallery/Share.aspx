<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Share.aspx.vb" Inherits="BizModules.UltraPhotoGallery.Share" %>

<html>
<head>
    <title>
        <%=PortalName%>
    </title>
    <link href='<% =ResolveUrl("~/Portals/_default/default.css")%>' type="text/css" rel="stylesheet">
    <link href='<% =PortalSettings.HomeDirectory + "portal.css"%>' type="text/css" rel="stylesheet">
</head>
<body leftmargin="3" topmargin="3">
    <form id="Form1" runat="server">
        <asp:HyperLink ID="lnkLogo" runat="server"></asp:HyperLink>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td height="20">
                </td>
            </tr>
            <tr>
                <td valign="middle">
                    <table id="tblForm" width="100%" border="0" runat="server">
                        <tr>
                            <td>
                                <asp:Label ID="lblEmailToText" runat="server" resourcekey="EmailToText" CssClass="SubSubHead"></asp:Label><br>
                                <asp:Label ID="lblEmailToHelp" runat="server" resourcekey="EmailToHelp" CssClass="Normal"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtEmailTo" runat="server" Width="90%" Height="50px" TextMode="MultiLine"
                                    CssClass="NormalTextBox" MaxLength="200"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                                    ControlToValidate="txtEmailTo" CssClass="Normal"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblYourNameText" runat="server" resourcekey="YourNameText" CssClass="SubSubHead"></asp:Label>
                                <asp:Label ID="lblYourNameHelp" runat="server" resourcekey="YourNameHelp" CssClass="Normal"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtYourName" runat="server" Width="90%" CssClass="NormalTextBox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblMessageText" runat="server" resourcekey="MessageText" CssClass="SubSubHead"></asp:Label>
                                <asp:Label ID="lblMessageHelp" runat="server" resourcekey="MessageHelp" CssClass="Normal"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtPersonalMessage" runat="server" Width="90%" Height="50px" CssClass="NormalTextBox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="cmdSend" runat="server" resourcekey="Send" CssClass="CommandButton">
                                </asp:Button>
                                &nbsp;&nbsp;<input type="button" onclick="window.close()" class="CommandButton"
                                    value='<%=Close%>'>
                            </td>
                        </tr>
                    </table>
                    <table id="tblResult" cellspacing="1" cellpadding="1" width="100%" border="0" runat="server"
                        visible="false">
                        <tr>
                            <td width="40%" align="center">
                                <table border="1" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Image ID="imgThumbnail" runat="server"></asp:Image></td>
                                    </tr>
                                </table>
                                <div>
                                </div>
                            </td>
                            <td class="Normal" valign="top">
                                <asp:Label ID="lblSendResult" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="button" onclick="window.close()" class="CommandButton" value='<%=Close%>'></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
