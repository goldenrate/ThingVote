var singleselection = true;

var doubleClickNotified = false;
var isIOS = false;
var agt = navigator.userAgent;
if((agt.match(/iPhone/i)) || (agt.match(/iPod/i)) || (agt.match(/iPad/i))) isIOS = true;
var useHtml5 = isIOS;
var modulePath = hsoptions.umgpath;
var mediaTitle = "";
var mediaId = -1;
var activeMediaUrl = "";

jQuery(document).ready(function () {

    if (typeof (Sys) != "undefined")
    {
        var req = Sys.WebForms.PageRequestManager.getInstance();
        if (req)
            req.add_endRequest(initList);
    }

    singleselection = jQuery(".selectiontip").length < 1;

    initList();


	if(hsoptions.defaultPhoto > 0)
	{
		var media = jQuery(".videolist a[data-umgid="+hsoptions.defaultPhoto+"]");
		if (media.length > 0)
		{
			media.click();
		}
	}
});


function initList()
{
	jQuery(".tags input:checkbox, .categories input:checkbox").click(function(e){
		//check control key status
		if(e.metaKey || e.ctrlKey || singleselection)
		{
			jQuery(this).parent().parent().parent().parent().find("input:checkbox").not(this).attr("checked", false);
			this.checked = true;
		}
	});


	var medias = jQuery(".videolist a");
	//ie fix
	if (jQuery.browser.msie)
	{
		for (var i=0;i<medias.length ;i++ )
		{
			var media = medias.eq(i);
			media.attr("rel", media.attr("href"));
			media.attr("href", "javascript:void(0);");
		}
	}
	//ok
	medias.click(function(event){

		event.preventDefault();
		var media = jQuery(this);
		var umgid = media.data("umgid");
		mediaId = umgid;
		mediaTitle = media.data("title");
		var title = mediaTitle;
		var mediaURL = media.attr("rel");
		if (mediaURL == undefined || mediaURL == "")
		{
			mediaURL =  media.attr("href");
		}
		activeMediaUrl = mediaURL;
		var mediaType = getMediaType(mediaURL);
		
		if (mediaType == "i")
		{
			return//hs.expand is already appened to the A node!
		}
		else if (mediaType == "v")
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

			videoTag = "<div style='width:600px; height:400px;'>" + videoTag + "</div>";
			return hsExpand(this, title, videoTag);
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

			audioTag = "<div style='width:400px; height:150px;'>" + audioTag + "</div>";
			return hsExpand(this, title, audioTag);
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
				flashTag = "<div style='width:"+media.attr("data-width")+"px;height:"+media.attr("data-height")+"px;'>" + "<object allowFullScreen='True' allowScriptAccess='always' width='100%' height='100%'><param name='movie' value='"+mediaURL+"' /><param name='allowFullScreen' value='true' /><param name='wmode' value='transparent' /><embed src='"+mediaURL+"' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' wmode='transparent' width='100%' height='100%'></embed></object>" + "</div>";
			}

			return hsExpand(this, title, flashTag);
		}
		else//embed html content
		{
			return hsExpand(this, title, media.find(".htmlcontent").html());
		}

	});
}



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

function purchase(umgid, thumbnail)
{
	if (typeof(UPG_AddToCart) != "undefined")
	{
		UPG_AddToCart(umgid, thumbnail);
	}
}

function thumbup(umgid, upordown)
{
	if (upordown)
	{
		dnn.xmlhttp.doCallBack(hsoptions.callbackid,"like" + umgid,thumbup_CallBack,this,null,null,null,null,0);
	}
	else
	{
		dnn.xmlhttp.doCallBack(hsoptions.callbackid,"dslk" + umgid,thumbup_CallBack,this,null,null,null,null,0);
	}
}

function thumbup_CallBack(result, ctx)
{
	if (result!="")
	{
		alert(result);
	}
}

function handleHtmlTokens(html)
{
	var html2 = html.replace(/%3c/g, "<").replace(/%3e/g, ">").replace(/%22/g, "\"").replace(/%27/g, "\'");
	return html2;
}

var containerWidth;
var hsItemIndex = 0;
function hsExpand(sender, title, html)
{
	var jsender = jQuery(sender);
	var umgid = jsender.data("umgid");

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
	return hs.htmlExpand(sender, { contentId:htmlContainer.attr("id"), objectWidth:containerWidth, objectHeight:containerHeight}, {"title": title, "umgid": umgid});
}

function addSocialLinks(container, umgid, target, linkto)
{
	jQuery(".hsrating").remove();

	if (linkto != "")
	{
		var caption = container.find(".highslide-caption");
		caption.html("<a href='"+linkto+"'>"+caption.html()+"</a>");
	}

	var url = hsoptions.baseUrl;
	url=url.replace("[UMGID]", umgid);

	var social = "";

	social += "<div class='hsrating'>";
		//title += "<a href='javascript:void(0);' class='thumbdown' onclick='thumbup("+umgid+", false);'></a>";
		social += "<div class='addthis_default_style addthis_toolbox addthis_32x32_style'>";
			if (hsoptions.download)
			{
				social += "<a class='download' href='"+modulePath+"SimpleDownload.aspx?Source="+activeMediaUrl+"'></a>";
			}
			if (hsoptions.facebook)
			{
				social += "<a class='addthis_button_facebook'></a>";
			}
			if (hsoptions.twitter)
			{
				social += "<a class='addthis_button_twitter'></a>";
			}
			if (hsoptions.linkedin)
			{
				social += "<a class='addthis_button_linkedin'></a>";
			}
			if (hsoptions.email)
			{
				social += "<a class='addthis_button_email'></a>";
			}
			if (hsoptions.pinterest && target != "")
			{
				social += "<a class='addthis_button_pinterest' pi:init:layout='horizontal' pi:pinit:media='"+target+"' pi:pinit:url='"+url+"'></a>";
			}
			if (hsoptions.googleplus)
			{
				social += "<a class='addthis_button_google_plusone'></a>";
			}
			if (hsoptions.thumbup)
			{
				social += "<a href='javascript:void(0);' class='thumbup' onclick='thumbup("+umgid+", true);' title='Thumb up'></a>";
			}

			var medianode = jQuery(".videolist a[data-umgid="+umgid+"]");
			if (medianode.hasClass("res") && hsoptions.price > 0)
			{
				var thumbnail =medianode.find("img").attr("src");
				social += "<a href='javascript:void(0);' class='purchase' onclick='purchase("+umgid+", \""+thumbnail+"\");' title='Purchase'></a>";
			}
		social += "</div>";
	social += "</div>";

	container.append(social);

	if (typeof (addthis) == "undefined") return;


	addthis.toolbox(".addthis_toolbox");
	addthis.ost = 0;
    addthis.update('share', 'url', url);
    addthis.ready();
}

hs.Expander.prototype.onAfterGetContent = function (sender) {
	var title = this.custom.title;
	var umgid = this.custom.umgid;

	this.content.innerHTML = "<div>"+this.content.innerHTML.replace("{xxx}", this.custom)+"</div><div style='position:relative;'><div style='cursor:pointer;position:absolute;top:0px;right:0px;width:30px;height:30px;background-image:url(\""+hs.graphicsDir+"close.png\");' onclick='return hs.close(this)'>&nbsp;</div></div><div class='Normal' style='line-height:30px;'>"+title+"</div>";

	setTimeout(function(){
		addSocialLinks(jQuery(sender.content).parent(), umgid, "", "");
	}, 600);

	return;
}

hs.Expander.prototype.onAfterExpand = function (sender) {
	if(!sender.caption) return;
	addSocialLinks(jQuery(sender.content).parent(), this.custom.umgid, this.custom.target, this.custom.link);
}

