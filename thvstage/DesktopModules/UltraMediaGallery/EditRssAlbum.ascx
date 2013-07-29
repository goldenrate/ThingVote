<%@ Control Language="vb" AutoEventWireup="false" Codebehind="EditRssAlbum.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.EditRssAlbum" %>
<%@ Register TagPrefix="uc1" TagName="RolePicker" Src="ucRolePicker.ascx" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<UPG:Header ID="ctlHeader" runat="server" />
<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            <%=Localize("Edit") %> "<asp:Label ID="lblTitle" runat="server"></asp:Label>" <span class="Script2">(ID=<asp:Label
                ID="lblAlbumId" runat="server"></asp:Label>)</span>
        </td>
    </tr>
    <tr>
        <td>
            <table border="0" cellpadding="5" width="100%" class="Normal">
                <tr>
                    <td style="vertical-align: top;">
                        <div class="Group1" style="margin-bottom: 10px;">
                            <div class="SubHead" style="margin-bottom: 10px;">
                                <%=Localize("Overview") %></div>
                            <table cellpadding="1" width="100%" class="Normal">
                                <tr>
                                    <td colspan="2" align="center">
                                        <asp:Image ID="imgLogo" runat="server" ImageUrl="images/questionmark.gif" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%=Localize("Contents") %>:
                                    </td>
                                    <td>
                                        <asp:Label ID="lblMedias" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%=Localize("CreatorAndOwner") %>:
                                    </td>
                                    <td>
                                        <asp:Label ID="lblAuthor" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%=Localize("LastModifiedDate") %>:
                                    </td>
                                    <td>
                                        <asp:Label ID="lblLastModifiedDate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%=Localize("CreatedDate") %>:
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCreatedDate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="Group2">
                            <div class="SubHead" style="margin-bottom: 10px;">
                                <%=Localize("Options") %></div>
                            <div>
                                <asp:HyperLink ID="lnkSeeMedias" runat="server" resourcekey="ManageMedias" /></div>
                            <div>
                                <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" resourcekey="DeleteAlbum" /></div>
                            <div>
                                <asp:LinkButton ID="cmdRefreshNow" resourcekey="Synchronize" runat="server"></asp:LinkButton>
                            </div>
                            <asp:Panel ID="pnlBackgroundMusic" runat="server">
                                <div>
                                    <a href="javascript:void(0);" onclick="var style = document.getElementById('divBackgroundMusic').style;style.display=='block'?style.display='none':style.display='block';">
                                        <%=Localize("BackgroundMusic") %>
                                    </a>
                                </div>
                                <div id="divBackgroundMusic" class="UMGMenuBody" style="display: none;">
                                    <asp:Panel ID="pnlCurrentMp3" runat="server">
                                        <asp:HyperLink ID="lnkBgSound" runat="server"></asp:HyperLink>
                                        <br />
                                        <asp:Button ID="cmdRemoveMusic" runat="server" CausesValidation="False" resourcekey="Remove"
                                            CssClass="CommandButton"></asp:Button>
                                        <br />
                                        <asp:Label ID="Label18" resourcekey="MusicTitle" runat="server"></asp:Label>:
                                        <asp:TextBox ID="txtAudioCaption" runat="server" Width="150px" CssClass="NormalTextBox"></asp:TextBox>
                                    </asp:Panel>
                                    <asp:Panel ID="pnlUploadMp3" runat="server">
                                        <asp:Label ID="Label17" resourcekey="UploadBackgroundMusic" runat="server"></asp:Label>:
                                        <br />
                                        <input id="fileMusic" type="file" accept="audio/x-mp3" size="18" name="File2" class="NormalTextBox"
                                            runat="server" />
                                        <br />
                                        <asp:Button ID="btnUploadMusic" runat="server" resourcekey="Upload" CausesValidation="False"
                                            CssClass="CommandButton" />
                                    </asp:Panel>
                                </div>
                            </asp:Panel>
                        </div>
                    </td>
                    <td>
                        <div class="Group3" style="margin-bottom: 10px;">
                            <div class="SubHead" style="margin-bottom: 10px;">
                                <%=Localize("BasicInformation") %></div>
                            <table cellpadding="1" class="Normal">
                                <tr id="trParentAlbums" runat="server">
                                    <td class="header2">
                                        <dnn:Label ID="Label4" runat="server" resourcekey="ParentAlbum" Suffix=":"></dnn:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="lstParentAlbums" runat="server" CssClass="NormalTextBox" Width="400px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="header2">
                                    <dnn:Label ID="Label1" runat="server" resourcekey="RssUrl" Suffix=":"></dnn:Label>
                                </td>
                                    <td>
                                        <asp:TextBox ID="txtRssUrl" runat="server" Width="400px" CssClass="NormalTextBox"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRssUrl" resourcekey="Required"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td class="header2">
                                        <dnn:Label ID="Label13" runat="server" resourcekey="Decription"></dnn:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDescription" runat="server" Width="400px" Rows="4" TextMode="MultiLine"
                                            CssClass="NormalTextBox"></asp:TextBox></td>
                                </tr>
                            </table>
                        </div>
                        <div class="Group3">
                            <div class="SubHead" style="margin-bottom: 10px;">
                                <%=Localize("AdvancedOptions") %></div>
                            <table cellpadding="1" class="Normal">
                                <tr>
                                    <td class="header2">
                                        <dnn:Label ID="Label15" runat="server" resourcekey="Owner" Suffix=":">
                                        </dnn:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtUserName" runat="server" Width="300px" CssClass="NormalTextBox" autocomplete="off"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr id="trViewRoles" runat="server">
                                    <td class="header2">
                                        <dnn:Label ID="Label11" runat="server" resourcekey="ViewRoles" Suffix=":">
                                        </dnn:Label>
                                    </td>
                                    <td>
                                        <uc1:rolepicker id="Rolepicker3" runat="server" DisplayAllUsers="True">
                                        </uc1:rolepicker></td>
                                </tr>
                                <tr>
                                        <td class="header2">
                                            <dnn:Label ID="lblDefaultAlbum" runat="server" resourcekey="DefaultAlbum" Suffix="?"></dnn:Label>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkDefaultAlbum" resourcekey="Yes" runat="server"></asp:CheckBox>
                                        </td>
                                    </tr>
                            </table>
                        </div>
                        <p style="text-align: center;">
                            <asp:Button ID="btnSave" runat="server" resourcekey="cmdUpdate" CssClass="CommandButton" />
                            <asp:Button ID="btnCancel" runat="server" resourcekey="cmdCancel" CssClass="CommandButton"
                                CausesValidation="False" />
                        </p>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</div>

<script type="text/javascript">
function showOptionsDetail()
{
    document.getElementById("divOptionsSummary").style.display="none";
    document.getElementById("divOptionsDetail").style.display="block";
}
</script>

