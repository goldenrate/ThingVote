<%@ Control Language="vb" AutoEventWireup="false" Codebehind="ThreeDCarousel.ascx.vb" Inherits="BizModules.UltraPhotoGallery.ThreeDCarousel" %>
<script type="text/javascript" src='<%=ModulePath%>Scripts/swfobject.js'></script>
<div id='UMGContainer<%=ModuleId%>'>
	<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='<%=Protocal%>://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0' width='<%=GalleryWidthEx%>' height='<%=GalleryHeightEx%>' id='UMG<%=ModuleId%>' >
	<param name='wmode' value='transparent' />
	<param name='flashvars' value='<%=FlashVars%>' />
	<param name='allowFullScreen' value='true' />
	<param name='movie' value='<%=ModulePath%><%=PresentationName%>.swf' />
	<embed wmode='transparent' flashvars='<%=FlashVars%>' src='<%=ModulePath%><%=PresentationName%>.swf' width='<%=GalleryWidthEx%>' height='<%=GalleryHeightEx%>' name='UPG' type='application/x-shockwave-flash' pluginspage='<%=Protocal%>://www.macromedia.com/go/getflashplayer'>
	</embed>
	</object>
	<p class="Normal verticalMiddle">
	<a href="<%=Protocal%>://www.adobe.com/go/getflashplayer" target="_blank"><img src="<%=Protocal%>://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" border="0" /></a>
	Install latest flash player if you can't see this gallery, or click <a href="<%=GetHtmlVersion() %>">here</a> to see the html version.
	</p>
</div>
<script type='text/javascript'>
	var fObj = new FlashObject('<%=ModulePath%><%=PresentationName%>.swf', 'UMG<%=ModuleId%>', '<%=GalleryWidthEx%>', '<%=GalleryHeightEx%>', 8, '');
	fObj.flashvars = '<%=FlashVars%>';
	<% if SupportFullScreen Then%>fObj.addParam('allowFullScreen', 'true');<% End If %>
	fObj.addParam('wmode', 'transparent');
	fObj.write('UMGContainer<%=ModuleId%>');
	var UMG<%=ModuleId%>;
	UMG<%=ModuleId%> = document.getElementById('UMG<%=ModuleId%>');
</script>