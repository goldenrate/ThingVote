<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TiltViewerAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.TiltViewerAppearance" %>
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
                        <asp:Label ID="Label2" runat="server" resourcekey="RowsAndColumns"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="cboRows" runat="server">
                            <asp:ListItem Value="1"></asp:ListItem>
                            <asp:ListItem Value="2"></asp:ListItem>
                            <asp:ListItem Value="3"></asp:ListItem>
                            <asp:ListItem Value="4"></asp:ListItem>
                            <asp:ListItem Value="5" Selected="true"></asp:ListItem>
                            <asp:ListItem Value="6"></asp:ListItem>
                            <asp:ListItem Value="7"></asp:ListItem>
                            <asp:ListItem Value="8"></asp:ListItem>
                            <asp:ListItem Value="9"></asp:ListItem>
                            <asp:ListItem Value="10"></asp:ListItem>
                            <asp:ListItem Value="11"></asp:ListItem>
                            <asp:ListItem Value="12"></asp:ListItem>
                            <asp:ListItem Value="13"></asp:ListItem>
                            <asp:ListItem Value="14"></asp:ListItem>
                            <asp:ListItem Value="15"></asp:ListItem>
                            <asp:ListItem Value="16"></asp:ListItem>
                            <asp:ListItem Value="18"></asp:ListItem>
                            <asp:ListItem Value="20"></asp:ListItem>
                            <asp:ListItem Value="22"></asp:ListItem>
                            <asp:ListItem Value="25"></asp:ListItem>
                        </asp:DropDownList>
                        x
                        <asp:DropDownList ID="cboColumns" runat="server">
                            <asp:ListItem Value="1"></asp:ListItem>
                            <asp:ListItem Value="2"></asp:ListItem>
                            <asp:ListItem Value="3"></asp:ListItem>
                            <asp:ListItem Value="4"></asp:ListItem>
                            <asp:ListItem Value="5" Selected="true"></asp:ListItem>
                            <asp:ListItem Value="6"></asp:ListItem>
                            <asp:ListItem Value="7"></asp:ListItem>
                            <asp:ListItem Value="8"></asp:ListItem>
                            <asp:ListItem Value="9"></asp:ListItem>
                            <asp:ListItem Value="10"></asp:ListItem>
                            <asp:ListItem Value="11"></asp:ListItem>
                            <asp:ListItem Value="12"></asp:ListItem>
                            <asp:ListItem Value="13"></asp:ListItem>
                            <asp:ListItem Value="14"></asp:ListItem>
                            <asp:ListItem Value="15"></asp:ListItem>
                            <asp:ListItem Value="16"></asp:ListItem>
                            <asp:ListItem Value="18"></asp:ListItem>
                            <asp:ListItem Value="20"></asp:ListItem>
                            <asp:ListItem Value="22"></asp:ListItem>
                            <asp:ListItem Value="25"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" resourcekey="BackColor"></asp:Label>
                    </td>
                    <td>
                        <uc1:uccolorpicker id="backColor" runat="server" Color="FFFF00">
                        </uc1:uccolorpicker>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" resourcekey="LinkLabel"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLinkLabel" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkUseReloadButton" runat="server" resourcekey="UseReloadButton" />
                    </td>
                </tr>
                <tr id="trAmazonS3" runat="server" visible="false">
                    <td>
                        <asp:Label ID="Label5" runat="server" resourcekey="AmazonS3"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" resourcekey="AmazonS3Enabled"></asp:Label>
                        <asp:LinkButton ID="lnkUpload" runat="server" resourcekey="Upload" CssClass="CommandButton" />
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