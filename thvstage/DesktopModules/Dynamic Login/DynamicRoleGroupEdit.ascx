<%@ Control Language="vb" AutoEventWireup="false" Codebehind="DynamicRoleGroupEdit.ascx.vb" Inherits="DataSprings.DNN.Modules.DynamicLogin.DynamicRoleGroupEdit" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="Portal" TagName="URL" Src="~/controls/URLControl.ascx" %>
<asp:UpdatePanel ID="UpdatePanelDynamicRoleGroup" runat="server">
 <ContentTemplate>

<TABLE id="tableRulesGrid" cellSpacing="2" cellPadding="2" width="100%" border="0"><TR>
				<TD align="left">
					<asp:Literal id="litDESC" runat="server"></asp:Literal></TD>
			</TR>

	<TR>
		<TD vAlign="top" align="center">
			<asp:datagrid id="grdGroupRules" GridLines="None" BorderWidth="0px" summary="Rules Design Table"
				EnableViewState="False" AutoGenerateColumns="False" Width="100%" CellPadding="4" Border="0"
				runat="server" BorderStyle="None">
				<Columns>
<asp:BoundColumn Visible="False" DataField="ItemID" ReadOnly="True"></asp:BoundColumn>

				<asp:TemplateColumn>
					
					<ItemTemplate>
								<asp:imagebutton id="imgEdit" runat="server" AlternateText="Edit" resourceKey="dgedittext.Text" CommandName="Edit"
									ImageUrl="~/images/edit.gif"></asp:imagebutton>
							</ItemTemplate>
</asp:TemplateColumn>

					<asp:BoundColumn DataField="RoleGroupName" HeaderText="RoleGroupName">
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
					<asp:BoundColumn DataField="Message" HeaderText="Message">
						<HeaderStyle CssClass="NormalBold"></HeaderStyle>
						<ItemStyle CssClass="Normal"></ItemStyle>
					</asp:BoundColumn>
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

<TABLE id="tableRules" cellSpacing="2" cellPadding="2" width="100%" border="0">
	<TR>
		<TD class="SubHead" vAlign="top"><dnn:label id="plRoleGroup" suffix=":" controlname="ddlUser" runat="server"></dnn:label></TD>
		<TD vAlign="top"><asp:dropdownlist id="cboRolesGroup" runat="server" width="200" datatextfield="RoleGroupName" datavaluefield="RoleGroupID"
				cssclass="NormalTextBox"></asp:dropdownlist></TD>
	</TR>
	<TR>
		<TD class="SubHead" vAlign="top"><dnn:label id="plUrl" suffix=":" controlname="teUserMessage" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<portal:url id="ctlURL" runat="server" width="250" shownewwindow="False" showtrack="False" UrlType="F" showfiles="false" showlog="false"></portal:url></TD>
	</TR>
	<TR>
		<TD class="SubHead" vAlign="top"><dnn:label id="plPriority" suffix=":" controlname="cbSendNotification" runat="server"></dnn:label></TD>
		<TD vAlign="top"><asp:textbox id="txtPriority" runat="server" CssClass="NormalTextBox" Width="100px">0</asp:textbox><asp:requiredfieldvalidator id="reqValidatorPriority" runat="server" resourceKey="reqValidatorPriority" CssClass="NormalRed"
				Display="Dynamic" ControlToValidate="txtPriority"  ValidationGroup="RoleRules"></asp:requiredfieldvalidator><asp:rangevalidator id="rangeValidatorPriority" runat="server" resourceKey="rangeValidatorPriority"
				CssClass="NormalRed" Display="Dynamic"  ValidationGroup="RoleGroupRules" ControlToValidate="txtPriority" Type="Integer" MinimumValue="0" MaximumValue="999"></asp:rangevalidator></TD>
	</TR>
	<TR>
		<TD class="SubHead" vAlign="top"><dnn:label id="plUserMessage" suffix=":" controlname="teUserMessage" runat="server"></dnn:label></TD>
		<TD vAlign="top"><dnn:texteditor id="teUserMessage" runat="server" width="400" height="400"></dnn:texteditor></TD>
	</TR>
	<TR>
		<TD vAlign="top" align="center" colSpan="2"><asp:linkbutton id="cmdUpdate"  ValidationGroup="RoleGroupRules" runat="server" CssClass="CommandButton" resourcekey="cmdUpdate" BorderStyle="None"></asp:linkbutton>&nbsp;&nbsp;
			
			<asp:linkbutton id="cmdDelete" runat="server" CssClass="CommandButton" resourcekey="cmdDelete" BorderStyle="None"
				CausesValidation="False" Visible="False"></asp:linkbutton></TD>
	</TR>
</TABLE>

</ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanelDynamicRoleGroup"> 
            <ProgressTemplate> 

                     </ProgressTemplate> 
        </asp:UpdateProgress> 

