<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Search.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.Search" %>
<table border="0">
	<tr>
		<td>
		<asp:label id="lblKeyword" resourcekey="Keyword" runat="server" cssClass="Normal"></asp:label>
		</td>
	</tr>
	<tr>
		<td nowrap>
		<asp:TextBox  id="txtKeyword" runat="server" Width="150" CssClass="NormalTextBox" autocomplete="off"></asp:TextBox>
			<asp:ImageButton ID="cmdSearch" runat="server" ImageUrl="~/images/view.gif" />
		</td>
	</tr>
</table>
