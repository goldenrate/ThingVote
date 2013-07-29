<%@ Control Language="vb" AutoEventWireup="false" Codebehind="ucHeader.ascx.vb" Inherits="BizModules.UltraPhotoGallery.ucHeader" %>
<div style="border: 1px dotted #838383; margin-bottom: 5px; text-align:center;">
    <asp:Table ID="Table1" runat="server" CssClass="Normal" CellPadding="5" style="margin:auto auto;">
        <asp:TableRow>
            <asp:TableCell ID="cellGallery" HorizontalAlign="Center">
                <asp:HyperLink ID="lnkGallery" runat="server" CssClass="CommandButton">
                    <img src="<%=ModulePath%>images/home.gif" border="0" vspace="5"><br>
                    <asp:Label ID="lblGallery" runat="server" resourcekey="Gallery"></asp:Label>
                </asp:HyperLink>
            </asp:TableCell>
            <asp:TableCell ID="cellMyPhotos" HorizontalAlign="Center">
                <asp:HyperLink ID="lnkMyPhotos" runat="server" CssClass="CommandButton">
                    <img src="<%=ModulePath%>images/man.gif" border="0" vspace="5"><br>
                    <asp:Label ID="lblMyPhotos" runat="server" resourcekey="MyPhotos"></asp:Label>
                </asp:HyperLink>
            </asp:TableCell>
            <asp:TableCell ID="cellUpload" HorizontalAlign="Center">
                <asp:HyperLink ID="lnkUpload" runat="server" CssClass="CommandButton">
                    <img src="<%=ModulePath%>images/upload.png" border="0" vspace="5"><br>
                    <asp:Label ID="lblUpload" runat="server" resourcekey="Upload"></asp:Label>
                </asp:HyperLink>
            </asp:TableCell>
            <asp:TableCell ID="cellApprove" HorizontalAlign="Center">
                <asp:HyperLink ID="lnkApprove" runat="server" CssClass="CommandButton">
                    <img src="<%=ModulePath%>images/approve.png" border="0" vspace="5"><br>
                    <asp:Label ID="lblApprove" runat="server" resourcekey="Approve"></asp:Label>
                </asp:HyperLink>
            </asp:TableCell>
            <asp:TableCell ID="cellManage" HorizontalAlign="Center">
                <asp:HyperLink ID="lnkManage" runat="server" CssClass="CommandButton">
                    <img src="<%=ModulePath%>images/edit.gif" border="0" vspace="5"><br>
                    <asp:Label ID="lblManage" runat="server" resourcekey="Manage"></asp:Label>
                </asp:HyperLink>
            </asp:TableCell>
            <asp:TableCell ID="cellAlbums" HorizontalAlign="Center">
                <asp:HyperLink ID="lnkAlbums" runat="server" CssClass="CommandButton">
                    <img src="<%=ModulePath%>images/album.png" border="0" vspace="5"><br>
                    <asp:Label ID="lblAlbums" runat="server" resourcekey="Albums"></asp:Label>
                </asp:HyperLink>
            </asp:TableCell>
            <asp:TableCell ID="cellAppearance" HorizontalAlign="Center">
                <asp:HyperLink ID="lnkAppearance" runat="server" CssClass="CommandButton">
                    <img src="<%=ModulePath%>images/color.gif" border="0" vspace="5"><br>
                    <asp:Label ID="lblAppearance" runat="server" resourcekey="Appearance"></asp:Label>
                </asp:HyperLink>
            </asp:TableCell>
            <asp:TableCell ID="cellModuleSettings" HorizontalAlign="Center">
                <asp:HyperLink ID="lnkModuleSettings" runat="server" CssClass="CommandButton">
                    <img src="<%=ModulePath%>images/settings.png" border="0" vspace="5"><br>
                    <asp:Label ID="lblModuleSettings" runat="server" resourcekey="ModuleSettings"></asp:Label>
                </asp:HyperLink>
            </asp:TableCell>
            <asp:TableCell ID="cellSharePG" HorizontalAlign="Center">
                <asp:HyperLink ID="lnkSharePG" runat="server" CssClass="CommandButton">
                    <img src="<%=ModulePath%>images/share.gif" border="0" vspace="5"><br>
                    <asp:Label ID="lblSharePG" runat="server" resourcekey="SharePG"></asp:Label>
                </asp:HyperLink>
            </asp:TableCell>
            <asp:TableCell ID="cellAbout" HorizontalAlign="Center">
                <asp:HyperLink ID="lnkAbout" runat="server" CssClass="CommandButton">
                    <img src="<%=ModulePath%>images/about.png" border="0" vspace="5"><br>
                    <asp:Label ID="lblAbout" runat="server" resourcekey="About"></asp:Label>
                </asp:HyperLink>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</div>
