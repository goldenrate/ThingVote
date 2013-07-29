<%@ Control Language="vb" AutoEventWireup="false" Codebehind="ManageLoginTemplate.ascx.vb" Inherits="DataSprings.DNN.Modules.DynamicLogin.ManageLoginTemplate" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/labelControl.ascx" %>
<asp:UpdatePanel ID="UpdatePanelDynamicManageTemplate" runat="server">
 <ContentTemplate>
	<TABLE id="tblSetup" runat="server" cellSpacing="1" cellPadding="2" border="0">
		
<TR>
				<TD><asp:label id="lblTemplateHeading" CssClass="Subhead" runat="server"></asp:label></TD>
			</TR>
<TR>
				<TD align="left">
					<asp:Literal id="litDESC" runat="server"></asp:Literal></TD>
			</TR>
			<TR>
				<TD align="left">
					<asp:Label id="lblError" runat="server" ForeColor="Red" Font-Italic="True"></asp:Label></TD>
			</TR>
			<TR runat="server" id="rowLanguage">
				<TD align="left"><TABLE width="100%"><TR><TD>
					<asp:Label id="lblLanguage" ResourceKey="lblLanguage" runat="server" CssClass="NormalBold"></asp:Label></TD><TD>
					<asp:dropdownlist id="cboLanguage" AutoPostBack="True" runat="server" width="200" cssclass="NormalTextBox"></asp:dropdownlist></TD><TD></TD><TD><asp:linkbutton id="lnkRestoreDefaultTemplate" runat="server"></asp:linkbutton></TD></TR></TABLE>
</TD>
			</TR>
			<TR>
				<TD align="left">
					<asp:label id="lblField" runat="server" CssClass="Subhead">Fields</asp:label></TD>
			</TR>
			<TR>
				<TD align="left">
					<asp:Label id="lblFields" runat="server" CssClass="Normal"></asp:Label></TD>
			</TR>
			<TR>
				<TD align="left"><dnn:texteditor id="txtTempalte" runat="server" width="620" height="500"></dnn:texteditor></TD>
			</TR>
			<TR>
				<TD align="center"><asp:linkbutton id="lnkSave" resourcekey="SaveTemplate" runat="server">Save</asp:linkbutton>&nbsp;
					</TD>
			</TR>
		</TABLE>

</ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanelDynamicManageTemplate"> 
            <ProgressTemplate> 

                     </ProgressTemplate> 
        </asp:UpdateProgress> 

