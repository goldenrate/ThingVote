<%@ Control Language="vb" AutoEventWireup="false" Codebehind="QuickCreateAlbum.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.QuickCreateAlbum" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<UPG:Header ID="ctlHeader" runat="server" />
<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            <%=Localize("QuickCreateAlbum") %>
        </td>
    </tr>
    <tr>
        <td>
            <table border="0" cellpadding="5" width="100%" class="Normal">
                <tr>
                    <td style="vertical-align: top;">
                        <div class="Group1" style="margin-bottom: 10px;">
                            <div class="SubHead" style="margin-bottom: 10px;">
                                <%=Localize("NoAlbumExists") %>
                            </div>
                            <%=Localize("QuickCreateAlbum.Help") %>
                        </div>
                        <div class="Group2">
                            <div class="SubHead" style="margin-bottom: 10px;">
                                <%=Localize("OtherOptions") %>
                            </div>
                            <div>
								<a href="<%=EditURL("AddStdAlbum") %>">
									<%=Localize("CreateAlbumWithAllOptions") %>
								</a>
                            </div>
                            <div>
                                <a href="<%=NavigateURL() %>">
                                    <%=Localize("ReturnToGallery") %>
                                </a>
                            </div>
                        </div>
                    </td>
                    <td>
                    <div class="Group3" style="margin-bottom: 10px;">
                        <%=Localize("Questions") %>
</div>
                        <p style="text-align: center;">
                            <asp:Button ID="btnQuicklyCreate" runat="server" resourcekey="QuicklyCreate" CssClass="CommandButton" />
                        </p>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</div>
