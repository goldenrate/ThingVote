<%@ Control Language="vb" AutoEventWireup="false" Codebehind="AmazonS3.ascx.vb" Inherits="BizModules.UltraPhotoGallery.AmazonS3"
    EnableViewState="true" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table class="Wizard" width="100%" border="0">
    <tr>
        <td class="WizardHeader">
            <font class="Head">
                <asp:Label ID="lblTitle" resourcekey="Step" runat="server"></asp:Label></font>
            <font class="Head">
                <%=Title%>
            </font>
        </td>
    </tr>
    <tr>
        <td class="WizardBody">
            <asp:Panel ID="pnlAccessKey" runat="server" Visible="True">
                <table class="WizardText" id="Table1" width="100%" border="0">
                    <tr>
                        <td class="Normal" colspan="2" height="70"></td>
                    </tr>
                    <tr>
                        <td class="SubHead" width="200">
                            <dnn:Label ID="plAccessKeyId" runat="server" Suffix=":"></dnn:Label>
                        </td>
                        <td class="Normal">
                            <asp:TextBox ID="txtAccessKeyId" runat="server" Width="300" CssClass="NormalTextBox"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="SubHead" width="200">
                            <dnn:Label ID="plSecretAccessKey" runat="server" Suffix=":"></dnn:Label>
                        </td>
                        <td class="Normal">
                            <asp:TextBox ID="txtSecretAccessKey" runat="server" Width="300" CssClass="NormalTextBox"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="Normal" colspan="2" height="70"></td>
                    </tr>
                    <tr>
                        <td class="Normal" colspan="2">
                            <asp:Label ID="lblInstructions" runat="server" CssClass="NormalRed" resourcekey="Instructions"></asp:Label></td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="pnlBucket" runat="server" Visible="False">
                <table id="Table2" class="WizardText" width="100%" border="0">
                    <tbody>
                        <tr>
                            <td class="SubHead" width="200">
                                <dnn:Label ID="plBucket" runat="server" Suffix=":"></dnn:Label>
                            </td>
                            <td class="Normal">
                                <asp:DropDownList ID="cboBuckets" Width="200" runat="server">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td class="SubHead" width="200">
                                <dnn:Label ID="plAddBucket" runat="server" Suffix=":"></dnn:Label>
                            </td>
                            <td class="Normal">
                                <asp:TextBox ID="txtBucket" runat="server" CssClass="NormalTextBox" Width="200"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                            <asp:Button ID="btnAdd" runat="server" resourcekey="Add"></asp:Button>&nbsp;<asp:Button ID="btnRemove" runat="server" resourcekey="Remove"></asp:Button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </asp:Panel>
            <asp:Panel ID="pnlBatchQuantity" runat="server" Visible="False">
                <table class="WizardText" id="Table3" width="100%" border="0">
                    <tr>
                        <td class="SubHead" width="200">
                            <dnn:Label ID="plBatchQuantity" runat="server" Suffix=":"></dnn:Label>
                        </td>
                        <td class="Normal">
                            <asp:TextBox ID="txtBatchQuantity" runat="server" Width="200" CssClass="NormalTextBox"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="SubHead" width="200">
                            <dnn:Label ID="plShortUrl" runat="server" Suffix=":"></dnn:Label>
                        </td>
                        <td class="Normal">
                            <asp:Checkbox ID="chkShortUrl" runat="server" CssClass="NormalTextBox" resourcekey="Yes"></asp:Checkbox></td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="pnlOperationTime" runat="server" Visible="False">
                <asp:Label ID="lblScheduler" runat="server" class="WizardText"></asp:Label>
            </asp:Panel>
            <asp:Label ID="lblMessage" runat="server" CssClass="NormalRed"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="WizardFooter" align="right">
            <asp:Button ID="btnNextStep" resourcekey="NextStep" runat="server" Text="Button"></asp:Button>&nbsp;
            <asp:Button ID="btnFinish" resourcekey="Finish" runat="server" Text="Button" Visible="False">
            </asp:Button></td>
    </tr>
</table>
