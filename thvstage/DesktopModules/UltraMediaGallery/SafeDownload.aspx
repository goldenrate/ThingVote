<%@ Page Language="vb" AutoEventWireup="false" Codebehind="SafeDownload.aspx.vb" Inherits="BizModules.UltraPhotoGallery.SafeDownload" %>
<HTML>
	<HEAD>
		<TITLE>File Download</TITLE>
		<LINK href='<% =ResolveUrl("~/Portals/_default/default.css")%>' type=text/css rel=stylesheet>
			<LINK href='<% =PortalSettings.HomeDirectory + "portal.css"%>' type=text/css rel=stylesheet>
	</HEAD>
	<body>
		<table width="400" align="center" id="Table1">
			<tr>
				<td class="Head"><asp:Label Runat="server" ID="Label4" resourcekey="Title"></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="Normal"><asp:Label Runat="server" ID="Label5" resourcekey="SubTitle"></asp:Label>
					<hr size="1">
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" align="center" id="Table1">
						<tr>
							<td class="SubHead" width="145"><asp:Label Runat="server" ID="Label1" resourcekey="DownloadName"></asp:Label>:</td>
							<td class="Normal"><asp:Label Runat="Server" ID="lblDownloadName"></asp:Label></td>
						</tr>
						<tr>
							<td class="SubHead">
								<asp:Label id="Label2" Runat="server" resourcekey="ContentType"></asp:Label>:</td>
							<td class="Normal">
								<asp:Label id="lblContentType" Runat="server"></asp:Label></td>
						</tr>
						<tr>
							<td class="SubHead">
								<asp:Label id="Label3" Runat="server" resourcekey="FileSize"></asp:Label>:</td>
							<td class="Normal">
								<asp:Label id="lblFileSize" Runat="server"></asp:Label></td>
						</tr>
						<tr>
							<td class="SubHead">
								<asp:Label id="Label6" Runat="server" resourcekey="DownloadTimes"></asp:Label>:</td>
							<td class="Normal">
								<asp:Label id="lblDownloadTimes" Runat="server"></asp:Label></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<hr size="1">
					<p></p>
					<asp:HyperLink id="lnkDownload" runat="server" cssClass="Head"></asp:HyperLink></td>
			</tr>
		</table>
	</body>
</HTML>
