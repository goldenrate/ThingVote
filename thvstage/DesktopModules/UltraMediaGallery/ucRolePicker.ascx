<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Control Language="vb" AutoEventWireup="false" Codebehind="ucRolePicker.ascx.vb" Inherits="BizModules.UltraPhotoGallery.ucRolePicker" %>
<asp:datalist id="rptRoles" runat="server" RepeatColumns="3" RepeatDirection="horizontal" CellPadding="0" CellSpacintg="0">
	<ItemTemplate>
		<td class="Normal">
			<asp:CheckBox ID="chkPermission" Runat="server" Text='<%# Container.DataItem %>'>
			</asp:CheckBox>
		</td>
	</ItemTemplate>
</asp:datalist>
<asp:Panel ID="pnlUsers" runat="server">
<asp:Label ID="lblUsers" runat="server"></asp:Label>
<br />
<asp:TextBox ID="txtUsers" runat="server" Width="300px" CssClass="NormalTextBox"></asp:TextBox>
</asp:Panel>