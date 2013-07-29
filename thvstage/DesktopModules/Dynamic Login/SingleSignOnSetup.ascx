<%@ Control Language="vb" AutoEventWireup="false" Codebehind="SingleSignOnSetup.ascx.vb" Inherits="DataSprings.DNN.Modules.DynamicLogin.SingleSignOnSetup" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/labelControl.ascx" %>
<asp:UpdatePanel ID="UpdatePanelDynamicSSO" runat="server">
 <ContentTemplate>

		<TABLE id="Table1" cellSpacing="1" cellPadding="2" border="0">
			<TR>
				<TD align="left">
					<asp:Literal id="litSSO" runat="server"></asp:Literal></TD>
			</TR>
			<TR>
				<TD align="left">
					<asp:Label id="lblError" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label></TD>
			</TR>
			<TR>
				<TD align="left">
					<TABLE id="Table2" cellSpacing="1" cellPadding="1" width="600" border="0">
						<TR>
							<TD>
								<dnn:label id="lblEnableSingleSignOn" runat="server" suffix=":" controlname="chkEnableEmailLogin"></dnn:label></TD>
							<TD>
								<asp:CheckBox id="chkEnableSSO" runat="server"></asp:CheckBox></TD>
							<TD></TD>
						</TR>
						<TR>
							<TD>
								<dnn:label id="lblMasterPortal" runat="server" suffix=":" controlname="chkOverrideRedirection"></dnn:label></TD>
							<TD>
								<asp:dropdownlist id="cboMasterPortal" runat="server" width="200" datatextfield="RoleGroupName" datavaluefield="RoleGroupID"
									cssclass="NormalTextBox"></asp:dropdownlist></TD>
							<TD></TD>
						</TR>
						<TR>
							<TD>
								<dnn:label id="lblUserExistsOnChild" runat="server" suffix=":" controlname="chkEnableEmailLogin"></dnn:label></TD>
							<TD>
								<asp:CheckBox id="chkAddUserFromChildtoParent" runat="server"></asp:CheckBox></TD>
							<TD></TD>
						</TR>
                                                <TR>
							<TD>
								<dnn:label id="lblSyncUserRoles" runat="server" suffix=":" controlname="chkSyncUserRoles"></dnn:label></TD>
							<TD>
								<asp:CheckBox id="chkSyncUserRoles" runat="server"></asp:CheckBox></TD>
							<TD></TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
			<TR>
				<TD align="center"><asp:linkbutton id="lnkSave" runat="server" CausesValidation="False">Save</asp:linkbutton>&nbsp;
					</TD>
			</TR>
		</TABLE>

</ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanelDynamicSSO"> 
            <ProgressTemplate> 

                     </ProgressTemplate> 
        </asp:UpdateProgress> 

