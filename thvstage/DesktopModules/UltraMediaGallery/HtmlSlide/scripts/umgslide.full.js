/*
 * UMG Slide Script for Ultra Media Gallery 6
 * By Pengcheng Rong (rongers@hotmail.com, service@bizmodules.net)
 * Copyright (c) 2010 Pengcheng Rong
 * All rights reserved, donot use this script library out of Ultra Media Gallery.
*/

function umgSlide(source, dest)
{
	if (source.substring(0,1)!="#")
	{
		source = "#" + source;
	}
	source += " ";

	this.source = source;
	this.dest = dest;

	var _this=this;

	var umg_interval;
	var umg_playing = false;
	var umg_isloading = false;

	this.umg_instancename = "slide";
	this.umg_slideTimeout = 5;
	this.umg_slideTimePassed = 0;
	this.umg_index = -1;
	this.umg_naviInited = false;
	this.umg_xofysplitter = " / ";
	this.umg_mouseoverbehavior = "";
	this.umg_loopplay = true;

	//Hide the source 
	jQuery(source).css("display", "none");

	//identify source controls
	this.umg_freetextslide = false;
	this.umg_images = jQuery(source + " .image");
	this.umg_titles = jQuery(source + " .title");
	this.umg_descriptions = jQuery(source + " .description");
	this.umg_links = jQuery(source + " .link");
	this.umg_tags = jQuery(source + " .tags");
	this.umg_authors = jQuery(source + " .author");
	this.umg_takendates = jQuery(source + " .takendate");
	this.umg_umgids = jQuery(source + " .umgid");

	//identify dest controls
	this.umg_container = jQuery("#umg_container" + dest);
	this.umg_largelist = jQuery("#umg_largelist" + dest);
	this.umg_large = jQuery("#umg_large" + dest);
	this.umg_caption = jQuery("#umg_caption" + dest);
	this.umg_captiontext = jQuery("#umg_captiontext" + dest);
	this.umg_more = jQuery("#umg_more" + dest);
	this.umg_buttons = jQuery("#umg_buttons" + dest);
	this.umg_prev = jQuery("#umg_prev" + dest);
	this.umg_next = jQuery("#umg_next" + dest);
	this.umg_play = jQuery("#umg_play" + dest);
	this.umg_navi = jQuery("#umg_navi" + dest);
	this.umg_countdown = jQuery("#umg_countdown" + dest);
	this.umg_loading = jQuery("#umg_loading" + dest);
	this.umg_thumbs = jQuery("#umg_thumbs" + dest);
	this.umg_thumbslist = jQuery("#umg_thumbslist" + dest);
	this.umg_xofy = jQuery("#umg_xofy" + dest);

	//Show the gallery
	this.umg_container.css("display", "block");

	/*if (this.umg_images.length > 0)
	{
		this.umg_images.click(function() {
			var index = this.getNodeIndex(this) / 2;
			this.moveTo(index);
			return false;
		});
	}*/

	if (this.umg_prev.length > 0)
	{
		this.umg_prev.click(function() {
			_this.navigateTo(_this.umg_index - 1);
		});
	}

	if (this.umg_next.length > 0)
	{
		this.umg_next.click(function() {
			_this.navigateTo(_this.umg_index + 1);
		});
	}

	if (this.umg_play.length > 0)
	{
		this.umg_play.click(function() {

			_this.umg_slideTimePassed = _this.umg_slideTimeout;

			if (_this.umg_playing)
			{
				_this.stopAutoPlay();
			}
			else
			{
				_this.autoPlay();
			}
		});
	}

	if (this.umg_countdown.length > 0)
	{
		this.umg_countdown.click(function() {
			_this.stopAutoPlay();
		});
	}

	//definitions of functions
	this.play = function(params)
	{
		var umg_autoPlay = true;
		if (params)
		{
			if (params.autoPlay)
			{
				umg_autoPlay = params.autoPlay.toLowerCase() == "true";
			}
			if (params.slideTimeout)
			{
				this.umg_slideTimeout = params.slideTimeout;
			}
			if (params.mouseOver)
			{
				this.umg_mouseoverbehavior = params.mouseOver.toLowerCase();
			}
			if (params.loopPlay)
			{
				this.umg_loopplay = params.loopPlay.toLowerCase() == "loop";
			}
			if (params.keyboardControl != "DonotUse")
			{
				jQuery(document).keydown(function(event) {
					if(event.keyCode ==37) //left
						_this.navigateTo(_this.umg_index - 1);
					if(event.keyCode ==39) //left
						_this.navigateTo(_this.umg_index + 1);
				});

				jQuery(this.umg_container).mousewheel(function(event, delta) {
					if (delta > 0)
						_this.navigateTo(_this.umg_index - 1);
					else if (delta < 0)
						_this.navigateTo(_this.umg_index + 1);
					return false;
				});
			}
			if (params.disabledControls)
			{
				var controls = params.disabledControls.split(",");
				for (var i=0;i<controls.length ;i++ )
				{
					var control = jQuery("#umg_" + controls[i].toLowerCase() + dest);
					if (control.length > 0)
					{
						control.css("display", "none");
						control.css("visibility", "hidden");
						//alert(controls[i] + " is hidden");
					}
				}
			}
			if (params.easing != "" && params.easing != "swing")
			{
				jQuery.easing.def = params.easing;
			}
			if (params.mode == "Freetext")
			{
				//is free text slide
				this.umg_freetextslide = true;
			}
		}

		if (this.umg_thumbs.css("display")!="none" && this.buildThumbList)
		{
			//build thumb list
			this.buildThumbList();
		}

		this.moveTo(0);

	
		if (umg_autoPlay > 0)
		{
			if (this.umg_countdown.css("display")!="none")
			{
				this.umg_countdown.attr("visiblebefore","true");
				this.umg_countdown.hide();
			}
			this.autoPlay();
		}
		else
		{
			this.stopAutoPlay();
		}
}

	/*this.getImageProperty = function(index, name)
	{
		var value = jQuery(this.umg_images[index]).attr(name);
		if (!value)
		{
			value = "";
		}
		return value;
	}*/

	this.autoPlay = function()
	{
		var source;
		if (!this.umg_freetextslide)
			source = this.umg_images;
		else
			source = this.umg_titles;

		if (source.length <= 1)
		{
			return;
		}
		this.umg_playing = true;
		if (this.umg_index == source.length-1)
		{
			this.moveTo(0);
			this.umg_interval = window.setInterval(this.umg_instancename + dest + ".onInterval()", 1000);
		}
		else
		{
			this.umg_interval = window.setInterval(this.umg_instancename + dest + ".onInterval()", 1000);
		}

		if (this.umg_play)
			this.umg_play.addClass("active");

	}

	this.stopAutoPlay = function()
	{
		this.umg_playing = false;
		window.clearInterval(this.umg_interval);

		if (this.umg_play)
			this.umg_play.removeClass("active");

		if (this.umg_countdown.css("display")!="none")
		{
			this.umg_countdown.hide();
			this.umg_countdown.attr("visiblebefore","true");
			//Hide it, but add a remark that it was visible before
		}
	}

	this.onInterval = function()
	{
		if (this.umg_isloading) return;
		this.umg_slideTimePassed += 1;
		if (this.umg_slideTimePassed >= this.umg_slideTimeout)
		{
			this.umg_slideTimePassed = 0;

			var source;
			if (!this.umg_freetextslide)
				source = this.umg_images;
			else
				source = this.umg_titles;

			if (this.umg_index + 1 >= source.length && !this.umg_loopplay)
			{
				this.stopAutoPlay();
			}
			else
			{
				this.moveTo(this.umg_index + 1);
			}
		}

		//update the count down information if it's visible, or was visible
		if (this.umg_countdown.css("display")!="none" || this.umg_countdown.attr("visiblebefore") == "true")
		{
			if (this.umg_slideTimePassed == 0)
			{
				this.umg_countdown.hide();
				this.umg_countdown.attr("visiblebefore","true");
			}
			else
			{
				this.umg_countdown.show();
				this.umg_countdown.html(this.umg_slideTimeout-this.umg_slideTimePassed);
			}
		}
	}

	/*var getNodeIndex = function(node)
	{
		var elem = node;
		var k = 0; 
		while(elem.previousSibling){ 
			k++; 
			elem = elem.previousSibling; 
		} 
		return k;
	}*/

	this.getResizedResolution = function(obj)
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

	this.getPrioritySize = function(obj)
	{
		var size = new Object();
		size.width = obj.width();
		size.height = obj.height();
		size.priorityhdir = obj.css("priority-hdir");
		size.priorityvdir = obj.css("priority-vdir");

		var prioritywidth = obj.css("priority-width");
		var priorityheight = obj.css("priority-height");

		if (prioritywidth)
		{
			if (prioritywidth.indexOf("px") > 0)
			{
				prioritywidth = prioritywidth.substring(0,prioritywidth.indexOf("px"));
			}
			size.prioritywidth = prioritywidth * 1;
		}
		else
		{
			size.prioritywidth = size.width;
		}

		if (priorityheight)
		{
			if (priorityheight.indexOf("px") > 0)
			{
				priorityheight = priorityheight.substring(0,priorityheight.indexOf("px"));
			}
			size.priorityheight = priorityheight * 1;
		}
		else
		{
			size.priorityheight = size.height;
		}

		return size;
	}	

	this.getSuggestedPosition = function(objImgTag)
	{
		var position = new Object();
		position.suggestedX = 0;
		position.suggestedY = 0;

		var prioritysize = this.getPrioritySize(this.umg_large);
		if (objImgTag.width() <= prioritysize.width)
		{
			if (prioritysize.priorityhdir == "right")
			{
				if (objImgTag.width() <= prioritysize.prioritywidth)
				{
					position.suggestedX = (prioritysize.prioritywidth-objImgTag.width()) / 2 + prioritysize.width - prioritysize.prioritywidth;
				}
				else
				{
					position.suggestedX = prioritysize.width - objImgTag.width();
				}
			}
			else
			{
				if (objImgTag.width() <= prioritysize.prioritywidth)
				{
					position.suggestedX = (prioritysize.prioritywidth-objImgTag.width()) / 2;
					//alert("gallery width="+prioritysize.width+", image width=" + objImgTag.width() + ", prioritywidth=" + prioritysize.prioritywidth + ", suggestedX=" + position.suggestedX);
				}
			}
		}
		//else keep margin-left to zero;

		if (objImgTag.height() <= prioritysize.height)
		{
			if (prioritysize.priorityvdir == "bottom")
			{
				if (objImgTag.height() <= prioritysize.priorityheight)
				{
					position.suggestedY = (prioritysize.priorityheight-objImgTag.height()) / 2 + prioritysize.height - prioritysize.priorityheight;
				}
				else
				{
					position.suggestedY = prioritysize.height - objImgTag.height();
				}
			}
			else
			{
				if (objImgTag.height() <= prioritysize.priorityheight)
				{
					position.suggestedY = (prioritysize.priorityheight-objImgTag.height()) / 2;
				}
			}
		}

		return position;
	}

	this.navigateTo = function(index)
	{
		if (this.umg_playing)
			this.stopAutoPlay();

		if (index == this.umg_index)
		{
			return;
		}

		this.moveTo(index);
	}

	this.moveTo = function(index)
	{
		var source;
		if (!this.umg_freetextslide)
			source = this.umg_images;
		else
			source = this.umg_titles;

		if (index >= source.length)
			index = 0;
		else if (index < 0)
			index = source.length - 1;

		this.umg_slideTimePassed = 0;

		var item = jQuery(source[index]);
		if(item.length < 1)
		{
			alert("No slides in gallery " + this.dest);
			this.stopAutoPlay();
			return;
		}

		var previousContainer = this.umg_large.find("#img"+this.umg_index);
		var container = this.umg_large.find("#img"+index);

		if (this.umg_freetextslide)
		{
			if (container.length == 0)
			{
				this.umg_large.append("<div class='freetext' id='img" + index + "' style='display:none' index='"+index+"' />");
				container = this.umg_large.find("#img" + index);
				container.html(jQuery(this.umg_descriptions[index]).html());
				//previousContainer.css("display","none");
				//container.css("display","block");
				_this.umg_transition_freetext_align(container);
				_this.umg_transition_freetext_activate(container, previousContainer);
			}
			else
			{
				_this.umg_transition_freetext_activate(container, previousContainer);
			}
		}
		else
		{
			var url = item.attr("largeurl");
			if (!url)
			{
				url = item.attr("src");
			}
			if (container.length == 0)
			{
				this.umg_large.append("<img class='image' id='img" + index + "' style='display:none' index='"+index+"' />");
				container = this.umg_large.find("#img" + index);

				var img = new Image();

				// call this function after it's loaded
				img.onload = function() 
				{
					var maxWidth = _this.umg_large.width();
					var maxHeight = _this.umg_large.height();

					// make wrapper fully visible
					//umg_large.fadeTo("fast", 1);

					// change the image

					if (this.width > maxWidth || this.height > maxHeight )
					{
						var size ={"width":this.width,"maxWidth":maxWidth,"height":this.height,"maxHeight":maxHeight};
						_this.getResizedResolution(size);
						container.attr("width", size.newWidth);
						container.attr("height", size.newHeight);
					}
					else
					{
						container.attr("width", this.width);
						container.attr("height", this.height);
					}
					if (_this.umg_loading)
					{
						_this.umg_loading.removeClass("active");
					}
					_this.umg_isloading = false;
					_this.umg_transition_image_align(this, container);
					_this.umg_transition_image_activate(container, previousContainer);
				};
				if (this.umg_loading)
				{
					this.umg_loading.addClass("active");
				}
				this.umg_isloading = true;
				img.src = url;
			}
			else
			{
				this.umg_transition_image_activate(container, previousContainer);
			}

			// begin loading the image from flickr
			if (this.umg_captiontext)
			{
				this.umg_transition_caption_do(index);
			}

			var link= jQuery(this.umg_links[index]).attr("href")
			if (this.umg_more && link)
			{
				this.umg_more.attr("href", link);
				this.umg_more.show();
			}
			else
			{
				this.umg_more.hide();
			}
		}

		if (typeof(UPG_onPhotoLoad) != "undefined")
		{
			var umgid = jQuery(this.umg_umgids[index]).html();
			UPG_onPhotoLoad(umgid);
		}

		if (typeof(this.onMoveTo) != "undefined")
		{
			this.onMoveTo(index);
		}

		this.umg_index = index;


		
		if (this.umg_navi)
		{
			var navi = "";
			for (var i=0;i<source.length;i++)
			{
				var itemHtml = "";
				if (i==index)
				{
					itemHtml = "<a href='javascript:void(0);' class='active'></a>";
				}
				else
				{
					itemHtml = "<a href='javascript:void(0);' onclick='slide" + dest + ".navigateTo("+i+")'></a>";
				}
				navi += itemHtml;
			}
			this.umg_navi.html( navi);

			if (!this.umg_naviInited)
			{
				this.umg_naviInited = true;
				var lastA = this.umg_navi.find("a");
				var lastAObj = jQuery(lastA[lastA.length-1]);
				var lastX = lastAObj.position().left + lastAObj.width();
				this.umg_navi.css("width", lastX+6);//because navi.margin=6;
			}
		}

		if (this.umg_xofy.length > 0)
		{
			this.umg_xofy.html((index+1) + this.umg_xofysplitter + source.length);
		}

		/*if (umg_prev)
			index>0?umg_prev.css("visibility","visible"):umg_prev.css("visibility","hidden");

		if (umg_next)
			index<umg_images.length-1?umg_next.css("visibility","visible"):umg_next.css("visibility","hidden");*/
	};

	this.updateCaption = function(index)
	{
		if (!this.umg_captiontext.originalWidth)
		{
			this.umg_captiontext.originalWidth = this.umg_captiontext.width();
			var originalHeight = this.umg_captiontext.height();
			if (originalHeight <= 0)
			{
				originalHeight = this.umg_caption.height();
			}
			this.umg_captiontext.originalHeight = originalHeight;
		}
		else
		{
			this.umg_captiontext.css("width", this.umg_captiontext.originalWidth);
			this.umg_captiontext.css("height", this.umg_captiontext.originalHeight);
		}
		this.umg_captiontext.find("#umg_captiontitle" + this.dest).html(jQuery(this.umg_titles[index]).html());
		this.umg_captiontext.find("#umg_captiondescription" + this.dest).html(jQuery(this.umg_descriptions[index]).html());

		var umg_captionauthor = this.umg_captiontext.find("#umg_captionauthor" + this.dest);
		if (umg_captionauthor.length > 0)
		{
			umg_captionauthor.html(jQuery(this.umg_authors[index]).html());
		}
		var umg_captiontakendate = this.umg_captiontext.find("#umg_captiontakendate" + this.dest);
		if (umg_captiontakendate.length > 0)
		{
			umg_captiontakendate.html(jQuery(this.umg_takendates[index]).html());
		}
		var umg_captiontags = this.umg_captiontext.find("#umg_captiontags" + this.dest);
		if (umg_captiontags.length > 0)
		{
			umg_captiontags.html(jQuery(this.umg_tags[index]).html());
		}

	}
	//end of function definitions

		
	if (typeof(this.umg_init) != "undefined")
	{
		this.umg_init(sender);
	}

	//return this;
}
