<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Control Language="vb" AutoEventWireup="false" Codebehind="DynamicIPRestrictions.ascx.vb" Inherits="DataSprings.DNN.Modules.DynamicLogin.DynamicIPRestrictions" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<asp:UpdatePanel ID="UpdatePanelDynamicIPRestrictions" runat="server">
 <ContentTemplate>
<dnn:SectionHead ID="dshRestrictIP" runat="server" ResourceKey="RestrictIP" CssClass="Head" Section="tblSetupIP" IncludeRule="True" IsExpanded="True"></dnn:SectionHead>
	<TABLE id="tblSetupIP" cellSpacing="1" cellPadding="1" width="100%" border="0" Runat="Server">
<TR>
				<TD align="left">
					<asp:Literal id="litDESC" runat="server"></asp:Literal></TD>
			</TR>
		<TR>
			<TD align="left"><asp:datagrid id="dgRestrictedIP" runat="server" CssClass="HeaderStyle" AutoGenerateColumns="False"
					AllowSorting="True" ShowFooter="True" Width="592px">
					<FooterStyle CssClass="HeaderrowStyle"></FooterStyle>
					<AlternatingItemStyle CssClass="HeaderRowAlternate"></AlternatingItemStyle>
					<ItemStyle CssClass="headerRowStyle"></ItemStyle>
					<HeaderStyle CssClass="HeaderRowsTyle"></HeaderStyle>
					<Columns>
						<asp:BoundColumn Visible="False" DataField="DynamicLoginIPRestrictionID" ReadOnly="True"></asp:BoundColumn>
						<asp:TemplateColumn SortExpression="IPAddress" HeaderText="IPAddress">
							<ItemTemplate>
								<asp:Label id=Label1 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.IPAddress") %>'>
								</asp:Label>
							</ItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtAddIPAddress" runat="server" CssClass="normaltextbox" Width="100%"></asp:TextBox>
							</FooterTemplate>
							<EditItemTemplate>
								<asp:TextBox id="txtIPAddress" runat="server" CssClass="normaltextbox" Text='<%# DataBinder.Eval(Container, "DataItem.IPAddress") %>'>
								</asp:TextBox>
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn SortExpression="RestrictionDesc" HeaderText="Description">
							<ItemTemplate>
								<asp:Label id=lblRestrictionDesc runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.RestrictionDesc") %>'>
								</asp:Label>
							</ItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtAddRestrictionDesc" Width="100%" CssClass="normaltextbox" runat="server"></asp:TextBox>
							</FooterTemplate>
							<EditItemTemplate>
								<asp:TextBox id="txtEditRestrictionDesc" Width="100%" CssClass="normaltextbox" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.RestrictionDesc") %>' TextMode="MultiLine" Height="60px">
								</asp:TextBox>
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn SortExpression="AllPortals" HeaderText="AllPortals">
							<ItemTemplate>
								<asp:Label runat="server" Text='<%#GetAllPortals(DataBinder.Eval(Container, "DataItem.AllPortals")) %>' ID="Label3" >
								</asp:Label>
							</ItemTemplate>
							<FooterTemplate>
								<asp:CheckBox ID="chkAddAllInstances" Runat="server"></asp:CheckBox>
							</FooterTemplate>
							<EditItemTemplate>
								<asp:CheckBox ID="chkEditAllInstances" Runat="server"></asp:CheckBox>
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:imagebutton id="imgDelete" runat="server" AlternateText="Delete" ResourceKey="dgdeletetext.Text"
									CommandName="Delete" ImageUrl="~/images/delete.gif"></asp:imagebutton>
							</ItemTemplate>
							<FooterTemplate>
								<asp:imagebutton id="imgAdd" runat="server" AlternateText="Add" ResourceKey="dgaddtext.Text" CommandName="AddType"
									ImageUrl="~/images/add.gif"></asp:imagebutton>
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:imagebutton id="imgEdit" runat="server" AlternateText="Edit" resourceKey="dgedittext.Text" CommandName="Edit"
									ImageUrl="~/images/edit.gif"></asp:imagebutton>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:LinkButton runat="server" resourcekey="dgupdatetext" CommandName="Update" ID="Linkbutton1"
									NAME="Linkbutton1">update</asp:LinkButton>&nbsp;
								<asp:LinkButton runat="server" Text="Cancel" resourcekey="dgcanceltext" CommandName="Cancel" CausesValidation="false"
									ID="Linkbutton2" NAME="Linkbutton2"></asp:LinkButton>
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn Visible="False" DataField="ModuleID" ReadOnly="True"></asp:BoundColumn>
					</Columns>
				</asp:datagrid>
</TD>
		</TR>
	</TABLE>

<dnn:SectionHead ID="dshBySQL" runat="server" ResourceKey="RestrictBySQL" CssClass="Head" Section="tblSetupSQL" IncludeRule="True" IsExpanded="True"></dnn:SectionHead>
	<TABLE id="tblSetupSQL" cellSpacing="1" cellPadding="1" width="100%" border="0" runat="Server">
<TR><TD align="left" colspan="2">
	<asp:Literal id="litSQLDESC" runat="server"></asp:Literal></TD>
</TR>

        <TR>
	<TD class="SubHead" vAlign="top">
		<dnn:label id="plSQLValidation" controlname="chkSQLValidation" suffix=":" runat="server"></dnn:label></TD>
	<TD vAlign="top">
	    <asp:CheckBox id="chkEnableSQLValidation" runat="server"></asp:CheckBox></TD>
	</TR>
<TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plSQLTemplate" controlname="txtSQLTemplate" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtSQLTemplate" runat="server" CssClass="NormalTextBox" Width="400px" TextMode="MultiLine" Rows="30"></asp:TextBox></TD>
	</TR>

<TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plValidationMessage" controlname="txtValidationMessage" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtValidationMessage" runat="server" CssClass="NormalTextBox" Width="400px" TextMode="MultiLine" Rows="10">*</asp:TextBox>
</TD>
	</TR>
</TABLE>
<P align="center"><asp:linkbutton id="lnkSave" runat="server" ResourceKey="Save">Save</asp:linkbutton>&nbsp;
					</p>

</ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanelDynamicIPRestrictions"> 
            <ProgressTemplate> 

                     </ProgressTemplate> 
        </asp:UpdateProgress> 

