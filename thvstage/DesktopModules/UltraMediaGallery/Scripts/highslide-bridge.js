var containerWidth;
var hsItemIndex = 0;
function hsExpand(sender, title, html)
{
	if (hsItemIndex > 0)
	{
		var prevItem = jQuery("hsItem" + hsItemIndex);
		prevItem.empty();
	}
	var itemKey = "hsItem" + hsItemIndex++;
	jQuery(document.body).append("<div id='"+itemKey+"' class='UMGHSContainer' style='display:none;float:left;' ></div>");
	var htmlContainer = jQuery("#"+itemKey);
	htmlContainer.html(handleHtmlTokens(html));

	containerWidth = htmlContainer.width();
	var containerHeight = htmlContainer.height();
	if (containerWidth <=0 ) containerWidth = 600;
	if (containerHeight <=30 ) containerHeight = 400;
	containerHeight += 30;
	return hs.htmlExpand(sender, { contentId:htmlContainer.attr("id"), objectWidth:containerWidth, objectHeight:containerHeight}, {"title": title});
}

function hsExpandMedia(sender, title, type, url, width, height, useHtml5)
{
	var htmlContent = "";
	if (type == "Video")
	{
		width<=0?width=600:width*=1;
		height<=0?height=400:width*=1;


		if (useHtml5)
		{
			htmlContent = "<video src='" + url + "' type='video/mp4' width='" + width + "px' height='" + height + "px' autoplay='true' controls='controls' />";
		}
		else
		{
			htmlContent = "<object allowFullScreen='True' allowScriptAccess='always' width='"+width+"' height='"+height+"'><param name='movie' value='"+modulePath+"SimpleVideo.swf' /><param name='allowFullScreen' value='true' /><param name='flashvars' value='video="+url+"&showControlBar=True' /><embed src='"+modulePath+"SimpleVideo.swf' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' width='"+width+"' height='"+height+"' flashvars='video="+url+"&showControlBar=True'></embed></object>"
		}
	}
	else if (type == "Audio")
	{
		width<=0?width=400:width*=1;
		height<=0?height=150:height*=1;


		if (useHtml5)
		{
			htmlContent = "<audio src='" + url + "' type='audio/mp3' width='" + width + "px' height='" + height + "px' autoplay='true' controls='controls' />";
		}
		else
		{
			var flashVars = "&autostart=yes";
			htmlContent = "<object allowFullScreen='True' allowScriptAccess='always' width='"+width+"' height='"+height+"'><param name='movie' value='"+modulePath+"SimpleAudio.swf' /><param name='allowFullScreen' value='true' /><param name='flashvars' value='audio="+url+flashVars+"' /><embed src='"+modulePath+"SimpleAudio.swf' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' width='"+width+"' height='"+height+"' flashvars='audio="+url+flashVars+"'></embed></object>"
		}
	}
	else if (type == "Flash")
	{
		width<=0?width=600:width*=1;
		height<=0?height=400:height*=1;

		if (useHtml5)
		{
			alert("Flash content is not available on your device.");
			return;
		}
		else
		{
			htmlContent = "<object allowFullScreen='True' allowScriptAccess='always' width='"+width+"' height='"+height+"'><param name='movie' value='"+url+"' /><param name='allowFullScreen' value='true' /><embed src='"+url+"' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' width='"+width+"' height='"+height+"'></embed></object>"
		}
	}

	return hsExpand(sender, title, htmlContent);
}


function handleHtmlTokens(html)
{
	var html2 = html.replace(/%3c/g, "<").replace(/%3e/g, ">").replace(/%22/g, "\"").replace(/%27/g, "\'");
	return html2;
}




hs.Expander.prototype.onAfterGetContent = function (sender) {
	var title = this.custom.title;
	this.content.innerHTML = "<div>"+this.content.innerHTML.replace("{xxx}", this.custom)+"</div><div style='position:relative;'><div style='cursor:pointer;position:absolute;top:0px;right:0px;width:30px;height:30px;background-image:url(\""+hs.graphicsDir+"close.png\");' onclick='return hs.close(this)'>&nbsp;</div></div><div class='Normal' style='line-height:30px;'>"+title+"</div>";
}