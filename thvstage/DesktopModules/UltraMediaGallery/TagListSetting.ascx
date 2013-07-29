<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TagListSetting.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.TagListSetting" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="../../controls/LabelControl.ascx" %>
<div class="UMGSection" style="width:600px;">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader">
            <asp:Label ID="Label6" runat="server" resourcekey="ControlTitle_modulesettings.Text"
                CssClass="SubHead">
            </asp:Label></td>
    </tr>
    <tr>
        <td>
            <table cellpadding="3" width="100%">
                    <tr>
                        <td class="SubHead"  width="130">
                            <asp:Label ID="plDataSource" runat="server" resourcekey="plDataSource">
                            </asp:Label>:
                        </td>
                        <td>
                            <asp:DropDownList ID="cboModuleTabId" runat="server" CssClass="NormalTextBox">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SubHead">
                        <asp:Label ID="plListType" runat="server" resourcekey="plListType">
                            </asp:Label>:
                        </td>
                        <td class="Normal">
                        <asp:RadioButton ID="rdoArticles" GroupName="ListType" runat="server" resourcekey="MostPopular" Checked="true"/>
                        <asp:RadioButton ID="rdoCreatedByDate" GroupName="ListType" runat="server" resourcekey="Latest"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="SubHead">
                            <asp:Label ID="plMaxResults" runat="server" resourcekey="plMaxResults">
                            </asp:Label>:</td>
                        <td>
                            <asp:DropDownList ID="cboMaxResults" Width="100" runat="server" CssClass="Normal">
                                <asp:ListItem Value="0"></asp:ListItem>
                                <asp:ListItem Value="1"></asp:ListItem>
                                <asp:ListItem Value="2"></asp:ListItem>
                                <asp:ListItem Value="5"></asp:ListItem>
                                <asp:ListItem Value="10"></asp:ListItem>
                                <asp:ListItem Value="25"></asp:ListItem>
                                <asp:ListItem Value="50"></asp:ListItem>
                                <asp:ListItem Value="75"></asp:ListItem>
                                <asp:ListItem Value="100"></asp:ListItem>
                                <asp:ListItem Value="200"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SubHead">
                            <dnn:Label ID="plBodyTemplate" runat="server" Suffix=":">
                            </dnn:Label></td>
                        <td class="Normal">
                            <asp:TextBox ID="txtBodyTemplate" runat="server" Rows="6" TextMode="MultiLine" MaxLength="50"
                                Width="300" CssClass="NormalTextBox"></asp:TextBox></td>
                    </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SectionFooter" align="center">
            <asp:Button class="CommandButton" ID="btnUpdate" runat="server" resourcekey="cmdUpdate"
                ></asp:Button>&nbsp;
            <asp:Button class="CommandButton" ID="btnCancel" runat="server" resourcekey="cmdCancel"
                CausesValidation="False" Text="Cancel"></asp:Button>
        </td>
    </tr>
</table>
</div>
