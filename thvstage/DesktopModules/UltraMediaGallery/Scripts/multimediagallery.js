function mmg_run() {
var ready 		= true;
var navigate 	= false;
var MultimediaGallery = {
	/**
	* loaded 	: how many files were loaded already;
	* total		: total number of existing files
	* set		: number of items to load for each ajax call,
	* except the first one - it will load as much it fits in the window
	*/
	data				: {
		'loaded' 				: 0,	
		'total'					: 0,
		'set'					: 25
	},
	/**
	* method called innitially: register events 
	* and starts the gallery
	*/
	init					: function () {
		MultimediaGallery.initEventHandlers();
		MultimediaGallery.start();
	},
	/**
	* init the events
	*/
	initEventHandlers		: function () {
		jQuery('#mmg_media_wrapper ul').delegate('a','mouseenter',function () {
			var $this   = jQuery(this);
			$this.find('img').stop().animate({'opacity':'1.0'},200);
		}).delegate('a','mouseleave',function () {
			var $this   = jQuery(this);
			$this.find('img').stop().animate({'opacity':'0.6'},200);
		}).delegate('a','click',function(e){
			MultimediaGallery.data.currentItem = jQuery(this).parent().index()+1;
			MultimediaGallery.showItem();
			e.preventDefault();
		});
		jQuery(window).bind('resize', function() {
			MultimediaGallery.centerWrapper();
			
			if(!jQuery('#mmg_preview .preview_wrap').is(':empty')){
				if(jQuery('#mmg_large_photo').length > 0)
					MultimediaGallery.resize(jQuery('#mmg_large_photo'));
			}
		});
		jQuery('#mmg_nav .next').bind('click',function(e){
			MultimediaGallery.data.currentItem = MultimediaGallery.data.currentItem+1;
			MultimediaGallery.showItem();
			e.preventDefault();
		});
		jQuery('#mmg_nav .prev').bind('click',function(e){
			MultimediaGallery.data.currentItem = MultimediaGallery.data.currentItem-1;
			MultimediaGallery.showItem();
			e.preventDefault();
		});
		jQuery('#mmg_item_close').live('click',function(e){
			MultimediaGallery.hideItem();
			e.preventDefault();
		});
		jQuery('#mmg_more').bind('click',function(e){
			MultimediaGallery.more();
			e.preventDefault();
		});
	},
	/**
	* checks how many files we have
	* draws the structure
	* displays the first set
	*/
	start					: function () {
		var medias = jQuery(".medias").find("div");
		MultimediaGallery.data.total = medias.length;
		/**
		* draws the containers where our thumbs will be displayed,
		*/
		if(ready){
			var nmb_containers 		= MultimediaGallery.countSpaces();
			MultimediaGallery.draw(nmb_containers);
		}	
	},
	draw					: function (nmb_containers) {
		/**
		* load innitially the number of items that fit
		* on the window + a certain margin.
		* When resizing the window we follow the
		* same approach. All the other items will load
		* when the User clicks the more button
		*/
		var $list = jQuery('#mmg_media_wrapper ul');
		for(var i=0; i < nmb_containers; ++i){
			$list.append(jQuery('<li />'));
		}
		MultimediaGallery.centerWrapper();
		MultimediaGallery.display();
	},
	/**
	* checks how many more thumbs we can display 
	* given the window dimentions
	*/
	countSpaces				: function () {
		var containerSizeW 				= jQuery(".media_container").width()-40;
		var photosPerRow 				= Math.floor(containerSizeW/168);
		var containerSizeH 				= jQuery(".media_container").height()-50;
		var photosPerColumn 			= Math.floor(containerSizeH/128);// + 1;
		var nmb_containers 				= Math.min(MultimediaGallery.data.total,photosPerRow * photosPerColumn);
		var nmb_containers_in_viewport 	= jQuery('#mmg_media_wrapper li:in-viewport').length;
		return nmb_containers-nmb_containers_in_viewport;
	},
	/**
	* centers the thumbs grid
	*/
	centerWrapper			: function () {
//		var photosLength = jQuery('#mmg_media_wrapper li').size();
//		if(photosLength > 0) {
//			var containerSize 	= jQuery(window).width()-100;
//			var photosPerRow 	= Math.floor(containerSize/188);

//			//0 of paddings (if you want more...)
//			var left = Math.floor((containerSize-(photosPerRow*188))/2);
//			jQuery('#mmg_media_wrapper li').each(function(i){
//				var $this = jQuery(this);
//				if(i%photosPerRow == 0) {
//					$this.css('margin-left',left+'px');
//				}
//				else {
//					$this.css('margin-left','0px');
//				}
//			});
//		}
	},
	/**
	* displays the first set of files
	* we need to check how many we can display for our window size!
	*/
	display					: function () {
		ready = false;
		if(MultimediaGallery.data.loaded == MultimediaGallery.data.total)
			return;
			
		var $list 			= jQuery('#mmg_media_wrapper ul');
		
		var nmb_toLoad 		= $list.find('li:empty').length;
		if(nmb_toLoad == 0){
			ready = true;
			return;
		}
		var medias = jQuery(".medias").find("div").slice(MultimediaGallery.data.loaded,MultimediaGallery.data.loaded+nmb_toLoad);
		var res_length 	= medias.length;
		if(res_length == 0) ready = true;
		var total_loaded= 0;
		MultimediaGallery.incrementLoadedFiles(res_length);
		MultimediaGallery.showOptionMore();
		for(var i=0; i<res_length; ++i)
		{
			var elem = jQuery(medias[i]);
			var elem_thumb 		= elem.attr("thumb");
			var elem_sources 	= elem.attr("source");
			var elem_type 		= elem.attr("type");
			var elem_title		= elem.attr("title");
			var elem_description= elem.attr("description");
			if (elem_description == "")
			{
				elem_description = elem_title;
			}
			//flash properties
			var elem_width 		= elem.attr("mediaWidth");
			var elem_height		= elem.attr("mediaHeight");
			var elem_htmlSource		= elem.attr("htmlSource");

			if (!elem_width) elem_width = "";
			if (!elem_height) elem_height = "";
			if (!elem_htmlSource) elem_htmlSource ="";

			jQuery('<img alt="'+elem_type+'"/>').load(function(){
				var $this = jQuery(this);
				total_loaded 	+= 1;
				MultimediaGallery.resizeGridImage($this);
				var $elem		= jQuery('<a class="'+ $this.attr('alt') +'" href="#" />').append("<span />").append($this).append("<div class='title'>"+$this.attr('title')+"</div>");
				$list.find('li:empty:first').append($elem);
				if(total_loaded == res_length){
					ready = true;
					/**
					* if the user was navigating through the items
					* show the next one...
					*/
					if(navigate){
						navigate = false;
						MultimediaGallery.showItem();
					}
					if (typeof(mmg_finished) != "undefined")
					{
						mmg_finished();
					}
				}
			})
				.attr('title',elem_title)
				.attr('desc',elem_description)
				.data('sources',elem_sources)
				.data('type',elem_type)
				.data('description',elem_description)
				.attr('src',elem_thumb)
				.data('mediaWidth',elem_width).data('mediaHeight',elem_height).data('htmlSource',elem_htmlSource);
		}

	},
	/**
	* shows the button "more" if there are more items
	*/
	showOptionMore			: function () {
		if(MultimediaGallery.data.loaded == MultimediaGallery.data.total)
			jQuery('#mmg_media_wrapper .more').hide();
		else
			jQuery('#mmg_media_wrapper .more').show();
	},
	/**
	* increments the amount of loaded files
	*/
	incrementLoadedFiles	: function (newfiles) {
		MultimediaGallery.data.loaded += newfiles;	
	},
	/**
	* user clicks on more button
	*/
	more					: function (){
		if(ready){
			var nmb_containers 		= Math.min(MultimediaGallery.data.total-MultimediaGallery.data.loaded,MultimediaGallery.data.set)	
			MultimediaGallery.draw(nmb_containers);
			//jQuery(".more").css("bottom",0);
			//alert(jQuery(".media_container")[0].scrollHeight);
			jQuery(".media_container").css("height", jQuery(".media_container")[0].scrollHeight);
		}					
	},
	/**
	* displays the item when user clicks on thumb (photo,video or audio)
	*/
	showItem				: function () {
		if(MultimediaGallery.data.currentItem < 1) return;
		
		jQuery('#mmg_overlay,#mmg_preview').show();
		var $preview_wrap 	= jQuery('#mmg_preview .preview_wrap');
		
		var $list 			= jQuery('#mmg_media_wrapper ul');
		var $item 			= $list.find('li:nth-child('+ MultimediaGallery.data.currentItem +')').find('img');
		if(!$item.length){
			/**
			* reached the end, let's load more
			*/
			if(MultimediaGallery.data.currentItem == parseInt(MultimediaGallery.data.total)+1) {
				MultimediaGallery.data.currentItem = MultimediaGallery.data.currentItem-1;
				return
			};
			
			MultimediaGallery.more();
			navigate = true;
			return;
		}	
		jQuery('#mmg_preview_loading').show();	
		/**
		* photo, video or audio
		*/
		var item_type 		= $item.data('type');
		var item_sources 	= $item.data('sources');
		var item_description= $item.data('description');
		var item_htmlSource= $item.data('htmlSource');
		if (item_htmlSource!="")
		{
			item_htmlSource = item_htmlSource.replace(/%3c/g, "<").replace(/%3e/g, ">").replace(/%22/g, "\"").replace(/%27/g, "\'");
			var $mediawrapper = jQuery('<div />',{
				className	: 'htmlContent'
			});
			$preview_wrap.fadeOut(100,function(){
				jQuery('#mmg_preview_loading').hide();
				jQuery(this).empty().append('<a href="#" id="mmg_item_close" class="close"></a>').append($mediawrapper.html(item_htmlSource)).fadeIn();
				MultimediaGallery.changeDescription(item_description);
	var containerWidth = $mediawrapper.width();
	var containerHeight = $mediawrapper.height();
	if (containerWidth <=0 ) containerWidth = 600;
	if (containerHeight <=30 ) containerHeight = 400;
				MultimediaGallery.centerPreview(containerWidth,containerHeight);
			});

			return;
		}

		switch(item_type){
			case 'image':
				var $photo = jQuery('<img id="mmg_large_photo"/>').load(function(){
					var $theImage = jQuery(this);
					$preview_wrap.fadeOut(100,function(){
						jQuery('#mmg_preview_loading').hide();
						jQuery(this).empty().append('<a href="#" id="mmg_item_close" class="close"></a>').append($theImage).fadeIn();
						MultimediaGallery.changeDescription(item_description);
						MultimediaGallery.resize($theImage);
					})
				}).attr('src',item_sources);
				break;
			case 'audio':
				var $mediawrapper = jQuery('<div />',{
					//className	: 'media-player'
				});


				//from highslide-bridge.js
				var audioW=432;
				var audioH=150;
				if (useHtml5)
				{
					$audio = "<audio src='" + item_sources + "' type='audio/mp3' width='" + audioW + "px' height='" + audioH + "px' autoplay='true' controls='controls' />";
				}
				else
				{
					var flashVars = "&autostart=yes";
					$audio = "<object allowFullScreen='True' allowScriptAccess='always' width='"+audioW+"' height='"+audioH+"'><param name='movie' value='"+modulePath+"SimpleAudio.swf' /><param name='allowFullScreen' value='true' /><param name='flashvars' value='audio="+item_sources+flashVars+"' /><embed src='"+modulePath+"SimpleAudio.swf' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' width='"+audioW+"' height='"+audioH+"' flashvars='audio="+item_sources+flashVars+"'></embed></object>"
				}
				//var $audio = '<audio controls="controls">'+item_sources+'</audio>';
				
				$preview_wrap.fadeOut(100,function(){
					jQuery('#mmg_preview_loading').hide();
					jQuery(this).empty().append('<a href="#" id="mmg_item_close" class="close"></a>').append($mediawrapper.html($audio)).fadeIn();
					MultimediaGallery.changeDescription(item_description);
					//$mediawrapper.jmeEmbedControls();
					//var audioW 	= 432;
					//var audioH 	= 32;
					MultimediaGallery.centerPreview(audioW,audioH);
				});
				break;
			case 'video':
				var $mediawrapper = jQuery('<div />',{
					//className	: 'media-player _video'
				});

				//from highslide-bridge.js
				var videoW 	= 432;
				var videoH 	= 240;
				if (useHtml5)
				{
					$video = "<video src='" + item_sources + "' type='video/mp4' width='" + videoW + "px' height='" + videoH + "px' autoplay='true' controls='controls' />";
				}
				else
				{
					$video = "<object allowFullScreen='True' allowScriptAccess='always' width='"+videoW+"' height='"+videoH+"'><param name='movie' value='"+modulePath+"SimpleVideo.swf' /><param name='allowFullScreen' value='true' /><param name='flashvars' value='video="+item_sources+"&showControlBar=True' /><embed src='"+modulePath+"SimpleVideo.swf' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' width='"+videoW+"' height='"+videoH+"' flashvars='video="+item_sources+"&showControlBar=True'></embed></object>"
				}
				
				//var $video = '<video controls="controls" preload="none">'+item_sources+'<div class="fallback"><div class="fallback-text"><p>Please use a modern browser or install <a href="http://www.videolan.org/">VLC (check Mozilla Plugin)</a> or <a href="http://get.adobe.com/flashplayer/">Flash-Plugin</a></p></div></div>'+'</video>';
				
				$preview_wrap.fadeOut(100,function(){
					jQuery('#mmg_preview_loading').hide();
					jQuery(this).empty().append('<a href="#" id="mmg_item_close" class="close"></a>').append($mediawrapper.html($video)).fadeIn();
					MultimediaGallery.changeDescription(item_description);
//					$mediawrapper.jmeEmbedControls({
//						timeSlider: {
//							range: 'min'
//						}
//					}).bind('useractive', function(){
//						jQuery('div.media-controls', this).stop().animate({opacity: 1});
//					}).bind('userinactive', function(){
//						jQuery('div.media-controls', this).stop().animate({opacity: 0});
//					}).find('div.media-controls').css('opacity', 0);
//					var videoW 	= 432;
//					var videoH 	= 240;
					MultimediaGallery.centerPreview(videoW,videoH);
				});
				break;	
			case 'flash':
				var $mediawrapper = jQuery('<div />',{
					//className	: 'media-player _flash'
				});


				//from highslide-bridge.js
				var flashW = $item.data('mediaWidth');
				var flashH = $item.data('mediaHeight');
				if (!flashW) flashW=432;
				if (!flashH) flashH=240;
				if (useHtml5)
				{
					alert("Flash content is not available on your device.");
					return;
				}
				else
				{
					$flash = "<object allowFullScreen='True' allowScriptAccess='always' width='"+flashW+"' height='"+flashH+"'><param name='movie' value='"+item_sources+"' /><param name='allowFullScreen' value='true' /><embed src='"+item_sources+"' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' width='"+flashW+"' height='"+flashH+"'></embed></object>"
				}
				
				$preview_wrap.fadeOut(100,function(){
					jQuery('#mmg_preview_loading').hide();
					jQuery(this).empty().append('<a href="#" id="mmg_item_close" class="close"></a>').append($mediawrapper.html($flash)).fadeIn();
					MultimediaGallery.changeDescription(item_description);
					MultimediaGallery.centerPreview(flashW,flashH);
				});
				break;
		}
	},
	/**
	* adds a description when there is one
	*/
	changeDescription		: function (item_description) {
		if(item_description=='')
			jQuery('#mmg_description').hide();
		else	
			jQuery('#mmg_description').empty().html('<p>' + item_description + '</p>').show();
	},
	/**
	* user clicks on the cross to close the item
	*/
	hideItem				: function () {
		var $preview_wrap 	= jQuery('#mmg_preview .preview_wrap');
		jQuery('#mmg_overlay,#mmg_preview,#mmg_description').hide();
		$preview_wrap.empty();
	},
	/**
	* resize the image (large image), based on windows width and height
	*/
	resize 					: function ($image){
		var widthMargin		= 10
		var heightMargin 	= 120;
		
		var windowH      = jQuery(".media_container").height()-heightMargin;
		var windowW      = jQuery(".media_container").width()-widthMargin;
		var theImage     = new Image();
		theImage.src     = $image.attr("src");
		var imgwidth     = theImage.width;
		var imgheight    = theImage.height;

		if((imgwidth > windowW)||(imgheight > windowH)){
			if(imgwidth > imgheight){
				var newwidth = windowW;
				var ratio = imgwidth / windowW;
				var newheight = imgheight / ratio;
				theImage.height = newheight;
				theImage.width= newwidth;
				if(newheight>windowH){
					var newnewheight = windowH;
					var newratio = newheight/windowH;
					var newnewwidth =newwidth/newratio;
					theImage.width = newnewwidth;
					theImage.height= newnewheight;
				}
			}
			else{
				var newheight = windowH;
				var ratio = imgheight / windowH;
				var newwidth = imgwidth / ratio;
				theImage.height = newheight;
				theImage.width= newwidth;
				if(newwidth>windowW){
					var newnewwidth = windowW;
					var newratio = newwidth/windowW;
					var newnewheight =newheight/newratio;
					theImage.height = newnewheight;
					theImage.width= newnewwidth;
				}
			}
		}
		$image.css({
			'width':theImage.width+'px',
			'height':theImage.height+'px'
		});
		MultimediaGallery.centerPreview(theImage.width,theImage.height);
	},
	/**
	* center the large image / video / audio on the page
	*/
	centerPreview			: function (width,height){
		var $preview_wrap 	= jQuery('#mmg_preview .preview_wrap');
		$preview_wrap.css({
			'width':width+'px',
			'height':height+'px',
			'margin-top':-(height/2)-20+'px',
			'margin-left':-(width/2)-30+'px'
		});
	},
	/**
	* resize each thumb image in the grid view
	*/
	resizeGridImage 		: function ($image){
		var theImage 	= new Image();
		theImage.src 	= $image.attr("src");
		var imgwidth 	= theImage.width;
		var imgheight 	= theImage.height;
		
		var containerwidth  = 140;
		var containerheight = 100;
		
		if(imgwidth	> containerwidth){
			var newwidth = containerwidth;
			var ratio = imgwidth / containerwidth;
			var newheight = imgheight / ratio;
			if(newheight > containerheight){
				var newnewheight = containerheight;
				var newratio = newheight/containerheight;
				var newnewwidth =newwidth/newratio;
				theImage.width = newnewwidth;
				theImage.height= newnewheight;
			}
			else{
				theImage.width = newwidth;
				theImage.height= newheight;
			}
		}
		else if(imgheight > containerheight){
			var newheight = containerheight;
			var ratio = imgheight / containerheight;
			var newwidth = imgwidth / ratio;
			if(newwidth > containerwidth){
				var newnewwidth = containerwidth;
				var newratio = newwidth/containerwidth;
				var newnewheight =newheight/newratio;
				theImage.height = newnewheight;
				theImage.width= newnewwidth;
			}
			else{
				theImage.width = newwidth;
				theImage.height= newheight;
			}
		}
		$image.css({
			'width':theImage.width,
			'height':theImage.height
			});
	}
};

MultimediaGallery.init();
}