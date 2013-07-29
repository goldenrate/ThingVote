<%@ Control Language="vb" AutoEventWireup="false" Codebehind="ChooseFile.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.ChooseFile" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<UPG:header id="ctlHeader" runat="server" />
<div class="UMGSection">
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td class="SectionHeader Head">
                <%=Localize("ChooseFile") %>
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="5" width="100%" class="Normal">
                    <tr>
                        <td style="vertical-align: top;">
                            <div class="Group1" style="margin-bottom: 10px;">
                                <%=Localize("ChooseFile.Help").Replace("[SUPPORTEDMEDIAS]", GetSupportedMedias()) %>
                            </div>
                            <div class="Group2">
                                <div class="SubHead" style="margin-bottom: 10px;">
                                    <%=Localize("OtherUploadOptions") %>
                                </div>
                                <div>
                                    <a href="<%=EditUrl("Upload") %>">
                                        <%=Localize("FlashUpload") %>
                                    </a>
                                </div>
                                <div>
                                    <a href="<%=EditUrl("ClassicUpload") %>">
                                        <%=Localize("ClassicUpload") %>
                                    </a>
                                </div>
                                <div>
                                    <%=Localize("ChooseFile") %>
                                </div>
                                <div>
                                    <a href="<%=EditUrl("AddFromURL") %>">
                                        <%=Localize("AddFromURL") %>
                                    </a>
                                </div>
                                <div>
                                    <a href="<%=EditUrl("AddFromHTML") %>">
                                        <%=Localize("AddFromHTML") %>
                                    </a>
                                </div>
                                <div>
                                    <a href="<%=EditUrl("CopyAndPaste") %>">
                                        <%=Localize("CopyAndPaste") %>
                                    </a>
                                </div>
                                <div>
                                    <a href="<%=EditUrl("Html5Upload") %>">
                                        <%=Localize("Html5Upload") %>
                                    </a>
                                </div>
                                <div>
                                    <a href="<%=EditUrl("ImportFB") %>" class="SubHead">
                                        <%=Localize("ImportFB") %>
                                    </a>
                                </div>
                            </div>
                        </td>
                        <td style="text-align: center;">
                            <table class="Normal">
                                <tr>
                                    <td style="text-align: right;">
                                        <%=Localize("AddtoAlbum") %>
                                        :
                                        <asp:Image ID="imgAlbum" runat="server" ImageUrl="~/DesktopModules/UltraMediaGallery/images/albumicon.gif" />
                                        <asp:DropDownList ID="cboParentAlbum" runat="server" CssClass="NormalTextBox">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td colspan="3">
                                                    <div class="NormalBold" style="text-align:left;">
                                                        <%=Localize("FileLocation") %>
                                                        :
                                                    </div>
                                                    <asp:DropDownList ID="lstDirectories" runat="server" Width="100%" CssClass="NormalTextBox"
                                                        AutoPostBack="true" />
                                                        <asp:checkbox id="chkIncludeUMGFolders" runat="server" resourcekey="IncludeUMGFolders" cssclass="Normal" AutoPostBack="True"></asp:checkbox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="NormalBold" style="text-align:left;">
                                                        <%=Localize("FileName") %>
                                                        :
                                                    </div>
                                                    <asp:ListBox ID="lstFiles" runat="server" Width="220" Height="250" CssClass="NormalTextBox" SelectionMode="Multiple" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnRight" runat="server" Text=">>" CssClass="CommandButton" />
                                                    <br />
                                                    <asp:Button ID="btnLeft" runat="server" Text="<<" CssClass="CommandButton" />
                                                </td>
                                                <td>
                                                    <div class="NormalBold" style="text-align:left;">
                                                        <%=Localize("Selections") %>
                                                        :
                                                    </div>
                                                    <asp:ListBox ID="lstSelections" runat="server" Width="220" Height="250" CssClass="NormalTextBox" SelectionMode="Multiple" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <asp:Button ID="btnUpload" runat="server" resourcekey="Upload" CssClass="CommandButton" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>

<script language="javascript">

function isclickable(option)
{
    var cboParentAlbum = document.getElementById("<%=cboParentAlbum.ClientID %>");
    var level = cboParentAlbum.options[cboParentAlbum.selectedIndex].text.lastIndexOf("--");
    
    var belowLevel;
    
    if (cboParentAlbum.selectedIndex < cboParentAlbum.length - 1)
        belowLevel = cboParentAlbum.options[cboParentAlbum.selectedIndex + 1].text.lastIndexOf("--");
    
    if (belowLevel > level)
    {
        alert("<%=Localize("AlbumNotSelectable") %>");
        return false;
    }
    return true;
}

</script>

