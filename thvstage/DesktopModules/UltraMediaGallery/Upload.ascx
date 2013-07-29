<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Upload.ascx.vb" Inherits="BizModules.UltraPhotoGallery.Upload" %>
<%@ Register Assembly="BizModules.UltraPhotoGallery" Namespace="BizModules.UltraPhotoGallery.Flash" TagPrefix="UPG" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>

<UPG:Header ID="ctlHeader" runat="server" />

<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            <%=Localize("FlashUpload") %>
        </td>
    </tr>
    <tr>
        <td>
            <table border="0" cellpadding="5" width="100%" class="Normal">
                <tr>
                    <td style="vertical-align: top;">
                        <div class="Group1" style="margin-bottom: 10px;">
                            <%=Localize("FlashUpload.Help").Replace("[SUPPORTEDMEDIAS]", GetSupportedMedias()) %>
                        </div>
                        <div class="Group2">
                            <div class="SubHead" style="margin-bottom: 10px;">
                                <%=Localize("OtherUploadOptions") %></div>
                            <div>
                                <%=Localize("FlashUpload") %>
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
                                <a href="<%=EditUrl("ImportFB") %>" class="SubHead">
                                    <%=Localize("ImportFB") %>
                                </a>
                            </div>
                        </div>
                    </td>
                    <td style="text-align: center;">
    <script type="text/javascript" src="<%=ModulePath%>Scripts/swfobject.js" language="javascript"></script>

    <div id="UPGContainer">
        <object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='<%=Protocal%>://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0'
            width='600' height='400' id='UPG'>
            <param name='flashvars' value='' />
            <param name='movie' value='<%=ModulePath%>as3upload.swf' />
            <embed flashvars='' src='<%=ModulePath%>as3upload.swf' width='600' height='400' name='UPG' type='application/x-shockwave-flash' pluginspage='<%=Protocal%>://www.macromedia.com/go/getflashplayer' />
        </object>
	    <p class="Normal verticalMiddle">
	    <a href="<%=Protocal%>://www.adobe.com/go/getflashplayer" target="_blank"><img src="<%=Protocal%>://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" border="0" /></a>
	    Install latest flash player if this application doesn't work.
	    </p>
    </div>

    <script type="text/javascript">
		var fObj = new FlashObject('<%=ModulePath%>as3upload.swf', 'UPG', '600', '400', "9.0.115", '');
		fObj.flashvars = 'completeFunction=&fileTypes=<%=Join(GetSupportedMediaExtensions(), "%3b") %>&fileTypeDescription=<%=GetSupportedMedias() %>&totalUploadSize=209715200&fileSizeLimit=67108864&uploadPage=<%=ResolveUrl("FlashUploadPage.aspx") + Server.UrlEncode("?PortalId=" + PortalId.ToString() + "&ModuleId=" + ModuleId.ToString() ) %>';
		fObj.addParam('wmode', 'transparent');
		fObj.addParam('allowScriptAccess', 'always');
		fObj.write('UPGContainer');
		var UPGContainer;
		UPGContainer = document.getElementById('UPGContainer');
		    
    </script>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</div>
