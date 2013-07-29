<%@ Control Language="vb" AutoEventWireup="false" Codebehind="ShoppingCartConfirm.ascx.vb" Inherits="BizModules.UltraPhotoGallery.ShoppingCartConfirm" %>
<TABLE id="Table1" cellSpacing="3" cellPadding="3" width="100%" align="center" border="0">
	<tr>
		<td width="48%"><asp:label id="lblTerms" resourcekey="Terms" runat="server" CssClass="Head"></asp:label>
			<hr SIZE="1">
		</td>
		<td vAlign="top"><asp:label id="lblCartDetail" resourcekey="CartDetail" runat="server" CssClass="Head"></asp:label>
			<HR SIZE="1">
		</td>
	</tr>
	<tr>
		<td valign="top">
			<asp:label id="lblTermsDetail" CssClass="Normal" runat="server"></asp:label></td>
		<td vAlign="top"><asp:datalist id="lstCartDetail" runat="server" Width="100%" CellPadding="3">
				<HeaderTemplate>
					<td class="CartItem_Header"><%=Localize("Thumbnail")%></td>
					<td class="CartItem_Header"><%=Localize("ItemDetail")%></td>
					<td class="CartItem_Header"><%=Localize("Price")%>(<%=BizModules.UltraPhotoGallery.HostSettingsController.GetHostSettings(PortalId, "Currency")%>)</td>
				</HeaderTemplate>
				<FooterTemplate>
					<td colspan="3" align="right" class="CartItem_Footer"><%=Localize("Total")%>:
						<%=Total%>
					</td>
				</FooterTemplate>
				<ItemTemplate>
					<td class="CartItem_Normal"><img src='<%# DataBinder.Eval(Container.DataItem,"Tn") %>'></td>
					<td class="CartItem_Normal"><span class="CartItem_ItemHeader"><%# DataBinder.Eval(Container.DataItem,"Title") %></span><br>
						<%# DataBinder.Eval(Container.DataItem,"Description") %>
					</td>
					<td class="CartItem_Normal" align="right"><%#GetDisplayPrice(Container.DataItem.PhotoId)%></td>
				</ItemTemplate>
				<AlternatingItemTemplate>
					<td class="CartItem_Alternating"><img src='<%# DataBinder.Eval(Container.DataItem,"Tn") %>'></td>
					<td class="CartItem_Alternating"><span class="CartItem_ItemHeader"><%# DataBinder.Eval(Container.DataItem,"Title") %></span><br>
						<%# DataBinder.Eval(Container.DataItem,"Description") %>
					</td>
					<td class="CartItem_Alternating" align="right"><%#GetDisplayPrice(Container.DataItem.DownloadId)%></td>
				</AlternatingItemTemplate>
			</asp:datalist>
			<p class="Normal" align="right">
				<asp:Label id="lblMessage" runat="server" CssClass="NormalRed"></asp:Label><asp:checkbox id="chkAgreeToTerms" resourcekey="AgreeToTerms" runat="server"></asp:checkbox></p>
			<p class="Normal" align="right"><asp:button id="cmdConfirm" resourcekey="ConfirmOrder" Runat="server" CssClass="CommandButton"></asp:button></p>
			<p><asp:label id="lblTips" resourcekey="Tips" runat="server" CssClass="SubHead"></asp:label>
				<hr SIZE="1">
				<asp:label id="lblTipsDetail" resourcekey="TipsDetail" runat="server" CssClass="Normal"></asp:label>
			<P></P>
			<p align="right"><asp:HyperLink id="lnkContinue" runat="server" resourcekey="ContinueShopping" class="CommandButton"></asp:HyperLink></p>
		</td>
	</tr>
</TABLE>
