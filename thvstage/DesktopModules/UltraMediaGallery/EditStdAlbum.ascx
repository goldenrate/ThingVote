<%@ Control Language="vb" AutoEventWireup="false" Codebehind="EditStdAlbum.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.EditStdAlbum" %>
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
                                <asp:LinkButton ID="cmdRemoveTn" runat="server" CausesValidation="False" resourcekey="RemoveLogo"
                                    Visible="False"></asp:LinkButton></div>
                            <asp:Panel ID="pnlUploadLogo" runat="server">
                                <div>
                                    <a href="javascript:void(0);" onclick="var style = document.getElementById('divUploadLogo').style;style.display=='block'?style.display='none':style.display='block';">
                                        <%=Localize("UploadLogo") %>
                                    </a>
                                </div>
                                <div id="divUploadLogo" class="UMGMenuBody" style="display: none;">
                                    <asp:Label ID="Label16" runat="Server" resourcekey="UploadLogo.Help"></asp:Label>:
                                    <input id="fileLogo" type="file" size="17" name="File1" class="NormalTextBox" runat="server" />
                                    <br />
                                    <asp:Button ID="btnUploadLogo" runat="server" resourcekey="Upload" CausesValidation="False"
                                        CssClass="CommandButton" />
                                </div>
                            </asp:Panel>
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
                                        <dnn:Label ID="Label5" runat="server" resourcekey="Title" Suffix=":"></dnn:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTitle" runat="server" Width="400px" CssClass="NormalTextBox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtTitle"
                                            resourcekey="Required"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td class="header2">
                                        <dnn:Label ID="Label7" runat="server" resourcekey="Decription" Suffix=":"></dnn:Label>
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
                            <div id="divOptionsSummary">
                                <asp:Label ID="lblAdvancedOptions" runat="server" style="line-height:30px;"></asp:Label>
                                <a href="javascript:void(0);" onclick="return showOptionsDetail();">
                                    <%=Localize("ShowOptionsDetail") %>
                                </a>
                            </div>
                            <div id="divOptionsDetail" style="display: none;">
                                <table cellpadding="1" class="Normal">
                                    <tr id="trServerFolder" runat="server">
                                        <td class="header2">
                                            <dnn:Label ID="Label8" runat="server" resourcekey="ServerFolder" Suffix=":">
                                            </dnn:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtServerFolder" runat="server" Width="300px" CssClass="NormalTextBox"></asp:TextBox><asp:RequiredFieldValidator
                                                ID="ref2" runat="server" ControlToValidate="txtServerFolder" resourcekey="Required"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="rev5" runat="server" ControlToValidate="txtServerFolder"
                                                resourcekey="InvalidServerPath" ValidationExpression="[\w/ ()-.]+"></asp:RegularExpressionValidator></td>
                                    </tr>
                                    <tr>
                                        <td class="header2">
                                            <dnn:Label ID="Label10" runat="server" resourcekey="AutoResize" Suffix=":">
                                            </dnn:Label>
                                            <td>
                                                <asp:CheckBox ID="chkAutoResizing" resourcekey="chkAutoResizing" runat="server" AutoPostBack="False"
                                                    Checked="True"></asp:CheckBox>
                                                <asp:TextBox ID="txtMaxPhotoWidth" runat="server" CssClass="NormalTextBox" Width="35px"></asp:TextBox>px
                                                <asp:RegularExpressionValidator ID="rev3" runat="server" ErrorMessage="*" ControlToValidate="txtMaxPhotoWidth"
                                                    ValidationExpression="\d*"></asp:RegularExpressionValidator>
                                                X&nbsp;&nbsp;
                                                <asp:TextBox ID="txtMaxPhotoHeight" runat="server" CssClass="NormalTextBox" Width="35px"></asp:TextBox>px
                                                <asp:RegularExpressionValidator ID="rev4" runat="server" ErrorMessage="*" ControlToValidate="txtMaxPhotoHeight"
                                                    ValidationExpression="\d*"></asp:RegularExpressionValidator>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td class="header2">
                                            <dnn:Label ID="Label9" runat="server" resourcekey="ThumbnailSize" Suffix=":">
                                            </dnn:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtThumbnailWidth" runat="server" Width="35px" CssClass="NormalTextBox"></asp:TextBox>px
                                            <asp:RegularExpressionValidator ID="ref1" runat="server" ErrorMessage="*" ControlToValidate="txtThumbnailWidth"
                                                ValidationExpression="\d*"></asp:RegularExpressionValidator>
                                            X&nbsp;&nbsp;
                                            <asp:TextBox ID="txtThumbnailHeight" runat="server" Width="35px" CssClass="NormalTextBox"></asp:TextBox>px
                                            <asp:RegularExpressionValidator ID="rev2" runat="server" ErrorMessage="*" ControlToValidate="txtThumbnailHeight"
                                                ValidationExpression="\d*"></asp:RegularExpressionValidator></td>
                                    </tr>
                                    <tr id="trOwner" runat="server">
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
                                    <tr id="trAddRoles" runat="server">
                                        <td class="header2">
                                            <dnn:Label ID="Label12" runat="server" resourcekey="AddRoles" Suffix=":">
                                            </dnn:Label>
                                        </td>
                                        <td class='separator'>
                                            <uc1:rolepicker id="RolePicker1" runat="server">
                                            </uc1:rolepicker></td>
                                    </tr>
                                    <tr id="trManageRoles" runat="server">
                                        <td class="header2">
                                            <dnn:Label ID="Label13" runat="server" resourcekey="ManageRoles" Suffix=":">
                                            </dnn:Label>
                                        </td>
                                        <td>
                                            <uc1:rolepicker id="RolePicker2" runat="server">
                                            </uc1:rolepicker></td>
                                    </tr>
                                    <tr id="trApprovalRoles" runat="server">
                                        <td class="header2">
                                            <dnn:Label ID="Label14" runat="server" resourcekey="ApprovalRoles" Suffix=":">
                                            </dnn:Label>
                                        </td>
                                        <td class='separator'>
                                            <uc1:rolepicker id="RolePicker4" runat="server">
                                            </uc1:rolepicker></td>
                                    </tr>
                                    <tr>
                                        <td class="header2">
                                            <dnn:Label ID="lblNeedApproval" runat="server" resourcekey="NeedApproval" Suffix="?"></dnn:Label>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkNeedApproval" runat="server" resourcekey="Yes" Checked="False" style="display:block;">
                                            </asp:CheckBox>
                                        </td>
                                    </tr>
                                    <tr id="trDefaultAlbum" runat="server">
                                        <td class="header2">
                                            <dnn:Label ID="lblDefaultAlbum" runat="server" resourcekey="DefaultAlbum" Suffix="?"></dnn:Label>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkDefaultAlbum" resourcekey="Yes" runat="server"></asp:CheckBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>
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
    return false;
}

jQuery(document).ready(function(){
    jQuery("#<% =txtTitle.ClientID %>").watermark("<%=Localize("Title.Watermark") %>");
    jQuery("#<% =txtDescription.ClientID %>").watermark("<%=Localize("Description.Watermark") %>");
});
</script>

