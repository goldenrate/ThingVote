<%@ Control Language="vb" AutoEventWireup="false" Codebehind="PurchasedItems.ascx.vb" Inherits="BizModules.UltraPhotoGallery.PurchasedItems" %>
<asp:datagrid id="lstPurchasedItems" CellPadding="3" Width="100%" runat="server" AllowPaging="True"
	PageSize="10" AutoGenerateColumns="False" BorderWidth="0px" ShowFooter="True" GridLines=None >
	<ItemStyle CssClass="CartItem_Normal"></ItemStyle>
	<AlternatingItemStyle CssClass="CartItem_Alternating"></AlternatingItemStyle>
	<Columns>
		<asp:TemplateColumn HeaderText="DownloadName">
			<HeaderStyle CssClass="CartItem_Header"></HeaderStyle>
			<ItemTemplate>
				<a href='<%=ModulePath%>Download.aspx?DownloadId=<%# DataBinder.Eval(Container.DataItem,"ItemId") %>'><%# DataBinder.Eval(Container.DataItem,"ResOriginalName") %></a>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Size">
			<HeaderStyle CssClass="CartItem_Header"></HeaderStyle>
			<ItemTemplate>
				<%# FormatFileSize(DataBinder.Eval(Container.DataItem,"ResSize")) %>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="InvoiceNo">
			<HeaderStyle CssClass="CartItem_Header"></HeaderStyle>
			<ItemTemplate>
				<%# Container.DataItem.InvoiceNo(InvoicePrefix) %>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Price" ItemStyle-HorizontalAlign=Right >
			<HeaderStyle CssClass="CartItem_Header"></HeaderStyle>
			<ItemTemplate>
				<%# BizModules.UltraPhotoGallery.Utility.FormatMoney(Container.DataItem.ActualPrice, Container.DataItem.Currency, False) %>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="PurchaseDate">
			<HeaderStyle CssClass="CartItem_Header"></HeaderStyle>
			<ItemTemplate>
				<%# Container.DataItem.PaymentDate.ToShortDateString() %>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<PagerStyle HorizontalAlign="Center" CssClass="Pager" Mode="NumericPages"></PagerStyle>
</asp:datagrid>
