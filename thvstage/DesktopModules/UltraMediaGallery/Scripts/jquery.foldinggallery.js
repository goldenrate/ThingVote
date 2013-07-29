/*
 * UMG WidescreenTour2 Script for Ultra Media Gallery 6, 7
 * By Pengcheng Rong (rongers@hotmail.com, service@bizmodules.net)
 * Copyright (c) 2010 - 2011 Pengcheng Rong
 * All rights reserved, do not use this script library out of Ultra Media Gallery expect directly licensed by the copyright owner.
*/


(function(jQuery){
 jQuery.fn.foldinggallery = function(options) {
    
  var defaults = {
	autoPlay:true, 
	loopPlay:true, 
	autoHide:true, 
	autoPlayVideo:true, 
	foldAndButtons:'fold', 
	captionStyle:'linebyline', 
	logoWidth:142, 
	logoHeight:80, 
	menuWidth:200, 
	playSpeed:5, 
	modulePath:'', 
	showMenu:'right'
  };
  
  var options = jQuery.extend(defaults, options);
    
	return this.each(function() {

		var gallery = jQuery(this);
		//create necessary html documents to host images, albums, and buttons.
		gallery.append("<div class='images'></div><div class='caption'></div><div class='thumbnails'><div class='inner'><div class='innerinner'></div></div></div><div class='albums'></div><div class='loading'></div><div class='buttons'><div class='prev'></div><div class='play'></div><div class='next'></div></div>");

		//Identifying html elements to jquery objects.
		var albums = gallery.children(".albums");
		var datahtml = gallery.children(".datahtml");
		var dataalbums = datahtml.children(".album");
		var thumbnails = gallery.children(".thumbnails");
		var thumbnailsinner = gallery.find(".thumbnails .inner");
		var thumbnailsinnerinner = gallery.find(".thumbnails .inner .innerinner");
		var images = gallery.children(".images");
		var caption = gallery.children(".caption");
		var buttons = gallery.children(".buttons");
		var play = buttons.children(".play");

		//remove preview contents
		datahtml.hide();
		gallery.children(".preview").remove();


		//Define internal properties
		var instanceName = gallery.attr("ID");
		var currentAlbum = -1;
		var currentPhoto = -1;
		var autoPlayStartIndex = 0;
		var autoPlayHandler = -1;
		var autoHideHandler = -1;
		var noActionsSeconds = 0;
		var isLoading = false;
		
		var slideTimePassed = 0;
		var autoHideTimeout = 5;
		var slideTimeout = 5;
		var logoWidth;
		var logoHeight;
		
		var modulePath = "";
		var showMenu = "left";
		var defaultAlbum;
		
		var thumblistResized = false;
		var doubleClickNotified = false;
		//var autoHide = true;
		var fullImage = true;
		var foldCoverRatio = .858;
		var comingItem = null;
		var folding = false;

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










		//Member methods
		this.albumsTop = function()
		{
			if (albums.css("visibility") != "hidden")
			{
				return gallery.height() - 4 - logoHeight;
			}
			else
			{
				return gallery.height();
			}
		}
		
		this.showControls = function()
		{
			noActionsSeconds = 0;
			var left = Math.ceil(thumbnails.position().left);
			if (left < 0)
			{
				thumbnails.animate({"left":0}, "slow");
			}
			else if (left >= gallery.width())
			{
				thumbnails.animate({"left":gallery.width() - thumbnails.width()}, "slow");
			}
			
			if (albums.position().top > gallery.height() - albums.height())
			{
				albums.animate({"top":gallery.height() - albums.height()}, "slow");
			}
		}
		
		this.stopAutoHide = function()
		{
			if (autoHideHandler < 0) return;
			
			window.clearInterval(autoHideHandler);
			autoHideHandler = -1;
		}
		
		this.stopAutoPlay = function()
		{
			if (autoPlayHandler < 0) return;
			
			window.clearInterval(autoPlayHandler);
			autoPlayHandler = -1;
			play.removeClass("pause");
			play.removeClass("pauseactive");
			play.removeClass("playactive");
		}
		
		this.autoPlay = function(resetIsLoading)
		{
			if (autoPlayHandler > 0)
			{
				this.stopAutoPlay();
				slideTimePassed = 0;
			}
			else
			{
				if (resetIsLoading) isLoading = false;
				play.addClass("pause");
				autoPlayStartIndex = currentPhoto;
				autoPlayHandler = window.setInterval(instanceName + ".onInterval()", 1000);
			}
		}
		
		this.onInterval = function()
		{
			if (isLoading) return;
			slideTimePassed += 1;
			if (slideTimePassed >= slideTimeout)
			{
				slideTimePassed = 0;
				
				if (currentPhoto + 1 >= thumbnailsinnerinner.children(".thumbnail").length)
				{
					if (!options.loopPlay)
					{
						//should I stop?
						if (autoPlayStartIndex > 0)
						{
							//the auto play starts from the middle of the thumb list, so go one more cycle.
							autoPlayStartIndex = 0;
							this.loadPhotoAt(currentPhoto + 1);
						}
						else
						{
							this.stopAutoPlay();
						}
					}
					else
					{
						this.loadPhotoAt(currentPhoto + 1);
					}
				}
				else
				{
					this.loadPhotoAt(currentPhoto + 1);
				}
			}
		}

		this.onAutoHideInterval = function()
		{
			noActionsSeconds +=1;
			if (noActionsSeconds > autoHideTimeout)
			{
				//hide it.
				var left = Math.ceil(thumbnails.position().left);
				if (left <= 0)
				{
					thumbnails.animate({"left":thumbnails.width() * -1}, "slow");
				}
				else if (left >= gallery.width() - thumbnails.width())
				{
					thumbnails.animate({"left":gallery.width()}, "slow");
				}
				
				var tooltipHeight = jQuery(albums.children(".tooltip")[0]).height();
				albums.animate({"top":gallery.height()+tooltipHeight}, "slow");
			}
		}
		
		this.getResizedResolution = function(obj)
		{
			var xRatio = obj.width / obj.maxWidth;
			var yRatio = obj.height / obj.maxHeight;
			var ratio = fullImage?Math.max(xRatio, yRatio):Math.min(xRatio, yRatio);
			var newWidth = Math.round(obj.width / ratio);
			var newHeight = Math.round(obj.height / ratio);
			obj.newWidth = newWidth;
			obj.newHeight = newHeight;
			return;
		}

		this.showAlbumTitle = function(album)
		{
			var key = "tooltip" + album.attr("index");
			var title = albums.children("#"+key);
			if (title.length < 1)
			{
				albums.append("<div class='tooltip' id='"+key+"'><div class='left' /><div class='center'>"+album.attr("title")+"</div><div class='right' /></div>");
				title = albums.children("#"+key);
				title.css("top", album.position().top - title.height());
				title.css("left", album.position().left + (album.width() - title.width() ) / 2);
				title.show();
			}
			else
			{
				title.show();
			}
		}
		
		this.hideAlbumTitle = function(album)
		{
			var index = album.attr("index");
			if (index == currentAlbum)
			{
				return;
			}
			var key = "tooltip" + index;
			var title = albums.children("#"+key);
			if (title.length > 0)
			{
				title.hide();
			}
		}
		
		this.loadAlbum = function(index)
		{
			currentAlbum = index;
			currentPhoto =  -1;
			var allAlbums = albums.children(".album");
			for (var i=0;i<allAlbums.length;i++)
			{
				if (currentAlbum == i)
					_this.showAlbumTitle(jQuery(allAlbums[i]));
				else
					 _this.hideAlbumTitle(jQuery(allAlbums[i]));
			}
			
			
			images.empty();
			thumbnailsinnerinner.empty();
			var fold = gallery.children(".fold");
			if (fold.length > 0)
			{
				fold.remove();
			}
			var dataphotos = jQuery(dataalbums[currentAlbum]).children(".photo");
			for (var i=0;i<dataphotos.length;i++ )
			{
				var photo = jQuery(dataphotos[i]);
				var className = "thumbnail";
				if (i == dataphotos.length - 1) className+= " lastItem";
				
				thumbnailsinnerinner.append("<div class='"+className+"' index='"+i+"'>"+photo.attr("title")+"</div>");
			}
			
			if(thumbnailsinnerinner.height() < thumbnailsinner.height())
			{
				thumbnailsinnerinner.css("top", (thumbnailsinner.height() - thumbnailsinnerinner.height()) / 2 );
			}
			else
			{
				thumbnailsinnerinner.css("top", 0 );
			}
			
			var thumbnaillist = thumbnailsinnerinner.children(".thumbnail");
			thumbnaillist.hover(function(){var thumbnail=jQuery(this);if (thumbnail.attr("index") != currentPhoto)jQuery(this).addClass("hover");}, function(){jQuery(this).removeClass("hover");});
				
			thumbnaillist.click(function(){
				_this.stopAutoPlay();
				_this.loadPhoto(jQuery(this));		    
			});
			
			if (!thumblistResized)
			{
				thumblistResized = true;
				var itemHeight = jQuery(thumbnaillist[0]).height();
				if (itemHeight <= 0)
				{
					itemHeight = 20;
				}
				thumbnailsinner.css("height", thumbnailsinner.height() - thumbnailsinner.height() % itemHeight);
			}
			
			_this.loadPhotoAt(0);
			
			if (options.autoPlay && autoPlayHandler <= 0) _this.autoPlay(false);
		}
		
		this.isVideo = function(linkUrl)
		{
			if (linkUrl.indexOf(".") > 0)
			{
				var extension = linkUrl.toLowerCase().substring(linkUrl.length - 4, linkUrl.length);
				if (extension == ".mp4" || extension == ".flv")
				{
					return true
				}
			}
			
			return false;
		}
		
		this.loadPhotoAt = function(index)
		{
			if (index == currentPhoto) return;
			
			var thumbnaillist = thumbnailsinnerinner.children(".thumbnail");
			if (index < 0) index = thumbnaillist.length - 1;
			if (index >= thumbnaillist.length) index = 0;
			
			slideTimePassed = 0;
			var item = jQuery(thumbnaillist[index]);
			this.loadPhoto(item);
		}
		
		this.loadPhoto = function(sender)
		{
			if (folding) return;
			var newIndex = sender.attr("index") * 1;
			if (newIndex == currentPhoto) return;
			
			
			

			isLoading = true;
			var previousContainer = images.find("#img"+currentPhoto);
			var dataphotos = jQuery(dataalbums[currentAlbum]).children(".photo");
			var rawdata = jQuery(dataphotos[newIndex]);
			var imageUrl = rawdata.attr("image");
			var link = rawdata.attr("link");
			var target = rawdata.attr("target");
			
			if (options.foldEffect)
			{
				if ((newIndex ==0 && currentPhoto == dataphotos.length - 1) || newIndex == currentPhoto + 1)
				{
					//ok
				}
				else
				{
					//exception:the user chooosed not to see the folded photo, we must clear it.
					var foldedIndex = currentPhoto + 1;
					if (foldedIndex >= dataphotos.length) foldedIndex = 0;
					var foldedItem = images.find("#img"+ foldedIndex );
					foldedItem.hide();
					foldedItem.parent().removeClass("nextItem");
					foldedItem.parent().css({left:0, width:"auto"});
					foldedItem.css("left", foldedItem.attr("normalLeft"));
				}
			}
			
			var container = images.find("#img"+newIndex);
			if (container.length == 0)
			{
				var imageUrl = rawdata.attr("image");
				if (_this.isVideo(imageUrl))
				{
					container = _this.loadVideo(newIndex, imageUrl, container, null);

					_this.photoLoaded(newIndex);
				}
				else
				{
					images.append(this.getImageNode(newIndex, rawdata));
					container = images.find("#img" + newIndex);

					var img = new Image();

					// call this function after it's loaded
					img.onload = function() 
					{
						_this.alignPhoto(container, img);
						
						_this.photoLoaded(newIndex);
						
					};
					img.src = imageUrl;
				}
			}
			else
			{
				//this photo is either loaded or preloaded
				if (options.foldEffect && ((newIndex == 0 && currentPhoto == dataphotos.length - 1) || newIndex == currentPhoto + 1) )
				{
					//this photo is folded and need to expand
					var target = (gallery.width() + gallery.height()) / foldCoverRatio;
					var maximum = gallery.width();
					var containerDiv = container.parent();
					var fold = gallery.children(".fold");
					folding = true;
					if (showMenu != "left")
					{
						fold.animate({"width":target, "height":target}, {step: function(now, fx) {var syncTo = Math.floor(now * foldCoverRatio); if (syncTo > maximum) syncTo = maximum; containerDiv.css({width:syncTo, height:syncTo})}, duration:"slow", complete:function(){folding = false; fold.css({left:0, top:0, width:0, height:0});_this.photoLoaded(newIndex);}});
					}
					else
					{
						//reversed angle
						var galleryWidth = gallery.width();
						var containerNormalLeft = container.attr("normalLeft");
						fold.animate({"width":target, "height":target}, {step: function(now, fx) {fold.css("left",galleryWidth - now);var syncTo = Math.floor(now * foldCoverRatio); if (syncTo > maximum) syncTo = maximum; containerDiv.css({width:syncTo, height:syncTo, left:galleryWidth-syncTo}); container.css("left", containerNormalLeft - (galleryWidth-syncTo));}, duration:"slow", complete:function(){folding = false; fold.css({left:0, top:0, width:0, height:0});_this.photoLoaded(newIndex);}});
					}
				}
				else
				{
				   _this.photoLoaded(newIndex);
				}
			}
		}

		this.getImageNode = function(index, rawdata)
		{
			var link = rawdata.attr("link");
			var target = rawdata.attr("target");
			var nodeStart = "";
			var nodeEnd = "";
			if (link != undefined && link!="")
			{
				var targetAttr = "";
				if (target != undefined && target!= "")
				{
					targetAttr = "target='"+target+"'";
				}
				nodeStart = "<a href='" + link + "' style='display:block;' "+targetAttr+">";
				nodeEnd = "</a>";
			}
			else
			{
				nodeStart = "<div>";
				nodeEnd = "</div>";
			}

			return nodeStart + "<img class='image' id='img" + index + "' style='display:none; opacity:0; border:0px;' index='"+index+"' />" + nodeEnd;

		}
		
		this.photoLoaded = function(newIndex)
		{
			if (currentPhoto >= 0)
			{
				var previousContainer = images.find("#img"+currentPhoto);
				fadePreviousItem(previousContainer);
			}
			
			var container = images.find("#img" + newIndex);
			if (options.foldEffect)
			{
				container.show();
				container.css("opacity", "");
			}
			else
			{
				container.fadeTo("slow", 1);
			}
			
			//the left is negative ins some case, not sure why.
			if(container.position().left != container.attr("normalLeft")) container.css("left", container.attr("normalLeft"));
			
			var imageUrl = container.attr("src");
			var video = container.attr("video");
			if(video)
			{
				if(container[0].tagName.toLowerCase() == "img")
				{
					var containerDiv = container.parent();
					containerDiv.empty();
					
					container = _this.loadVideo(newIndex, video, container, null);
				}
			}
			else
			{
				isLoading = false;
			}
			
			
		
			if (typeof(UPG_onPhotoLoad) != "undefined")
			{
				var umgid = jQuery(jQuery(dataalbums[currentAlbum]).children(".photo")[newIndex]).attr("umgid");
				UPG_onPhotoLoad(umgid);
			}
			
			if (thumbnails.is(":visible"))
			{
				var thumbnaillist = thumbnailsinnerinner.children(".thumbnail");
				jQuery(thumbnaillist[currentPhoto]).removeClass("active");
				jQuery(thumbnaillist[newIndex]).addClass("active");
				
				var scrollArea = 2;
				var needScroll = false;
				var scrollTo;
				
				var sender = jQuery(thumbnailsinnerinner.children("div")[newIndex]);
				
				if (thumbnailsinnerinner.height () >= thumbnailsinner.height())
				{
					var goingDown = newIndex > currentPhoto;
					if (sender.position().top + sender.height() + scrollArea * sender.height() + thumbnailsinnerinner.position().top >= thumbnailsinner.height() && goingDown)
					{
						needScroll = true;
						scrollTo = sender.position().top * -1 + scrollArea * sender.height();
					}
					else if (sender.position().top + thumbnailsinnerinner.position().top <= sender.height() * scrollArea && !goingDown)
					{
						needScroll = true;
						scrollTo = (thumbnailsinner.height() - sender.height() * (scrollArea+1)) - sender.position().top;
					}
					else
					{
						//
					}
					
					if (needScroll)
					{
						if (scrollTo + thumbnailsinnerinner.height() < thumbnailsinner.height())
						{
							scrollTo = thumbnailsinner.height() - thumbnailsinnerinner.height();
						}
						if (scrollTo > 0)
						{
							scrollTo = 0;
						}
						
						thumbnailsinnerinner.animate({"top":scrollTo}, "slow");
					}
				}
			}


			
			//preload next item
			var dataphotos = jQuery(dataalbums[currentAlbum]).children(".photo");
			var comingIndex = newIndex + 1;
			if (comingIndex >= dataphotos.length) comingIndex = 0;
			
			var container = images.find("#img"+comingIndex);
		   
			if (container.length < 1)
			{
				//preload currentPhoto+1;
				var rawdata = jQuery(dataphotos[comingIndex]);
				
				if (container.length == 0)
				{
					var imageUrl = rawdata.attr("image");
					
					images.append(this.getImageNode(comingIndex, rawdata));
					container = images.find("#img" + comingIndex);
					
					var img = new Image();
					if (_this.isVideo(rawdata.attr("image"))) 
					{
						container.attr("video", rawdata.attr("image"));
						imageUrl = modulePath + "css/WidescreenTour2/white.png";
						//use the name property tosave the attribute of this image element.
						img.name = "video";
					}


					// call this function after it's loaded
					img.onload = function() 
					{
						if(img.name == "video")
						{
							img.width = gallery.width();
							img.height = gallery.height();
						}

						_this.alignPhoto(container, img);
						
						//preload finished!
						_this.preloadFinished(container);
					};
					img.src = imageUrl;
				}
			}
			else
			{
				//no need to preload again.
				//align to top
				
				if (newIndex != comingIndex)
				{
					var allItems = images.find("div");
					var lastItem = jQuery(allItems[allItems.length - 1]);
					container.parent().insertAfter(lastItem);
					
					_this.preloadFinished(container);
				}
				else
				{
					//only 1 item
					container.show();
				}
			}

			
			currentPhoto = newIndex;
			loadCaption();
		}
		
		this.preloadFinished = function(comingItem)
		{
			if (options.foldEffect)
			{
				var fold = gallery.children(".fold");
				if (fold.length == 0)
				{
					var foldImage;
					if (showMenu != "left")
					{
						foldImage = "fold_upperleft.png";
					}
					else
					{
						//reversed angle
						foldImage = "fold_upperright.png";
					}
					jQuery("<img class='fold' src='"+modulePath+"css/WidescreenTour2/"+foldImage+"' />").insertBefore(thumbnails);
					fold = gallery.children(".fold");
					
			   
					fold.click(function(){
				
						_this.stopAutoPlay();
						_this.loadPhotoAt(currentPhoto +1);

					});
				}
				
				fold.css({
					left:0,
					top:0,
					width: 0, 
					height: 0
				});
				
				//coming item is an image, we need to access its parent div
				var comingDiv = comingItem.parent();
				comingDiv.addClass("nextItem");
				//got next item            
				comingDiv.css({
					left:0,
					top:0,
					width: 0, 
					height: 0
				});
				comingItem.show();
				comingItem.css("opacity", "");
				
				//it seems to be a bug of IE? if filter is not removed the image will be 1px larger than expected.
				//comingItem.removeAttr("filter");
				
				if (showMenu != "left")
				{
					var target = 60;
					fold.animate({"width":target, "height":target}, {step: function(now, fx) {var syncTo = Math.floor(now * foldCoverRatio); comingDiv.css({width:syncTo, height:syncTo})}, duration:1500});
				}
				else
				{
					//reversed angle
					var target = 60;
					var galleryWidth = gallery.width();
					comingItem.css("position", "absolute");
					fold.animate({"width":target, "height":target}, {step: function(now, fx) {fold.css("left",galleryWidth - now);var syncTo = Math.floor(now * foldCoverRatio); comingDiv.css({width:syncTo, height:syncTo, left:galleryWidth-syncTo}); comingItem.css("left", syncTo - galleryWidth);}, duration:1500});
				}
			}
			else
			{
				//the preloaded item has highest z-index, so must hide it othewise the video is not clickable
				comingItem.hide();
			}
		}
		
		this.alignPhoto = function(container, img)
		{
			var maxWidth = gallery.width();
			var maxHeight = gallery.height();

			if (img.width > maxWidth || img.height > maxHeight )
			{
				var size ={"width":img.width,"maxWidth":maxWidth,"height":img.height,"maxHeight":maxHeight};
				_this.getResizedResolution(size);
				container.attr("width", size.newWidth);
				container.attr("height", size.newHeight);
			}
			else
			{
				container.attr("width", img.width);
				container.attr("height", img.height);
			}
			if (container.height() < _this.albumsTop())
			{
				container.css("top", (_this.albumsTop() - container.height()) / 2);
			}
			else if (container.height() < gallery.height())
			{
				container.css("top", 0);
			}
			else
			{
				container.css("top", (gallery.height() - container.height()) / 2);
			}
			var left = Math.floor((maxWidth - container.width()) / 2);
			container.css("left", left);
			container.attr("normalLeft", left);
			container.attr("src", img.src);
			
		}
		
		this.loadVideo = function(index, videoUrl, container, containerDiv)
		{
			caption.hide();
			var videoTag ="";
			if (!useHtml5)
			{
				var extraParams = "";
				if (!doubleClickNotified)
				{
					doubleClickNotified = true;
					extraParams = "&notification=Double click to watch in full screen.";
				}
				if (!options.autoPlayVideo)
				{
					extraParams += "&autoStart=False";
				}
				videoTag = "<div class='image' id='img" + index + "' style='left:0px; top:0px;' ><object allowFullScreen='True' allowScriptAccess='always' allowNetworking='all' width='"+gallery.width()+"' height='"+gallery.height()+"'><param name='movie' value='"+modulePath+"SimpleVideo.swf' /><param name='allowFullScreen' value='true' /><param name='wmode' value='transparent' /><param name='flashvars' value='video="+videoUrl+"&albumsTop="+_this.albumsTop()+"&sender="+instanceName+extraParams+"' /><embed src='"+modulePath+"SimpleVideo.swf' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' allowNetworking='all' width='"+gallery.width()+"' height='"+gallery.height()+"' wmode='transparent' flashvars='video="+videoUrl+"&albumsTop="+_this.albumsTop()+"&sender="+instanceName+extraParams+"'></embed></object></div>";
			}
			else
			{
				var autoStart = "true";
				if (!options.autoPlayVideo)
				{
					autoStart += "false";
				}
				videoTag = "<video id='img" + index + "' src='" + videoUrl + "' type='video/mp4' width='" + gallery.width() + "px' height='" + gallery.height() + "px' autoplay='"+ autoStart +"' controls='controls' />";
			}
			if (!containerDiv)
			{
				//real load, this video is currently visible
				images.append(videoTag);
			}
			else
			{
				//the video is preloaded with a black image, now we replace it to the real video content.
				containerDiv.append(videoTag);
			}
			container = images.find("#img" + index);
			if (!containerDiv)
			{
				container.attr("video", videoUrl);
			}

			if (useHtml5)
			{
				var video = container[0];
				video.load();
				video.play();
				
				video.addEventListener('ended',_this.videoEnd,false); 
			}
			
			return container;
		}
		
		this.videoEnd = function()
		{
			if (useHtml5 && autoPlayHandler < 0)
			{
				_this.loadPhotoAt(currentPhoto +1);
			}
			else
			{
				isLoading = false;
				slideTimePassed = slideTimeout - 1;
			}
		}
		
		function fadePreviousItem(item)
		{
			if (item.length < 1)
			{
				return;
			}
			
			item.parent().removeClass("nextItem");


			if (options.foldEffect)
				item.hide();
			else
				item.fadeTo("slow", 0);
			
			var tagName = item[0].tagName.toLowerCase();
			if(tagName == "div" || tagName == "video")
			{
				item.remove();
				//delete this element, otherwise it continues to play and we could not control it
			}
		}
		
		function loadCaption()
		{
			caption.empty();
			caption.css({left:"", top:"", width:""});
			
			var photo = jQuery(jQuery(dataalbums[currentAlbum]).children(".photo")[currentPhoto]);
			var description = photo.attr("description");
			if (!description)
			{
				description = photo.children(".description").html()
			}
			
			if (!description)
			{
				caption.hide();
				return;
			}
			else
			{
				caption.show();
			}
			
			var alignment = "";
			var alignmentX = -1;
			var alignmentY = -1;
			var firstLine = description.substring(0, description.indexOf("\n")).toLowerCase();
			if (firstLine.charCodeAt(firstLine.length - 1) == 13 || firstLine.charCodeAt(firstLine.length - 1) == 11)
			{
				firstLine = firstLine.substring(0, firstLine.length - 1);
			}
			if (firstLine == "upperleft" || firstLine == "upperright" || firstLine == "lowerleft" || firstLine == "center" || firstLine == "lowerright")
			{
				alignment = firstLine;
			}
			else
			{
				if (firstLine.indexOf(",") > 0)
				{
					var cordinates = firstLine.split(",");
					if (cordinates[0] * 1 > 0 && cordinates[1] * 1 > 0)
					{
						alignmentX = cordinates[0] * 1;
						alignmentY = cordinates[1] * 1;
					}
				}
			}
			if (alignment != "" || (alignmentX > 0 && alignmentY > 0))
			{
				description = description.substring(description.indexOf("\n") + 1, description.length);
			}
			
			var strCaption = "";
			var spacing = 30;
			if (options.simpleCaption)
			{
				strCaption = "<div class='simple'>"+description+"</div>";
				caption.append(strCaption);
				
				if(caption.width() > gallery.width() / 3)
				{
					caption.css("width", gallery.width() / 3);
				}
			}
			else
			{
				var indent = 100;
				var lines = description.split("\n");
				for(var i=0;i<lines.length;i++)
				{
					if (lines[i] != "")
					{
						strCaption += "<div class='line' style='margin-left:"+indent*i+"px; margin-top:"+26*i+"px'><div class='left' /><div class='right'>"+lines[i]+"</div></div>";
					}
				}
				caption.append(strCaption);
			}
			
			if (alignmentX < 0 || alignmentY < 0)
			{
				var albumsTop = _this.albumsTop();
				if (alignment == "upperright")
				{
					alignmentX = gallery.width() - caption.width() - spacing;
					alignmentY = spacing;
				}
				else if (alignment == "upperleft")
				{
					alignmentX = spacing;
					alignmentY = spacing;
				}
				else if (alignment == "lowerleft")
				{
					alignmentX = spacing;
					alignmentY = albumsTop - spacing - caption.height();
				}
				else if (alignment == "center")
				{
					alignmentX = (gallery.width() - caption.width()) / 2;
					alignmentY = (albumsTop - caption.height()) / 2;
				}
				else//lowerright
				{
					alignmentX = gallery.width() - caption.width() - spacing;
					alignmentY = albumsTop - spacing - caption.height();
				}
			}

			caption.css("left", alignmentX);
			caption.css("top", alignmentY);
		}



		//OK, let's rock
		options.simpleCaption = (options.captionStyle == "" || options.captionStyle == "simple");
		options.foldEffect = (options.foldAndButtons == "" || options.foldAndButtons == "fold");
		options.showButtons = options.foldAndButtons == "buttons";
		
		if (options.logoWidth)
		{
			logoWidth = options.logoWidth;
		}
		if (options.logoHeight)
		{
			logoHeight = options.logoHeight;
		}
		if (options.menuWidth)
		{
			thumbnails.css("width", options.menuWidth);
			thumbnailsinner.css("width", options.menuWidth - thumbnailsinner.position().left * 2);
		}
		if (options.playSpeed)
		{
			slideTimeout = options.playSpeed * 1;
		}
		if (options.modulePath)
		{
			modulePath = options.modulePath;
		}
		if (options.showMenu)
		{
			showMenu = options.showMenu;
		}
		if (options.defaultAlbum)
		{
			defaultAlbum = options.defaultAlbum;
		}

		var maxAlbums = Math.floor(gallery.width() / (logoWidth + 4));
		for(var i=0; i< dataalbums.length; i++)
		{
			if (i > maxAlbums) break;
			var dataalbum = jQuery(dataalbums[i]);
			albums.append("<div class='album' index='"+i+"' title='"+dataalbum.attr("title")+"'><img style='margin-top:2px;' src='"+dataalbum.attr("logo")+"'></div>");
		}

		var as = albums.children("div");
		as.css("width", logoWidth + 4);
		as.css("height", logoHeight + 4);
		albums.css("top", gallery.height() - albums.height());
		albums.css("left", (gallery.width() - albums.width()) / 2);
		albums.css("width", 10000);
		
		if (as.length == 1)
		{
			albums.css("visibility", "hidden");
		}
		else if (as.length == 0)
		{
			albums.css("visibility", "hidden");
			thumbnails.hide();
			buttons.hide();
			alert("No slides in gallery " + gallery.attr("ID"));
			return;
		}
		else
		{
			as.click(function(){
				_this.loadAlbum(jQuery(this).attr("index"));
			});
			as.mouseover(function(){
				_this.showAlbumTitle(jQuery(this));
			});
			as.mouseout(function(){
				_this.hideAlbumTitle(jQuery(this));
			});
		}

		var top = thumbnailsinner.css("top");
		thumbnailsinner.css("height", this.albumsTop() - top.substring(0, top.indexOf("px")) * 2);

		var foundDefault=false;
		if (defaultAlbum > 0)
		{
			for (var i=0;i<as.length;i++)
			{
				if (jQuery(dataalbums[i]).attr("umgid") == defaultAlbum)
				{
					this.loadAlbum(i);
					foundDefault = true;
					break;
				}
			}
		}
		if (!foundDefault)
		{
			this.loadAlbum(0);
		}
		
		if (showMenu == "right")
		{
			thumbnails.addClass("thumbonright");
			thumbnails.css("left", gallery.width() - thumbnails.width());

			buttons.css("left", 10);
			buttons.css("top", 10);
		}
		else
		{
			buttons.css("left", gallery.width() - buttons.width() - 10);
			buttons.css("top", 10);
			
			if (showMenu == "none")
			{
				thumbnails.hide();
			}
		}
		
		if (options.showButtons)
		{
			var prev = buttons.children(".prev");
			prev.hover(function(){jQuery(this).addClass("prevactive");}, function(){jQuery(this).removeClass("prevactive");});
			play.hover(function(){jQuery(this).addClass(autoPlayHandler<0?"playactive":"pauseactive");}, function(){jQuery(this).removeClass(autoPlayHandler<0?"playactive":"pauseactive");});
			var next = buttons.children(".next");
			next.hover(function(){jQuery(this).addClass("nextactive");}, function(){jQuery(this).removeClass("nextactive");});
			
			prev.click(function(){
				_this.stopAutoPlay();
				_this.loadPhotoAt(currentPhoto -1);
			});
			
			next.click(function(){
				_this.stopAutoPlay();
				_this.loadPhotoAt(currentPhoto +1);
			});
			
			play.click(function(){
				slideTimePassed = slideTimeout - 1;
				_this.autoPlay(true);
			});		
		}
		else
		{
			buttons.hide();
		}

		if(gallery.mousewheel)
		{
			gallery.mousewheel(function(event, delta) {
				this.stopAutoPlay();
				
				if (delta > 0)
					this.loadPhotoAt(currentPhoto -1);
				else if (delta < 0)
					this.loadPhotoAt(currentPhoto +1);
				return false;
			});
		}
		
		if (options.autoHide)
		{
			autoHideHandler = window.setInterval(instanceName + ".onAutoHideInterval()", 1000);
			gallery.mouseover(this.showControls, null);
		}
		//Finished plugin body.

		return;
  });
 };
})(jQuery);

