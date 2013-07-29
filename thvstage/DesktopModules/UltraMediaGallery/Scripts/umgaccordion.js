jQuery(document).ready(function(){

	var doubleClickNotified = false;
	var isIOS = false;
	var agt = navigator.userAgent;
	if((agt.match(/iPhone/i)) || (agt.match(/iPod/i)) || (agt.match(/iPad/i))) isIOS = true;
	var useHtml5 = isIOS;
	var modulePath;
	if (typeof(umgpath) != "undefined")
		modulePath = umgpath;
	else
		modulePath = "/DesktopModules/UltraMediaGallery/";

	jQuery(".umgmedia").each(function(){
		var mediaURL = jQuery(this).html();
		var mediaType = getMediaType(mediaURL);
		var media = jQuery(this).parent();
		
		if (mediaType == "v")
		{
			var videoTag = "";
			if (!useHtml5)
			{
				var extraParams = "";
				if (!doubleClickNotified)
				{
					doubleClickNotified = true;
					extraParams += "&notification=Double click to watch in full screen.";
				}
				extraParams += "&autoStart=False";
				extraParams += "&showControlBar=True";
				videoTag = "<object allowFullScreen='True' allowScriptAccess='always' allowNetworking='all' width='100%' height='100%'><param name='movie' value='"+modulePath+"SimpleVideo.swf' /><param name='allowFullScreen' value='true' /><param name='wmode' value='transparent' /><param name='flashvars' value='video="+mediaURL+extraParams+"' /><embed src='"+modulePath+"SimpleVideo.swf' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' allowNetworking='all' width='100%' height='100%' wmode='transparent' flashvars='video="+mediaURL+extraParams+"'></embed></object>";
			}
			else
			{
				var autoStart = "false";
				videoTag = "<video src='" + mediaURL + "' type='video/mp4' width='100%' height='100%' autoplay='"+ autoStart +"' controls='controls' />";
			}

			media.html(videoTag);
		}
		else if (mediaType == "a")
		{
			var audioTag = "";
			if (useHtml5)
			{
				audioTag = "<audio src='" + mediaURL + "' type='audio/mp3' width='100%' height='100%' autoplay='true' controls='controls' />";
			}
			else
			{
				var extraParams = "";
				extraParams += "&showControlBar=True";
				audioTag = "<object allowFullScreen='True' allowScriptAccess='always' wmode='transparent' width='100%' height='100%'><param name='movie' value='"+modulePath+"SimpleAudio.swf' /><param name='allowFullScreen' value='true' /><param name='wmode' value='transparent' /><param name='flashvars' value='audio="+mediaURL+extraParams+"' /><embed src='"+modulePath+"SimpleAudio.swf' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' wmode='transparent' width='100%' height='100%' flashvars='audio="+mediaURL+extraParams+"'></embed></object>"
			}

			media.html(audioTag);
		}
		else if (mediaType == "f")
		{
			var flashTag = "";
			if (useHtml5)
			{
				media.html("Flash content is not available on your device.");
				return;
			}
			else
			{
				flashTag = "<object allowFullScreen='True' allowScriptAccess='always' width='100%' height='100%'><param name='movie' value='"+mediaURL+"' /><param name='allowFullScreen' value='true' /><param name='wmode' value='transparent' /><embed src='"+mediaURL+"' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' wmode='transparent' width='100%' height='100%'></embed></object>"
			}

			media.html(flashTag);
		}
	});
});


function getMediaType(filename)
{
	var ext = typeof filename != "undefined" ? filename.substring(filename.lastIndexOf(".")+1, filename.length).toLowerCase() : false;
	if(ext == "mp4" || ext == "flv")
	{
		return "v";
	}
	else if (ext == "mp3")
	{
		return "a";
	}
	else if (ext == "swf")
	{
		return "f";
	}
	else if (ext != "")
	{
		return "i";
	}
	else
	{
		return "";
	}
}
