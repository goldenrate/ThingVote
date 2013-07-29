<%@ Control Language="vb" AutoEventWireup="false" Codebehind="DynamicLoginEdit.ascx.vb" Inherits="DataSprings.DNN.Modules.DynamicLogin.DynamicLoginEdit" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<asp:UpdatePanel ID="UpdatePanelLoginEdit" runat="server">
 <ContentTemplate>
<TABLE id="tableRulesGrid" cellSpacing="2" cellPadding="2" width="100%" border="0">
<TR>
				<TD align="left">
					<asp:Literal id="litDESC" runat="server"></asp:Literal></TD>
			</TR>

	<TR>
		<TD vAlign="top">
			<asp:Label id="lblSearch" resourceKey="lblSearch" runat="server" CssClass="SubHead"></asp:Label>&nbsp;
			<asp:TextBox id="txtSearch" Width="200px" runat="server" CssClass="NormalTextBox"></asp:TextBox>&nbsp;
			<asp:LinkButton id="cmdSearch" resourceKey="cmdSearch" runat="server" CausesValidation="False" CssClass="CommandButton"></asp:LinkButton></TD>
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

					<asp:BoundColumn DataField="FirstName" HeaderText="FirstName">
						<HeaderStyle CssClass="NormalBold"></HeaderStyle>
						<ItemStyle CssClass="Normal"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="LastName" HeaderText="LastName">
						<HeaderStyle CssClass="NormalBold"></HeaderStyle>
						<ItemStyle CssClass="Normal"></ItemStyle>
					</asp:BoundColumn>
					<asp:BoundColumn DataField="UserMessage" HeaderText="UserMessage" Visible="False">
						<HeaderStyle CssClass="NormalBold"></HeaderStyle>
						<ItemStyle CssClass="Normal"></ItemStyle>
					</asp:BoundColumn>
					<asp:TemplateColumn HeaderText="Send Notification">
						<HeaderStyle HorizontalAlign="Center" CssClass="NormalBold"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center" CssClass="Normal"></ItemStyle>
						<ItemTemplate>
							<asp:Image Runat="server" ID="imgApproved" ImageUrl="~/images/checked.gif" Visible='<%# DataBinder.Eval(Container.DataItem,"SendNotification")="true" %>'/>
							<asp:Image Runat="server" ID="imgNotApproved" ImageUrl="~/images/unchecked.gif" Visible='<%# DataBinder.Eval(Container.DataItem,"SendNotification")="false" %>'/>
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

<TABLE id="tableRules" cellSpacing="2" cellPadding="2" width="100%" border="0">
	<TR>
		<TD valign="top" class="SubHead"><dnn:label id="plUser" runat="server" controlname="ddlUser" suffix=":"></dnn:label></TD>
		<TD valign="top">

                        <asp:TextBox id="txtUserName" Width="200px" runat="server" CssClass="NormalTextBox"></asp:TextBox>
                       	</TD>
	</TR>
	<TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plUserMessage" runat="server" suffix=":" controlname="teUserMessage"></dnn:label></TD>
		<TD vAlign="top"><dnn:texteditor id="teUserMessage" runat="server" width="400" height="400"></dnn:texteditor>
			</TD>
	</TR>
	<TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plSendNoification" runat="server" suffix=":" controlname="cbSendNotification"></dnn:label></TD>
		<TD vAlign="top">
			<asp:CheckBox id="cbSendNotification" runat="server" CssClass="NormalTextBox"></asp:CheckBox></TD>
	</TR>
	<TR>
		<TD vAlign="top" align="center" colspan="2">
			<asp:linkbutton id="cmdUpdate" CssClass="CommandButton" runat="server" BorderStyle="None" resourcekey="cmdUpdate"></asp:linkbutton>&nbsp;&nbsp;
			</TD>
	</TR>
</TABLE>


</ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanelLoginEdit"> 
            <ProgressTemplate> 

                     </ProgressTemplate> 
        </asp:UpdateProgress> 
