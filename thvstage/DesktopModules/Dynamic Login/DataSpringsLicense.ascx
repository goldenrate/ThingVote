<%@ Control Inherits="DataSprings.DNN.Modules.DynamicLogin.DataSpringsLicense"  Codebehind="DataSpringsLicense.ascx.vb" language="vb" AutoEventWireup="false" Explicit="True" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<asp:LinkButton ID="lnkExit" runat="server"></asp:LinkButton>
<asp:Literal ID="litHeader" runat="server"></asp:Literal>
<script language="javascript" type="text/javascript">
    function ValidateTandCs(source, args)
    {

        args.IsValid =document.getElementById('<%= chkConfirm.ClientID %>').checked;
    }
</script>

<table width="100%" border="0">
	<tr>
		<td align="left" class="Normal">
			&nbsp;<table>
                <tr>
                    <td valign="top" width="260" nowrap><dnn:label id="lblVersion" runat="server" suffix=":">
                    </dnn:label>
                    </td>
                    <td>
                        <asp:Label ID="lblVersionReadOnly" runat="server"></asp:Label></td>
                </tr>
 <tr>
                    <td valign="top"><dnn:label id="lblProduct" runat="server" suffix=":">
                    </dnn:label>
                    </td>
                    <td>
                        <asp:Label ID="lblProductReadOnly" runat="server"></asp:Label></td>
                </tr>
 <tr>
                    <td valign="top"><dnn:label id="lblProductVariant" runat="server" suffix=":">
                    </dnn:label>
                    </td>
                    <td>
                        <asp:Label ID="lblProductVariantReadOnly" runat="server"></asp:Label></td>
                </tr>



               <tr>
                    <td valign="top"><dnn:label id="lblProductVersion" runat="server" suffix=":">
                    </dnn:label>
                    </td>
                    <td>
                        <asp:Label ID="lblProductVersionReadOnly" runat="server"></asp:Label></td>
                </tr>


                <tr>

                    <td valign="top"><dnn:label id="lblMachineyKey" runat="server" suffix=":">
                    </dnn:label></td>
                    <td>
                        <asp:Label ID="lblMachineKeyReadOnly" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td style="height: 21px" valign="top"><dnn:label id="lblHostTitle" runat="server" suffix=":">
                    </dnn:label></td>
                    <td style="height: 21px">
                        <asp:Label ID="lblHostTitleReadOnly" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td style="height: 21px" valign="top"><dnn:label id="lblPortals" runat="server" suffix=":">
                    </dnn:label></td>
                    <td style="height: 21px">
                        <asp:Label ID="lblPortalsReadOnly" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td valign="top"><dnn:label id="lblIPAddress" runat="server" suffix=":">
                    </dnn:label></td>
                    <td>
                        <asp:Label ID="lblIPAddressReadOnly" runat="server"></asp:Label></td>
                </tr>
				<tr>
					<td valign="top"><dnn:label id="lblContactName" runat="server" suffix=":"></dnn:label>
					</td>
					<td>
                        <asp:TextBox ID="txtContactName" runat="server" Width="260px"></asp:TextBox>  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"  ControlToValidate ="txtContactName"></asp:RequiredFieldValidator></td>
				</tr>
				<tr>
					<td valign="top"><dnn:label id="lblContactEmail" runat="server" suffix=":"></dnn:label>
					</td>
					<td>
                        <asp:TextBox ID="txtContactEmail" runat="server" Width="260px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"  ControlToValidate ="txtContactEmail"></asp:RequiredFieldValidator>
                          </td>
				</tr>
                        <tr>
					<td valign="top"><dnn:label id="lblCustomerNAme" runat="server" suffix=":"></dnn:label>
					</td>
					<td>
                                <asp:TextBox ID="txtCustomerName" runat="server" Width="260px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"  ControlToValidate ="txtCustomerName"></asp:RequiredFieldValidator>
                                     </td>
				</tr>

				<tr>
					<td valign="top"><dnn:label id="lblInvoiceID" runat="server" suffix=":"></dnn:label>
					</td>
					<td>
                        <asp:TextBox ID="txtInvoiceID" runat="server" Width="260px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"  ControlToValidate ="txtInvoiceID"></asp:RequiredFieldValidator>
                         </td>
				</tr>
                <tr>
                    <td valign="top">
                    </td>
                    <td>
                        <asp:CheckBox ID="chkConfirm" runat="server" /> BY CHECKING THE BOX INDICATING I AGREE TO THE TERMS AND CONDITIONS OF THIS LICENSE AGREEMENT

<asp:CustomValidator ID="valTandCs" ClientValidationFunction="ValidateTandCs" runat="server" ErrorMessage="Please accept Terms and Conditions before submitting."></asp:CustomValidator>
</td>
                   </tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="1" style="height: 15px" align="center">
                       <asp:literal id="litStatus" runat="server"></asp:literal>
			<asp:LinkButton ID="lnkRegisterLicense" resourcekey="RegisterLicense" runat="server"></asp:LinkButton>&nbsp;&nbsp;
            &nbsp;
            <asp:LinkButton ID="lnkExit2" resourcekey="Exit"  CausesValidation="False" runat="server"></asp:LinkButton></td>
	</tr>
</table>
