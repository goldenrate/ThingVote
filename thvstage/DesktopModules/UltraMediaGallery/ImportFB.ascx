<%@ Control Language="vb" AutoEventWireup="false" Codebehind="ImportFB.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.ImportFB" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<UPG:header id="ctlHeader" runat="server" />
<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            <%=Localize("ImportFB") %>
        </td>
    </tr>
    <tr>
        <td>
            <table border="0" cellpadding="5" width="100%" class="Normal">
                <tr>
                    <td style="vertical-align: top;width:310px;">
                        <div class="Group1" style="margin-bottom: 10px;">
                            <%=Localize("ImportFB.Help") %>
                        </div>
                        <div class="Group2">
                            <div class="SubHead" style="margin-bottom: 10px;">
                                <%=Localize("OtherUploadOptions") %></div>
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
                                <a href="<%=EditUrl("ChooseFile") %>">
                                    <%=Localize("ChooseFile") %>
                                </a>
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
                                <%=Localize("ImportFB") %>
                            </div>
                        </div>
                    </td>
                    <td style="text-align: left;">
                        <asp:panel id="pnlAuthorize" runat="server">
                        <p><asp:label id="lblAuthorize" runat="server" resourcekey="Authorize.Help"></asp:label></p>
                        <p><asp:button id="btnAuthorize" runat="server" resourcekey="Authorize" /></p>
                        </asp:panel>   
                                     
                        <asp:panel id="pnlMyAlbums" runat="server" visible="False">
                            <p class="fbtitle"><asp:label id="lblYourFBAlbums" runat="server" resourcekey="YourFBAlbums"></asp:label></p>
                            <asp:datalist id="lstFBAlbums" runat="server" repeatcolumns="4" cellpadding="3" width="100%" repeatdirection="Horizontal"
                        cssclass="Normal">
                                <ItemStyle HorizontalAlign="Left" CssClass="fbalbum"/>
                                <ItemTemplate>
                                    <div class='logo'><a target='_blank' href='http://www.facebook.com/media/set/?set=a.<%#Container.DataItem.id %>'><img alt='logo' src='<%#GetAlbumLogo(Container.DataItem.id) %>' /></a></div>
                                    <div class='title'><asp:label id="lblAlbumName" runat="server" Text="<%#Container.DataItem.name %>" Tooltip="<%#Container.DataItem.id %>"></asp:label></div>
                                    <div class='script'><%#Container.DataItem.count %> <asp:label id="lblphotos" runat="server" resourcekey="photos"></asp:label></div>
                                    <div class='script verticalMiddle'><asp:checkbox id="chkImport" runat="server" checked="true" resourcekey="tobeimported"></asp:checkbox></div>
                                </ItemTemplate>
                            </asp:datalist>
                            <p class="fbtitle"><%=BizModules.UltraPhotoGallery.Utility.GetUMGDefault("PhotosOfYou") %></p>
                            <table class="Normal" cellspacing="0" cellpadding="3" border="0" style="width:100%;border-collapse:collapse;">
                            <tr><td class="fbalbum">
                            
                            <div class='logo'><asp:image id="imgMeLogo" title='logo' runat="server"></asp:image></div>
                                    <div class='script verticalMiddle'><asp:checkbox id="chkImport" runat="server" checked="true" resourcekey="tobeimported"></asp:checkbox></div>
                                    
                            </td><td>
                            </td></tr>
                            </table>
                            <p></p>
                            <p style="text-align:center;">
                            <asp:Button ID="btnImport" runat="server" resourcekey="Import" CssClass="CommandButton" /></p>
                        </asp:panel>      
                                  
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</div>

