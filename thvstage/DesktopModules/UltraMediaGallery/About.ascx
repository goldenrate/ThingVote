<%@ Control Language="vb" AutoEventWireup="false" Codebehind="About.ascx.vb" Inherits="BizModules.UltraPhotoGallery.About" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<upg:header id="ctlHeader" runat="server" />
<div style="text-align: center;">
    <asp:label id="lblCopyright" runat="server" cssclass="Normal"></asp:label>
</div>
<div style="text-align: center;">
    <div class="verticalMiddle">
    <img src='<%=ResolveUrl("~/images/dnrt.gif")%>' border="0" /><asp:hyperlink id="lnkActivate"
                    runat="server" cssclass="CommandButton"></asp:hyperlink>
    <img src='<%=ResolveUrl("~/images/dnrt.gif")%>' border="0" style="margin-left:10px;" /><a class="CommandButton"
                    href="<%=ModulePath%>EULA.txt" target="_blank">
                    <asp:label id="Label1" runat="server" resourcekey="EULA"></asp:label>
    <img src='<%=ResolveUrl("~/images/dnrt.gif")%>' border="0" style="margin-left:10px;" /><a class="CommandButton"
                    href="http://www.bizmodules.net/tabid/111/Default.aspx" target="_blank">
                    <asp:label id="Label2" runat="server" resourcekey="UserGuide"></asp:label>
    <img src='<%=ResolveUrl("~/images/dnrt.gif")%>' border="0" style="margin-left:10px;" /><a class="CommandButton"
                    href="http://www.bizmodules.net/tabid/55/Default.aspx" target="_blank">
                    <asp:label id="Label3" runat="server" resourcekey="Support"></asp:label>
    </div>
</div>
