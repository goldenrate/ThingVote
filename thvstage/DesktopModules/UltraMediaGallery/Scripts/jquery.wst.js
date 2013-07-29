/*
 * UMG WidescreenTour2 Script for Ultra Media Gallery 6, 7
 * By Pengcheng Rong (rongers@hotmail.com, service@bizmodules.net)
 * Copyright (c) 2010 - 2011 Pengcheng Rong
 * All rights reserved, do not use this script library out of Ultra Media Gallery expect directly licensed by the copyright owner.
*/


(function(jQuery){
 jQuery.fn.wst = function(options) {
    
  var defaults = {
		backgroundColor:"333333",
		lightboxBackground:"cccccc",
		easing:"easeOutBack",

		animSpeed:1000,
		rows:2,
		columns:4,
		randomicity:80,
		videoWidth:200,
		videoHeight:150,
		infoWidth:180,

		autoPlayVideo:true,
		showVideoControls:true,
		openLinkInNewWindow:false,

		approxWidth:120,
		approxHeight:120,
		startDiscoverty:"Start your Discovery",
		xofy:"[x] of [y]",
		editable:false,
		modulePath:'/dnn450/desktopmodules/ultramediagallery/'
  };
  
  var options = jQuery.extend(defaults, options);
    
	return this.each(function() {

		var gallery = jQuery(this);

		//Identifying html elements to jquery objects.
		gallery.children().hide();
		var albums = gallery.find(".album");
		gallery.append("<div class='bglayer' style='background-color:#"+options.backgroundColor+"'><div class='bglayerinner'  ><img border='0' alt='background' /></div></div>");
		gallery.append("<div class='medialayer' ></div>");
		gallery.append("<div class='albumlist'><div class='start'><div class='starttext'>"+options.startDiscoverty+"</div><div class='albumindex'>0 of 0</div></div><div class='line'></div></div>");
		gallery.append("<div class='loading' />");
		gallery.append("<div class='lightbox'><div class='lbouter'><div class='lbinner' /><div class='info'><div class='title'></div><div class='description'></div><a class='more'></a></div><a class='close' /></a></div></div>");

		var albumlist = gallery.find(".albumlist");
		var albumindex = gallery.find(".albumindex");
		var start = gallery.find(".start");
		var line = gallery.find(".albumlist .line");
		var medialayer = gallery.find(".medialayer");
		var bgLayer = gallery.find(".bglayer");
		var bglayerinner = gallery.find(".bglayerinner");
		var loading = gallery.find(".loading");
		var lightbox = gallery.find(".lightbox");
		var lbouter = gallery.find(".lbouter");
		var lbinner = gallery.find(".lbinner");
		var info = gallery.find(".info");
		var close = gallery.find(".close");
		var more = gallery.find(".more");


		//Define internal properties
		var instanceName = gallery.attr("ID");
		var doubleClickNotified = false;
		var albumIndex = -1;
		var rowHeight = (gallery.height() - albumlist.height()) / options.rows;
		var columnWidth = gallery.width() / options.columns;
		var minimalMargin = 6;//for border
		var currentMediaTitle;
		var currentMediaDescription;
		var currentMediaLink;
		var isLayoutMode = false;
		//bgIndex is the image index used as album background
		var bgIndex = -1;

		//whether to use HTML 5 for video contents
		var isIOS;
		if((navigator.userAgent.match(/iPhone/i)) 
			|| (navigator.userAgent.match(/iPod/i)) 
				|| (navigator.userAgent.match(/iPad/i)))
			isIOS = true;
		else
			isIOS = false;
		var useHtml5 = isIOS;

		//a reference to my self
		var _this = this;







		function buildAlbumList()
		{
			var totalAlbums = albums.length;
			if (totalAlbums > 10)
			{
				totalAlbums = 10;
			}
			var lineStart = start.width();
			var linesection = (line.width() - lineStart) / totalAlbums;

			for (var i=0;i<totalAlbums; i++ )
			{
				var xPos = linesection * i + linesection / 2;
				var album = jQuery("<a href='javascript:void(0);' class='category' data-index='"+i+"'><span class='categorylabel'>"+jQuery(albums[i]).attr("data-title")+"</span><span class='shadow' /></a>");
				line.append(album);
				album.css("left", lineStart + xPos - album.width() / 2);
			}

			var categories = gallery.find(".category");
			categories.click(function(){
				var album = jQuery(this);
				var index = album.attr("data-index");

				openAlbum(index);
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
			else if (ext != "")
			{
				return "i";
			}
			else
			{
				return "";
			}
		}

		function openAlbum(index)
		{
			//use first image as background
			if (albumIndex == index)
			{
				return;
			}
			albumIndex = index;

			var albums = gallery.find(".category");
			albums.removeClass("current");
			jQuery(albums[index]).addClass("current");

			medialayer.stop().animate({"left":-1*medialayer.width()}, options.animSpeed, options.easing, function(){medialayer.children(".media").hide();});

			openAlbumStep2();
		}

		function openAlbumStep2 ()
		{
			var xofy =  options.xofy;
			xofy = xofy.replace("[x]",(albumIndex*1+1));
			xofy = xofy.replace("[y]",albums.length);
			albumindex.html(xofy);

			var photos = jQuery(albums[albumIndex]).children();
			bgIndex = -1;
			var bgImage = "";
			for (var i=0;i<photos.length ;i++ )
			{
				var photo = jQuery(photos[i]);
				if (getMediaType(photo.attr("data-url")) == "i")
				{
					bgIndex = i;
					bgImage = photo.attr("data-url");
					break;
				}
			}

			bglayerinner.css("left" , gallery.width());

			if (bgImage != "")
			{
				var img = new Image();
				// call this function after it's loaded
				img.onload = function() 
				{
					var imgTag = bglayerinner.children("img");
					imgTag.attr("width", bgLayer.width());
					imgTag.attr("height", bgLayer.height());
					imgTag.attr("src", img.src);
					bglayerinner.stop().animate({"left":0}, options.animSpeed, options.easing, openAlbumStep3);
				};
				img.src = bgImage;
			}
		}

		function openAlbumStep3()
		{

			var maxX = gallery.width() - minimalMargin - options.approxWidth;
			var maxY = parseInt(albumlist.position().top) - minimalMargin - options.approxHeight;

			var isFirstVideo = true;
			var actualIndex = 0;
			var photos = jQuery(albums[albumIndex]).children();
			for (var i=0;i<photos.length ;i++ )
			{
				if (i == bgIndex)
				{
					continue;
				}
				var row = Math.floor(actualIndex/options.columns);
				var column = actualIndex%options.columns;

				if (row >= options.rows)
				{
					break;
				}

				var photo = jQuery(photos[i]);
				if (photo.attr("data-url") == bglayerinner.children("img").attr("url"))
				{
					continue;
				}

				var mediaWidth = options.approxWidth;
				var mediaHeight = options.approxHeight;
				var mediatag = medialayer.find("#media"+photo.attr("data-umgid"));
				if (mediatag.length < 1)
				{
					var mediastring = "<a id='media"+photo.attr("data-umgid") + "' data-umgid='"+photo.attr("data-umgid") + "' data-index='"+i+"' class='media";
					var mediaType = getMediaType(photo.attr("data-url"));
					if (mediaType == "i")
					{
						mediastring += "' href='"+photo.attr("data-url")+"' target='_blank'";
						mediastring += "'>";
						mediastring += "<img alt='' src='"+photo.attr("data-thumb")+"' />";
					}
					else if (mediaType == "v")
					{
						mediaWidth = options.videoWidth;
						mediaHeight = options.videoHeight;

						mediastring += " richmedia'>";
						var videoTag = "";
						if (!useHtml5)
						{
							var extraParams = "";
							/*if (!doubleClickNotified)
							{
								doubleClickNotified = true;
								extraParams += "&notification=Double click me.";
							}*/
							if ((!options.autoPlayVideo) || (!isFirstVideo))
							{
								extraParams += "&autoStart=False";
							}
							if (options.showVideoControls)
							{
								extraParams += "&showControlBar=True";
							}
							videoTag = "<object allowFullScreen='True' allowScriptAccess='always' allowNetworking='all' width='"+options.videoWidth+"' height='"+options.videoHeight+"'><param name='movie' value='"+options.modulePath+"SimpleVideo.swf' /><param name='allowFullScreen' value='true' /><param name='wmode' value='transparent' /><param name='flashvars' value='video="+photo.attr("data-url")+"&sender="+instanceName+extraParams+"' /><embed src='"+options.modulePath+"SimpleVideo.swf' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' allowNetworking='all' width='"+options.videoWidth+"' height='"+options.videoHeight+"' wmode='transparent' flashvars='video="+photo.attr("data-url")+"&sender="+instanceName+extraParams+"'></embed></object>";
						}
						else
						{
							var autoStart = "true";
							if (!options.autoPlayVideo)
							{
								autoStart += "false";
							}
							videoTag = "<video id='img" + index + "' src='" + photo.attr("data-url") + "' type='video/mp4' width='" + options.videoWidth + "px' height='" + options.videoHeight + "px' autoplay='"+ autoStart +"' controls='controls' />";
						}
						mediastring += videoTag;
						isFirstVideo = false;
					}
					else if (mediaType == "" && photo.children(".htmlcontent").length > 0)
					{
						//embeded content
						mediastring += "' href='javascript:void(0);' rel='"+photo.attr("data-umgid")+"'";
						mediastring += "'>";
						mediastring += "<img alt='' src='"+photo.attr("data-thumb")+"' />";
					}
					//no audio support
					/*else if (mediaType == "a")
					{
						mediaWidth = options.videoWidth;
						mediaHeight = options.videoHeight;

						mediastring += " richmedia'>";
						var videoTag = "";
						if (!useHtml5)
						{
							var extraParams = "";
							if (options.showVideoControls)
							{
								extraParams += "&showControlBar=True";
							}
							videoTag = "<object allowFullScreen='True' allowScriptAccess='always' allowNetworking='all' width='"+options.videoWidth+"' height='"+options.videoHeight+"'><param name='movie' value='"+options.modulePath+"SimpleAudio.swf' /><param name='allowFullScreen' value='true' /><param name='wmode' value='transparent' /><param name='flashvars' value='video="+photo.attr("data-url")+"&sender="+instanceName+extraParams+"' /><embed src='"+options.modulePath+"SimpleAudio.swf' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' allowNetworking='all' width='"+options.videoWidth+"' height='"+options.videoHeight+"' wmode='transparent' flashvars='video="+photo.attr("data-url")+"&sender="+instanceName+extraParams+"'></embed></object>";
						}
						else
						{
							var autoStart = "true";
							if (!options.autoPlayVideo)
							{
								autoStart += "false";
							}
							videoTag = "<audio id='img" + index + "' src='" + photo.attr("data-url") + "' type='audio/mp3' width='" + options.videoWidth + "px' height='" + options.videoHeight + "px' autoplay='"+ autoStart +"' controls='controls' />";
						}
						mediastring += videoTag;
					}*/
					mediastring += "<span class='title'><span class='titleinner'>"+photo.attr("data-title")+"</span></span></a>";
					medialayer.append(mediastring);

					mediatag = jQuery(medialayer.find(".media")[medialayer.find(".media").length - 1]);

					mediatag.click(mediaOnClick);
				}
				else
				{
					mediaWidth = mediatag.width();
					mediaHeight = mediatag.height();
					mediatag.show();
				}

				var mediaX;
				var mediaY;
				if (photo.attr("data-position"))
				{
					mediaY = photo.attr("data-position").split(",")[0]*1;
					mediaX = photo.attr("data-position").split(",")[1]*1;
				}
				else
				{
					mediaX = column * columnWidth + (columnWidth - mediaWidth)/2;
					mediaY = row * rowHeight + (rowHeight - mediaHeight)/2;

					if (options.randomicity != 0)
					{
						var mediaXOffset = getOffset();
						var rounds = 0;
						while (mediaX + mediaXOffset <=minimalMargin || mediaX + mediaXOffset > maxX)
						{
							if (rounds >= 5)
							{
								break;
							}
							mediaXOffset = getOffset();
							rounds += 1;
						}
						var mediaYOffset = getOffset();
						rounds = 0;
						while (mediaY + mediaYOffset <=minimalMargin || mediaY + mediaYOffset > maxY)
						{
							if (rounds >= 5)
							{
								break;
							}
							mediaYOffset = getOffset();
							rounds += 1;
						}

						mediaX += mediaXOffset;
						mediaY += mediaYOffset;
					}
				}

				mediatag.css("top", mediaY).css("left", mediaX);
				actualIndex ++;
			}
			medialayer.css("left" , gallery.width());
			medialayer.stop().animate({"left":0}, options.animSpeed, options.easing);

			if (options.editable)
			{
				var layoutMode = gallery.children(".layoutMode");
				var saveLayout = gallery.children(".saveLayout");
				if (layoutMode.length < 1)
				{
					gallery.append("<a class='layoutMode' href='javascript:void(0);'>Adjust Layout</a><a class='saveLayout'' href='javascript:void(0);' >Save New Layout</a>");
					layoutMode = gallery.children(".layoutMode");
					saveLayout = gallery.children(".saveLayout");
					saveLayout.hide();

					layoutMode.click(function()
					{
						var medias = medialayer.find(".media:visible");
						medias.unbind("click");
						medias.click(function(){return false;});
						medias.css("cursor","move");
						medias.draggable({ disabled: false });
						layoutMode.hide();
						saveLayout.show();
						isLayoutMode = true;
					});

					saveLayout.click(function(){
						var medias = medialayer.children(".media:visible");
						var coordinates = "";
						for (var i=0;i<medias.length ;i++ )
						{
							var media = jQuery(medias[i]);
							if (coordinates!="")
							{
								coordinates += "|";
							}
							coordinates += media.attr("data-umgid")+":"+media.position().top+","+media.position().left;
						}
						if (typeof(WST_SaveLayout) != "function")
						{
							alert("This feature is not implemented.");
						}
						else
						{
							WST_SaveLayout(coordinates);
						}
					});
				}
				else
				{
					var medias = medialayer.find(".media:visible");
					saveLayout.hide();
					layoutMode.show();
					isLayoutMode = false;
					medias.unbind("click");
					medias.click(mediaOnClick);
					medias.css("cursor","");
					medias.draggable({ disabled: true });
				}
			}
		}

		function mediaOnClick()
		{
			var media = jQuery(this);
			if (media.hasClass("richmedia"))
			{
				return;
			}

			if (typeof(UPG_onPhotoLoad) != "undefined")
			{
				UPG_onPhotoLoad(media.attr("data-umgid"));
			}

			loading.css("left", media.position().left + media.width() / 2);
			loading.css("top", media.position().top + media.height() / 2);
			loading.show();

			var srcElement = jQuery(jQuery(albums[albumIndex]).children()[media.attr("data-index")]);

			currentMediaTitle = srcElement.attr("data-title");
			currentMediaLink = srcElement.attr("data-link");
			if (media.children(".description").length > 0)
			{
				currentMediaDescription = srcElement.children(".description").html();
			}
			else
			{
				currentMediaDescription = srcElement.attr("data-description");
			}

			if (media.attr("rel"))
			{
				loading.hide();
				var mediaNode = jQuery(".photo[data-umgid*='"+media.attr("rel")+"']");
				showHtmlInLightbox(mediaNode.children(".htmlcontent").html());
			}
			else
			{
				var img = new Image();
				// call this function after it's loaded
				img.onload = function() 
				{
					loading.hide();
					showImgInLightbox(img);
				};
				img.src = media.attr("href");
			}

			return false;
		}

		function getOffset()
		{
			return Math.random() * options.randomicity * 2 - options.randomicity;
		}
		
		function getResizedResolution(obj)
		{
			var xRatio = obj.width / obj.maxWidth;
			var yRatio = obj.height / obj.maxHeight;
			var ratio = Math.max(xRatio, yRatio);
			var newWidth = Math.round(obj.width / ratio);
			var newHeight = Math.round(obj.height / ratio);
			obj.newWidth = newWidth;
			obj.newHeight = newHeight;
			return;
		}

		function updateMediaMeta()
		{
			info.children(".title").html(currentMediaTitle);
			info.children(".description").html(currentMediaDescription);
			if (!currentMediaLink)
			{
				more.attr("href", "");
				more.hide();
			}
			else
			{
				more.attr("href", currentMediaLink);
				more.show();
			}
		}

		function alignlbborder()
		{
			var lbborder = lbouter.outerWidth(true)-lbouter.width();
			var outerWidth = parseInt(info.css("left")) + info.width();
			lbouter.css("width",  outerWidth);
			if ( lbouter.width() < outerWidth)
			{
				lbouter.css("width",  outerWidth+outerWidth-lbouter.width());
				//10px smaller than expected width when work in IE");
			}
			//alert(lbouter.width()+"/"+outerWidth);

			lbouter.css("left", (lightbox.width() - lbouter.outerWidth(true)) / 2);
			lbouter.css("top", (lightbox.height() - lbouter.outerHeight(true)) / 2);
		}

		function showHtmlInLightbox(htmlcontent)
		{
			lightbox.stop().animate({"top":0}, options.animSpeed, options.easing);
			var toInject = jQuery(htmlcontent)
			lbinner.html("");
			lbinner.append(toInject);

			updateMediaMeta();

			info.css("height", lbinner.height());

			info.css("left", toInject.width());
			info.removeClass("withbg");
			alignlbborder();
		}

		function showImgInLightbox(img)
		{
			lightbox.stop().animate({"top":0}, options.animSpeed, options.easing);
			var size ={"width":img.width,"maxWidth":lightbox.width() * .9,"height":img.height,"maxHeight":lightbox.height() * .9};
			getResizedResolution(size);
			var toInject = "<img alt='' src='"+img.src+"' width='"+size.newWidth+"' height='"+size.newHeight+"' />";
			lbinner.html(toInject);

			updateMediaMeta();

			info.css("height", lbinner.height());

			if (size.newWidth + options.infoWidth < lightbox.width() *.9)
			{
				info.css("left", size.newWidth);
				info.removeClass("withbg");
			}
			else
			{
				info.css("left", size.newWidth - options.infoWidth);
				info.addClass("withbg");
			}
			alignlbborder();
		}

		function closeLightbox()
		{
			lightbox.stop().animate({"top":lightbox.height()*-1}, options.animSpeed, options.easing);
		}


		//OK, let's rock
		buildAlbumList();
		if (albums.length > 0)
		{
			if (options.defaultAlbum > 0)
			{
				for (var i=0;i<albums.length ;i++ )
				{
					if (jQuery(albums[i]).attr("data-umgid") == options.defaultAlbum)
					{
						openAlbum(i);
						break;
					}
					else if (i == albums.length-1)
					{
						//last item
						openAlbum(0);
					}
				}
			}
			else
			{
				openAlbum(0);
			}
		}
		loading.hide();
		lbinner.click(function(){
			closeLightbox();
		});
		close.click(function(){
			closeLightbox();
		});
		lbinner.click(function(){
			closeLightbox();
		});
		info.css("width", options.infoWidth);
		if (options.openLinkInNewWindow)
		{
			more.attr("target", "_blank");
		}
		if (options.lightboxBackground)
		{
			lbouter.css("background-color", "#"+options.lightboxBackground);
		}

		return;
  });
 };
})(jQuery);

