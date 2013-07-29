<%@ Control Language="vb" AutoEventWireup="false" Codebehind="UltraPhotoGallery.ascx.vb" Inherits="BizModules.UltraPhotoGallery.UltraPhotoGallery" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<UPG:Header ID="ctlHeader" runat="server" />

<div class='UMGViewer'><asp:PlaceHolder id="phContainer" runat="server"></asp:PlaceHolder></div>
<asp:panel ID="pnlFooter" runat="server">
	<div style="text-align:center; line-height:24px;">
	    <a title="DotNetNuke gallery module" href="http://www.bizmodules.net/" target="_blank" style="font-family:Tahoma, Arial; color:#ccc; font-size:9px;">
	    Ultra Media Gallery 8</a>
	</div>
</asp:panel>
