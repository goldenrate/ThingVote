/*
 * UMG WidescreenTour2 Script for Ultra Media Gallery 6
 * By Pengcheng Rong (rongers@hotmail.com, service@bizmodules.net)
 * Copyright (c) 2010 Pengcheng Rong
 * All rights reserved, donot use this script library out of Ultra Media Gallery.
*/

function umgStack(moduleId)
{
	if (moduleId * 1 <= 0)
	{
	    alert("Invalid gallery ID");
		return;
	}

	var _this=this;
	var loadedImages = 0;
	var currentPhoto = -1;
	var autoPlayHandler = -1;
	var instanceName = "umgStack";
	var isLoading = false;
	
	var autoPlay = true;
	var showButtons = true;
	var showCaption = true;
	var backgroundColor;
	
	var slideTimePassed = 0;
	var autoHideTimeout = 5;
	var slideTimeout = 5;
	
	var modulePath = "";	
	
	var glbprefix = "#umg_stack" + moduleId;
	var gallery = jQuery(glbprefix);
	var medias = jQuery(glbprefix + " .datahtml .media");

	var stack = jQuery(glbprefix + " .stack");
	var caption = jQuery(glbprefix + " .caption");
	var buttons = jQuery(glbprefix + " .buttons");
	var loading = jQuery(glbprefix + " .loading");

	var cordinates=[{x:130,y:122},{x:31,y:77},{x:230,y:48}];
	var flyIn={x:130,y:123};
	var flyOut={x:gallery.width(),y:123};

	this.play = function(params)
	{
		if (params)
		{
		    autoPlay = params.autoPlay == true;
		    showButtons = params.showButtons == true;
		    showCaption = params.showCaption == true;
			backgroundColor = params.backgroundColor;
			if (backgroundColor == "")
			{
				backgroundColor = "333333";
			}
		    
			if (params.playSpeed)
			{
			    slideTimeout = params.playSpeed * 1;
			}
			if (params.modulePath)
			{
			    modulePath = params.modulePath;
			}
		}

		jQuery(glbprefix + " .datahtml").css("display", "none");
		gallery.css("background-color", "#"+backgroundColor);

		if (medias.length < 2)
		{
			showButtons=false;
			autoPlay=false;
		}
		if (medias.length < 1)
		{
			loading.hide();
		}

		if (showButtons)
		{
		    var prev = buttons.children(".prev");
		    var next = buttons.children(".next");
    		
		    prev.click(function(){
		        _this.stopAutoPlay();
		        _this.loadPhotoAt(currentPhoto -1);
		    });
    		
		    next.click(function(){
		        _this.stopAutoPlay();
		        _this.loadPhotoAt(currentPhoto +1);
		    });
		}
		else
		{
		    buttons.hide();
		}

		if (!showCaption)
		{
			caption.hide();
		}

		for (var i=0;i<medias.length;i++ )
		{
			var index = i;
			var container;
			var media = jQuery(medias[i]);
			var imageUrl = media.children(".image").attr("src");

			var content ="";
			if (imageUrl!="")
			{
				content = "<img class='image' style='display:none;' index='"+index+"' />";
			}
			else
			{
				var description = media.children(".description").html();
				content = description;
			}

			var link = media.children(".link").attr("href");
			var strItem = "<div id='img" + index + "' style='position:absolute;background-color:#"+backgroundColor+";'>";
			if (link != "" && link != undefined)
			{
				strItem += "<div class='inner' style='cursor:pointer;' onclick='document.location.href=\""+link+"\";'>" + content + "</div>";
			}
			else
			{
				strItem += "<div class='inner'>" + content + "</div>";
			}
			strItem += "</div>";

		    stack.append(strItem);
		    container = stack.find("#img" + index);

			if (imageUrl != "")
			{
				var img = new Image();
				img.index = i;
				img.container = container;

				// call this function after it's loaded
				img.onload = function() 
				{
					_this.alignPhoto(this.container, this);
						
					_this.photoLoaded(this.index);                    
				};
				img.src = imageUrl;
			}
		}
	}
	
	this.stopAutoPlay = function()
	{
	    if (autoPlayHandler < 0) return;
	    
		window.clearInterval(autoPlayHandler);
		autoPlayHandler = -1;
	}
	
	this.startAutoPlay = function()
	{
	    if (autoPlayHandler > 0)
	    {
			this.stopAutoPlay();
		    slideTimePassed = 0;
	    }
	    else
	    {
		    autoPlayHandler = window.setInterval(instanceName + moduleId + ".onInterval()", 1000);
		}
	}
	
	this.onInterval = function()
	{
		if (isLoading) return;
		slideTimePassed += 1;
		if (slideTimePassed >= slideTimeout)
		{
			slideTimePassed = 0;
			
			this.loadPhotoAt(currentPhoto + 1);
		}
	}

	this.getResizedResolution = function(obj)
	{
		var xRatio = obj.width / obj.maxWidth;
		var yRatio = obj.height / obj.maxHeight;
		var ratio = /*fullImage*/0?Math.max(xRatio, yRatio):Math.min(xRatio, yRatio);
		var newWidth = Math.round(obj.width / ratio);
		var newHeight = Math.round(obj.height / ratio);
		obj.newWidth = newWidth;
		obj.newHeight = newHeight;
		return;
	}
    
	this.getStackOffset = function(index, baseIndex)
	{
		if (index >= baseIndex)
		{
			return index-baseIndex;
		}
		else
		{
			return index + medias.length - baseIndex;
		}
	}
	
	this.loadPhotoAt = function(index)
	{
	    if (index == currentPhoto) return;
	    
		if (index < 0) index = medias.length - 1;
		if (index >= medias.length) index = 0;
		slideTimePassed = 0;

		var isLoadingNext = false;
		if (index == currentPhoto + 1 || (index == 0 && currentPhoto == medias.length-1))
		{
			isLoadingNext = true;
		}

		for (var i=0;i<medias.length; i++ )
		{
			var stackOffset = this.getStackOffset(i, index);
			//alert("stackOffset="+stackOffset);

			var item = jQuery(stack.find("#img" + i));
			item.css("z-index", medias.length - stackOffset);
			if (stackOffset ==  medias.length-1 && isLoadingNext)
			{
				if (currentPhoto >= 0)
				{
					//fly out
					item.css("z-index", medias.length + 1);
					item.animate({"left":flyOut.x, "top":flyOut.y}, 350, 'easeInBack');
				}
				else
				{
					//the 1st image to be displayed, no need to fly out anything
				}
			}
			else if (stackOffset < cordinates.length)
			{
				item.show();
				var easing = "swing";
				//if this item was not visible, align it at first
				if (stackOffset == cordinates.length-1 && isLoadingNext)
				{
					//the last item of the stack. align it to flyIn at first
					item.css("left", flyIn.x);
					item.css("top", flyIn.y);
				}
				else if (stackOffset == 0 && !isLoadingNext)
				{
					//the first item of the stack. align it to flyOut at first
					item.css("left", flyOut.x);
					item.css("top", flyOut.y);
					easing = "easeOutBack";
				}
				//here we go
				var cordinate = cordinates[stackOffset];
				//alert("stackOffset="+stackOffset+",start pos:" + item.css("left")+"/"+item.css("top") + ", end pos:" + cordinate.x +"/"+cordinate.y);
				var transparency = .25 + (cordinates.length-stackOffset)/cordinates.length*.75;
				item.children(".inner").fadeTo("fast", transparency);
				item.animate({"left":cordinate.x, "top":cordinate.y}, 350, easing);
			}
			else
			{
				item.hide();
			}
		}

		currentPhoto = index;

		loadCaption();
	}
	
	this.photoLoaded = function(newIndex)
	{
		//alert("image " + newIndex +" loaded");
		loadedImages += 1;
	    var container = stack.find("#img" + newIndex);
	    //container.children("img").fadeTo("slow", 1);
		container.find("img").reflect({ height:.3, opacity:.5 });
		if (loadedImages >= medias.length / 2 && loading.is(":visible"))
		{
			loading.hide();
			_this.loadPhotoAt(0);

			if (autoPlay)
			{
				_this.startAutoPlay();
			}
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
	        container.css("width", size.newWidth);
	        container.css("height", size.newHeight);
        }
        else
        {
	        container.css("width", img.width);
	        container.css("height", img.height);
        }
        var left = Math.floor((maxWidth - container.width()) / 2);
        container.css("left", left);
		var top = Math.floor((maxHeight - container.height()) / 2);
        container.css("top", top);
        //container.attr("normalLeft", left);

		var imgElement = jQuery(container.find("img"));
		imgElement.attr("src", img.src);
		imgElement.show();
        
	}
	
	function loadCaption()
	{
		if (!showCaption)
		{
			return;
		}

	    caption.empty();
	    caption.css({left:"", top:"", width:""});
	    
		var title = jQuery(medias[currentPhoto]).children(".title").html();
		var description = jQuery(medias[currentPhoto]).children(".description").html();
	    
	    if (!title)
	    {
	        caption.hide();
	        return;
	    }
	    else
	    {
	        caption.show();
	    }

		var strCaption = "<div class='captionHead'>"+title+"</div>";
		if (description != "")
		{
			strCaption += "<div>"+description+"</div>"
		}
		caption.html(strCaption);
	}
}