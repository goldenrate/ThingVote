<%@ Control Language="vb" AutoEventWireup="false" Codebehind="DynamicRoleEdit.ascx.vb" Inherits="DataSprings.DNN.Modules.DynamicLogin.DynamicRoleEdit" %>
<%@ Register TagPrefix="Portal" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<asp:UpdatePanel ID="UpdatePanelDynamicRoleEdit" runat="server">
 <ContentTemplate>

<TABLE id="tableRules" cellSpacing="2" cellPadding="2" width="100%" border="0">
<TR>
				<TD align="left">
					<asp:Literal id="litDESC" runat="server"></asp:Literal></TD>
			</TR>
	<TR>
		<TD valign="top" align="center">
			<asp:datagrid id="grdRules" BorderStyle="None" runat="server" Border="0" CellPadding="4" Width="100%"
				AutoGenerateColumns="False" EnableViewState="False" summary="Rules Design Table" BorderWidth="0px"
				GridLines="None">
				<Columns>
				<asp:BoundColumn Visible="False" DataField="ItemID" ReadOnly="True"></asp:BoundColumn>
							<asp:TemplateColumn>
					
					<ItemTemplate>
								<asp:imagebutton id="imgEdit" runat="server" AlternateText="Edit" resourceKey="dgedittext.Text" CommandName="Edit"
									ImageUrl="~/images/edit.gif"></asp:imagebutton>
							</ItemTemplate>
</asp:TemplateColumn>
					<asp:BoundColumn DataField="RoleName" HeaderText="RoleName">
						<HeaderStyle CssClass="NormalBold"></HeaderStyle>
						<ItemStyle CssClass="Normal"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="Url" HeaderText="Url">
						<HeaderStyle CssClass="NormalBold"></HeaderStyle>
						<ItemStyle CssClass="Normal"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="Priority" HeaderText="Priority">
						<HeaderStyle CssClass="NormalBold"></HeaderStyle>
						<ItemStyle CssClass="Normal"></ItemStyle>
					</asp:BoundColumn>
					
<asp:TemplateColumn>
					<ItemTemplate>

								<asp:Literal id="litMessage" runat="server" Text='<%#Server.HTMLDecode(DataBinder.Eval(Container, "DataItem.Message")) %>'></asp:literal>
					</ItemTemplate>
</asp:TemplateColumn>
	<asp:TemplateColumn>
					
					<ItemTemplate>
								<asp:imagebutton id="imgDelete" runat="server" AlternateText="Delete" resourceKey="dgdeletetext.Text" CommandName="Delete"
									ImageUrl="~/images/delete.gif"></asp:imagebutton>
							</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>

			</asp:datagrid></TD>
	</TR>
	
</TABLE>
<TABLE id="tableRulesEdit" cellSpacing="2" cellPadding="2" width="100%" border="0">
	<TR>
		<TD valign="top" class="SubHead"><dnn:label id="plRole" runat="server" controlname="ddlUser" suffix=":"></dnn:label></TD>
		<TD valign="top">
			<asp:dropdownlist id="cboRoles" runat="server" cssclass="NormalTextBox" datavaluefield="RoleID" datatextfield="RoleName"
				width="200"></asp:dropdownlist>
			</TD>
	</TR>
	<TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plUrl" runat="server" suffix=":" controlname="teUserMessage"></dnn:label></TD>
		<TD vAlign="top"><portal:url id="ctlURL" runat="server" width="250" shownewwindow="False" showtrack="False" ShowFiles="False" showlog="false" /></TD>
	</TR>
	<TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plPriority" runat="server" suffix=":" controlname="cbSendNotification"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtPriority" runat="server" CssClass="NormalTextBox" Width="100px">0</asp:TextBox>
			<asp:RequiredFieldValidator id="reqValidatorPriority" ValidationGroup="RoleRules" runat="server" resourceKey="reqValidatorPriority" ControlToValidate="txtPriority"
				Display="Dynamic" CssClass="NormalRed"></asp:RequiredFieldValidator>
			<asp:RangeValidator id="rangeValidatorPriority" ValidationGroup="RoleRules" resourceKey="rangeValidatorPriority" runat="server"
				CssClass="NormalRed" Display="Dynamic" ControlToValidate="txtPriority" MaximumValue="999" MinimumValue="0"
				Type="Integer"></asp:RangeValidator></TD>
	</TR>
	<TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plUserMessage" suffix=":" controlname="teUserMessage" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<dnn:texteditor id="teUserMessage" runat="server" width="400" height="400"></dnn:texteditor></TD>
	</TR>
	<TR>
		<TD vAlign="top" align="center" colspan="2">
			<asp:linkbutton id="cmdUpdate" CssClass="CommandButton"  ValidationGroup="RoleRules" runat="server" BorderStyle="None" resourcekey="cmdUpdate"></asp:linkbutton>&nbsp;&nbsp;
			</TD>
	</TR>
</TABLE>
</ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanelDynamicRoleEdit"> 
            <ProgressTemplate> 

                     </ProgressTemplate> 
        </asp:UpdateProgress> 

