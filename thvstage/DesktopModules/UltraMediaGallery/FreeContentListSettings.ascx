<%@ Control Language="vb" AutoEventWireup="false" Codebehind="FreeContentListSettings.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.FreeContentListSettings" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>

<div class="UMGSection" style="width:600px;">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader">
            <asp:Label ID="Label6" runat="server" resourcekey="ControlTitle_modulesettings.Text"
                CssClass="SubHead">
            </asp:Label></td>
    </tr>
    <tr>
        <td class="Normal">
            <table cellpadding="3" width="100%" class="Normal">
                <tr>
                    <td width="130">
                        <asp:Label ID="Label1" runat="server" resourcekey="GeneralOptions"></asp:Label>
                    </td>
                    <td>
                    <asp:Label ID="Label2" runat="server" resourcekey="Retrieve"></asp:Label>
                        <asp:DropDownList ID="cboModuleTabId" runat="server" AutoPostBack="true" CssClass="NormalTextBox">
                        </asp:DropDownList>.
                        <p>
                        <table class="Normal">
                        <tr><td><asp:Label ID="Label3" runat="server" resourcekey="Show"></asp:Label></td><td>
                        <asp:DropDownList ID="cboSortBy" runat="server" CssClass="NormalTextBox" AutoPostBack="true">
                                <asp:ListItem Value="Latest"></asp:ListItem>
                                <asp:ListItem Value="HighestRated"></asp:ListItem>
                                <asp:ListItem Value="Random"></asp:ListItem>
                                <asp:ListItem Value="SpeceficUser's"></asp:ListItem>
                            </asp:DropDownList>
							<!--
								put this line to the above drop down list if you want to list latest photos with gps coordinates
                                <asp:ListItem Value=" and gpslatitude <> 0 order by createddate desc"></asp:ListItem>
							-->
                            <asp:DropDownList ID="cboSortBy2" runat="server" Visible="false" CssClass="NormalTextBox">
                                <asp:ListItem Value="Latest"></asp:ListItem>
                                <asp:ListItem Value="Random"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="cboSortBy3" runat="server" Visible="false" CssClass="NormalTextBox">
                                <asp:ListItem Value="Latest"></asp:ListItem>
                                <asp:ListItem Value="Oldest"></asp:ListItem>
                            </asp:DropDownList>
                            </td><td>
                            <asp:DropDownList ID="cboContentType" runat="server" AutoPostBack="true" CssClass="NormalTextBox">
                                <asp:ListItem Value="Photos"></asp:ListItem>
                                <asp:ListItem Value="Medias"></asp:ListItem>
                                <asp:ListItem Value="Comments"></asp:ListItem>
                                <asp:ListItem Value="Albums"></asp:ListItem>
                            </asp:DropDownList>
                        </td><td nowrap>
                        <asp:Panel ID="pnlInAlbum" runat="server">
                            <asp:Label ID="Label4" runat="server" resourcekey="in"></asp:Label>
                            <asp:DropDownList ID="cboAlbums" runat="server" DataTextField="Title" DataValueField="ItemId" CssClass="NormalTextBox">
                            </asp:DropDownList>
                            </asp:Panel>
                        </td></tr>
                        </table>                            
                            
                            <asp:Panel ID="pnlUserKey" runat="server">
                            <asp:Label ID="Label14" runat="server" resourcekey="UserKey.Help" CssClass="Normal"></asp:Label>
                            <asp:TextBox ID="txtUserKey" runat="server" Width="60px" CssClass="NormalTextBox"></asp:TextBox>
                            </asp:Panel>

                            <p>
                            <asp:Label ID="Label5" runat="server" resourcekey="MaxResults"></asp:Label>
                                <asp:DropDownList ID="cboMaxResults" runat="server" CssClass="NormalTextBox">
                                    <asp:ListItem Text="1"></asp:ListItem>
                                    <asp:ListItem Text="2"></asp:ListItem>
                                    <asp:ListItem Text="3"></asp:ListItem>
                                    <asp:ListItem Text="4"></asp:ListItem>
                                    <asp:ListItem Text="5"></asp:ListItem>
                                    <asp:ListItem Text="7"></asp:ListItem>
                                    <asp:ListItem Text="10" selected="true"></asp:ListItem>
                                    <asp:ListItem Text="15"></asp:ListItem>
                                    <asp:ListItem Text="30"></asp:ListItem>
                                    <asp:ListItem Text="50"></asp:ListItem>
                                    <asp:ListItem Text="100"></asp:ListItem>
                                    <asp:ListItem Text="Unlimited"></asp:ListItem>
                                </asp:DropDownList>.
                        </p>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                    <asp:Label ID="Label7" runat="server" resourcekey="DisplayTemplates"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rdoCoreTemplates" runat="server" GroupName="DisplayTemplates"
                            resourcekey="CoreTemplates" AutoPostBack="True" Checked="True" />
                        <asp:RadioButton ID="rdoCustomTemplates" runat="server" GroupName="DisplayTemplates"
                            resourcekey="CustomTemplates" AutoPostBack="True" />
                        <p>
                        </p>
                        <asp:DropDownList ID="cboCoreTemplates" runat="server" Width="200" CssClass="NormalTextBox">
                        </asp:DropDownList>
                        <asp:Panel ID="pnlCustomTemplates" runat="server" Visible="false">
                            <table class="Normal">
                                <tr>
                                    <td>
                                    <asp:Label ID="Label8" runat="server" resourcekey="Header"></asp:Label>                                    
                                    </td>
                                    <td><asp:TextBox ID="txtHtmlHeader" runat="server" Rows="6" TextMode="MultiLine" MaxLength="50"
                                Width="350" CssClass="NormalTextBox"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    <asp:Label ID="Label9" runat="server" resourcekey="Body"></asp:Label>
                                    </td>
                                    <td><asp:TextBox ID="txtHtmlBody" runat="server" Rows="6" TextMode="MultiLine" MaxLength="50"
                                Width="350" CssClass="NormalTextBox"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    <asp:Label ID="Label10" runat="server" resourcekey="Footer"></asp:Label>
                                    </td>
                                    <td><asp:TextBox ID="txtHtmlFooter" runat="server" Rows="6" TextMode="MultiLine" MaxLength="50"
                                Width="350" CssClass="NormalTextBox"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    <asp:Label ID="Label11" runat="server" resourcekey="Separator"></asp:Label>
                                    </td>
                                    <td><asp:TextBox ID="txtHtmlSeparator" runat="server" Rows="3" TextMode="MultiLine" MaxLength="50"
                                Width="350" CssClass="NormalTextBox"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
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
