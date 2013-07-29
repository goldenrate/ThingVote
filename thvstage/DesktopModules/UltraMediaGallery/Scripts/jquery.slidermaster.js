/*
 * jQuery Nivo Slider v2.6
 * http://nivo.dev7studios.com
 *
 * Copyright 2011, Gilbert Pellegrom
 * Free to use and abuse under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * March 2010
 */

/*
 * Ultra Media Gallery SliderMaster script library
 * http://www.bizmodules.net
 *
 * Copyright 2011, Pengcheng Rong
 * All rights reserved, do not use this script library out of Ultra Media Gallery expect directly licensed by the copyright owner.
 * 
 * December 2011
 */

(function($) {

    var NivoSlider = function(element, options){
		//Defaults are below
		var settings = $.extend({}, $.fn.nivoSlider.defaults, options);

        //Useful variables. Play carefully.
        var vars = {
            currentSlide: 0,
            currentImage: '',
            totalSlides: 0,
            randAnim: '',
            running: false,
            paused: false,
            stop: false
			//continue after finishs current media
			,waitForMediaFinishEvent:false,
			mediaSlideIndex:-1,
			countDown:0
        };
    
        //Get this slider
		var sliderFrame;
        var slider = $(element);
		var instanceName = 'jQuery("#'+slider.attr("ID")+'")[0]';
		var doubleClickNotified = false;

		if(!slider.hasClass("nivoSlider")) 
		{
			sliderFrame = slider;
			slider=$(".nivoSlider", slider);
		}
		else
		{
			sliderFrame = slider.parent().parent().parent().parent();
		}

        var sliderMain = $(".sliderMain", slider);
        slider.data('nivo:vars', vars);
        slider.css('position','relative');
        slider.addClass('nivoSlider');
        
        //Find our slider children
        var kids = sliderMain.children();
        kids.each(function() {
            var child = $(this);
            var link = '';
            if(!child.is('img')){
                if(child.is('a')){
                    child.addClass('nivo-imageLink');
                    link = child;
                }
                child = child.find('img:first');
            }
            //Get img width & height
            var childWidth = child.width();
            if(childWidth == 0) childWidth = child.attr('width');
            var childHeight = child.height();
            if(childHeight == 0) childHeight = child.attr('height');
            //Resize the slider
            if(childWidth > slider.width()){
                slider.width(childWidth);
            }
            if(childHeight > slider.height()){
                slider.height(childHeight);
            }
            if(link != ''){
                link.css('display','none');
            }
            child.css('display','none');
            vars.totalSlides++;
        });
        
        //Set startSlide
        if(settings.startSlide > 0){
            if(settings.startSlide >= vars.totalSlides) settings.startSlide = vars.totalSlides - 1;
            vars.currentSlide = settings.startSlide;
        }
        
        //Get initial image
        if($(kids[vars.currentSlide]).is('img')){
            vars.currentImage = $(kids[vars.currentSlide]);
        } else {
            vars.currentImage = $(kids[vars.currentSlide]).find('img:first');
        }
        
        //Show initial link
        if($(kids[vars.currentSlide]).is('a')){
            $(kids[vars.currentSlide]).css('display','block');
        }
        
        //Set first background
        sliderMain.css('background','url("'+ vars.currentImage.attr('src') +'") no-repeat');
        
        // For debugging
        var trace = function(msg){
            if (this.console && typeof console.log != "undefined")
                console.log(msg);

			var container = $("#trace");
			if (container.length > 0)
			{
				container.append("<div>"+msg+"</div>");
			}
        }
		
		// Process caption function
		var processCaption = function(settings){
			if (!settings.caption)
			{
				return;
			}

			var caption = $('.caption', slider);
			var captionBody = $('.caption .captionBody', slider);
			var captionTitle = $('.caption .captionTitle', slider);
			var captionDesc = $('.caption .captionDesc', slider);
			var readMore = $('.caption .readMore', slider);

			var textArray = getTextDescription(vars.currentImage.attr('title'));
			var title = textArray[0];
			var desc = textArray[1];
			var href = "";
            if($(kids[vars.currentSlide]).is('a')){
				href = $(kids[vars.currentSlide]).attr("href");

				if (href == "#")
					href = "";
			}

			var hasTitle = true;
			var hasDesc = true;
			if (title == "" || captionTitle.css("display") == "none")
			{
				hasTitle = false;
			}
			if (desc == "" || captionDesc.css("display") == "none")
			{
				hasDesc = false;
			}
			if (hasTitle == false && hasDesc == false && href == "")
			{
				captionTitle.html("");
				captionDesc.html("");
				readMore.attr("href", "");
				caption.hide();
				return;
			}
			else
			{
				caption.show();
			}

			if (href == "")
			{
				readMore.hide();
			}
			else
			{
				readMore.show();
			}

			if (settings.captionEffect == "fade")
			{
				captionBody.fadeOut(settings.animSpeed, function(){
					captionTitle.html(title);
					captionDesc.html(desc);
					readMore.attr("href", href);
					$(this).fadeIn(settings.animSpeed);
				});
			}
			else if (settings.captionEffect == "expand")
			{
				caption.animate({"height": 0},{"duration":settings.animSpeed, complete:function(){
					captionTitle.html(title);
					captionDesc.html(desc);
					readMore.attr("href", href);

					var captionBodyHeight = captionBody.height() + parse(captionBody.css("margin-top")) + parse(captionBody.css("margin-bottom"));
					$(this).animate({"height": captionBodyHeight});}
				});
			}
			else if (settings.captionEffect == "direct")
			{
				captionTitle.html(title);
				captionDesc.html(desc);
				readMore.attr("href", href);
			}


			return;
		}

		var getTextDescription = function(title)
		{
			var array=new Array()
			if (!title)
			{
				array[0] = "";
				array[1] = "";
			}
			else
			{
				if (title.substring(0, 1) == "#")
				{
					var richDescription = $(title);
					array[0] = $(richDescription.children()[0]).html();
					array[1] = $(richDescription.children()[1]).html();
				}
				else
				{
					array[0] = title;
					array[1] = "";
				}
			}

			return array;
		}

		var navigationItemClicked = function(item)
		{
			var rel = $(item).attr('rel');
            if(vars.running) return false;
			var quickNavItems = $('.quickNav3 a:eq(' + rel + ')');
			var thumbNav = $('.thumbNav a:eq(' + rel + ')');
            if(quickNavItems.hasClass('active') || quickNavItems.hasClass('active')) return false;

			stopCountDown();

            clearInterval(timer);
            timer = '';
            sliderMain.css('background','url("'+ vars.currentImage.attr('src') +'") no-repeat');
            vars.currentSlide = rel - 1;
            nivoRun(slider, kids, settings, 'control');
            timer = setInterval(function(){ nivoRun(slider, kids, settings, 'control'); }, settings.pauseTime);
		}

		var ensureThumbNavVisible = function()
		{
			if (!settings.thumbNav)
			{
				return;
			}

			var navItem = $('.thumbNav a:eq(' + vars.currentSlide + ')');
			var thumbNav = $('.thumbNav', slider);
			var thumbNavInner = $('.thumbNavInner', slider);
			thumbNavInner.stop();

			if(navItem.position().left + navItem.width() > thumbNav.width())
			{
				//scroll to left
				var scrollTo = thumbNav.width() / 2 - navItem.position().left - navItem.width() / 2;
				thumbNavInner.animate({"margin-left":scrollTo},"slow");
			}
			else if(navItem.position().left < 0)
			{
				//scroll to right
				var scrollTo = thumbNav.width() / 2 - navItem.position().left - navItem.width() / 2 + parse(thumbNavInner.css("margin-left"));
				if (scrollTo > 0)
				{
					scrollTo = 0;
				}
				thumbNavInner.animate({"margin-left":scrollTo},"slow");
			}
			else if(navItem.position().top + navItem.height() > thumbNav.height())
			{
				//scroll to bottom
			}
			else if(navItem.position().top < 0)
			{
				//scroll to top
			}
			else
			{
				return;
			}
		}

		var showControls = function(show)
		{
			//quickNav
            if(settings.quickNavHide == "hide")
			{
				if (show)
					$('.quickNav1', slider).show();
				else
					$('.quickNav1', slider).hide();
            }
			else if(settings.quickNavHide == "fade")
			{
				if (show)
					$('.quickNav1', slider).css("opacity",1);
				else
					$('.quickNav1', slider).css("opacity",.5);
            }

			//directionNav
			if(settings.directionNavHide == "hide")
			{
				if (show)
					$('.nivo-directionNav', slider).show();
				else
					$('.nivo-directionNav', slider).hide();
            }
			else if(settings.directionNavHide == "fade")
			{
				var prev = $("a.nivo-prevNav");
				var next = $("a.nivo-nextNav");
				if (show)
				{
					prev.css("opacity",1);
					next.css("opacity",1);
				}
				else
				{
					prev.css("opacity",.5);
					next.css("opacity",.5);
				}
            }

			//caption
            if(settings.captionHide == "hide")
			{
				if (show)
					$('.caption', slider).show();
				else
					$('.caption', slider).hide();
            }
		}

		var parse = function(value)
		{
			var intValue = parseInt(value);
			if (isNaN(intValue))
			{
				intValue = 0;
			}
			return intValue;
		}
        
        //In the words of Super Mario "let's a go!"
        var timer = 0;
        if(!settings.manualAdvance && kids.length > 1){
            timer = setInterval(function(){ nivoRun(slider, kids, settings, false); }, settings.pauseTime);
			trace("Let's a go");
        }

        //Create caption
		if(settings.caption && settings.caption!="none"){
			sliderMain.append(
				$('<div class="caption ' + settings.caption + '"><div class="captionBody" ><div class="captionTitle" ></div><div class="captionDesc" ></div><a class="readMore" >more</a></div></div>')/*.css({ display:'none', opacity:settings.captionOpacity })*/
			);

			if (settings.readMoreInNewWindow)
			{
				$(".readMore", slider).attr("target", "_blank");
			}
			
			//Process initial  caption
			processCaption(settings);
		}

        //Add Direction nav
        if(settings.directionNav && settings.directionNav!="none"){
            sliderMain.append('<div class="nivo-directionNav ' + settings.directionNav + '"><a class="nivo-prevNav">'+ settings.prevText +'</a><a class="nivo-nextNav">'+ settings.nextText +'</a></div>');
            
            $('a.nivo-prevNav', slider).live('click', function(){
                if(vars.running) return false;
                clearInterval(timer);
                timer = '';
                vars.currentSlide -= 2;
                nivoRun(slider, kids, settings, 'prev');
            });
            
            $('a.nivo-nextNav', slider).live('click', function(){
                if(vars.running) return false;
                clearInterval(timer);
                timer = '';
                nivoRun(slider, kids, settings, 'next');
            });
        }
        
        //Add Control nav
        if(settings.quickNav && settings.quickNav!="none"){
            var quickNav1 = $('<div class="quickNav1 ' + settings.quickNav + '"><div class="quickNav2"><div class="quickNav3"></div></div></div>');
            sliderMain.append(quickNav1);
			var quickNav = $(".quickNav3", quickNav1);
            for(var i = 0; i < kids.length; i++){
                /*if(settings.controlNavThumbs){*/
                    var child = kids.eq(i);
                    if(!child.is('img')){
                        child = child.find('img:first');
                    }
                    /*if (settings.controlNavThumbsFromRel) {
                        nivoControl.append('<a class="nivo-control" rel="'+ i +'"><img src="'+ child.attr('rel') + '" alt="" /></a>');
                    } else {
                        nivoControl.append('<a class="nivo-control" rel="'+ i +'"><img src="'+ child.attr('src').replace(settings.controlNavThumbsSearch, settings.controlNavThumbsReplace) +'" alt="" /></a>');
                    }
                } else {*/
					var thumbTitle = getTextDescription(child.attr("title"))[0];
                    quickNav.append('<a class="nivo-control" rel="'+ i +'" title="' + thumbTitle + '">'+ (i + 1) +'</a>');
                //}
                
            }
			var centerOffset = Math.abs(quickNav1.position().left / slider.width() - .5);
			if(centerOffset < .05)
			{
				//center bullets
				quickNav1.css("margin-left", quickNav1.width() / -2 );
			}

			var quickNav1Top = parseInt(quickNav1.css("top"));
			var quickNav1Bottom = parseInt(quickNav1.css("bottom"));
			if (quickNav1Top < 0)
			{
				sliderFrame.css("margin-top", quickNav1Top * -1 - quickNav1.height());
			}
			else if (quickNav1Bottom < 0)
			{
				sliderFrame.css("margin-bottom", quickNav1Bottom * -1 - quickNav1.height());
			}

            //Set initial active link
            $('a:eq('+ vars.currentSlide +')', quickNav).addClass('active');

			$('a', quickNav).click(function(){
                navigationItemClicked(this);
			});

			$('a', quickNav).mouseenter(function(){
				
			});
        }

		if(settings.thumbNav){
			//add thumbnail list
            var thumbNav = $('<div class="thumbNav ' + settings.thumbNav + '"><div class="thumbNavInner"></div></div>');
            var thumbNavInner = $('.thumbNavInner', thumbNav);
            slider.append(thumbNav);
			for(var i = 0; i < kids.length; i++){
				var child = kids.eq(i);
				if(!child.is('img')){
                        child = child.find('img:first');
                    }

				var thumbUrl = child.attr("alt");
				var thumbTitle = getTextDescription(child.attr("title"))[0];
				thumbNavInner.append('<a class="tn-item" rel="'+ i +'"><span class="tn-title">'+thumbTitle+'</span><img src="'+thumbUrl+'" alt="" /></a>');
			}

            $('.thumbNav a', slider).live('click', function(){
				navigationItemClicked(this);
            });

			$('.tn-item:eq('+ vars.currentSlide +')', slider).addClass('active');

			if (!settings.thumbNavCover)
			{
				//outside the image area
				if(parseInt(thumbNav.css("bottom")) == 0)
				{
					var sliderMainHeight = sliderMain.height();
					sliderMain.css("height", sliderMainHeight);
					var extraHeight = thumbNav.height() + parse(thumbNav.css("margin-top"));
					slider.css("height", sliderMain.height() + extraHeight);

					//increase the bottom of quickNav as well
					var quickNav1 = $(".quickNav1", slider);
					var quickNav1Bottom = parseInt(quickNav1.css("bottom"));
					if(quickNav1Bottom < 0)
					{
						quickNav1.css("bottom", quickNav1Bottom - extraHeight);
					}
				}
				else if(parseInt(thumbNav.css("top")) == 0)
				{
					var sliderMainHeight = sliderMain.height();
					sliderMain.css("height", sliderMainHeight);
					var extraHeight = thumbNav.height() + parse(thumbNav.css("margin-bottom"));
					//slider.css("height", sliderMain.height() + extraHeight);
					sliderMain.css("top", extraHeight);

					//increase the bottom of quickNav as well
					var quickNav1 = $(".quickNav1", slider);
					var quickNav1Top = parseInt(quickNav1.css("top"));
					if(quickNav1Top < 0)
					{
						quickNav1.css("top", quickNav1Top - extraHeight);
					}
				}
				else if(parseInt(thumbNav.css("right")) == 0)
				{
					var extraWidth = thumbNav.width() + parse(thumbNav.css("margin-left"));
					slider.css("width", sliderMain.width() + extraWidth);
				}
			}
		}

		var frame = slider.parent().parent().parent().parent();
		if(settings.frame){
			//the border is actually outside this slider
			frame.addClass(settings.frame);
		}

		if(settings.overlay && settings.overlay!="none"){
			//add overlay
            var overlay = $('<div class="overlay ' + settings.overlay + '"></div>');
            sliderFrame.append(overlay);
		}
        
        //Keyboard Navigation
        if(settings.keyboardNav){
            $(window).keypress(function(event){
                //Left
                if(event.keyCode == '37'){
                    if(vars.running) return false;
                    clearInterval(timer);
                    timer = '';
                    vars.currentSlide-=2;
                    nivoRun(slider, kids, settings, 'prev');
                }
                //Right
                if(event.keyCode == '39'){
                    if(vars.running) return false;
                    clearInterval(timer);
                    timer = '';
                    nivoRun(slider, kids, settings, 'next');
                }
            });
        }

		if (settings.countDown && settings.countDown!="none")
		{
			//create count down button
            var countDown = $('<div class="countDown ' + settings.countDown + '"><div class="cd-inner"></div></div>');
			countDown.data("style", settings.countDown);
            sliderMain.append(countDown);
		}

		if (settings.controlBar && settings.controlBar!="none")
		{
            var controlBar = $('<div class="controlBar ' + settings.controlBar + '"><div class="cb-inner"><a class="cb-previous"></a><a class="cb-play"></a><a class="cb-next"></a></div></div>');
            sliderMain.append(controlBar);

			$('a.cb-previous', slider).live('click', function(){
				if(vars.running) return false;
				clearInterval(timer);
				timer = '';
				vars.currentSlide -= 2;
				nivoRun(slider, kids, settings, 'prev');
            });
			$('a.cb-next', slider).live('click', function(){
                if(vars.running) return false;
                clearInterval(timer);
                timer = '';
                nivoRun(slider, kids, settings, 'next');
            });
			$('a.cb-play', slider).live('click', function(){
				if (!vars.stop)
				{
					stopAutoPlay();
					stopCountDown();
				}
				else
				{
					startAutoPlay();
				}
            });

			if (!settings.manualAdvance)
			{
				$('a.cb-play', slider).addClass("active");
			}
			else
			{
				vars.stop = true;
				$(".countDown").hide();
			}

		}
        
        //For pauseOnHover setting
        if(settings.pauseOnHover){
            slider.hover(function(){
                vars.paused = true;
                clearInterval(timer);
                timer = '';

				//clear countdown
				stopCountDown();
            }, function(){
                vars.paused = false;
                //Restart the timer
                if(timer == '' && !settings.manualAdvance){
                    timer = setInterval(function(){ nivoRun(slider, kids, settings, false); }, settings.pauseTime);
                }

				//restart countdown
				if (vars.mediaSlideIndex < 0) //not a media
				{
					startCountDown();
				}

            });
        }

		//tweak fade to hide when use IE
		if (navigator.appName == "Microsoft Internet Explorer")
		{
			if (settings.directionNavHide == "fade")
				settings.directionNavHide = "hide";
			if (settings.quickNavHide == "fade")
				settings.quickNavHide = "hide";
		}

        //Hide controls when hover?
        showControls(false);
        slider.hover(function(){
            showControls(true);
         }, function(){
            showControls(false);
        });
        
        //Event when Animation finishes
        slider.bind('nivo:animFinished', function(){ 
			if (!vars.running)
			{
				trace("canceled animFinished because it seems to be executed before.");
				return;
			}

            vars.running = false; 

            //Hide child links
            $(kids).each(function(){
                if($(this).is('a')){
                    $(this).css('display','none');
                }
            });
            replaceRichContent();
            //Restart the timer
			/*if (timer)
			{
				clearTimeout(timer);
			}*/
            if(timer){
				clearInterval(timer);
                timer = setInterval(function(){ nivoRun(slider, kids, settings, false); }, settings.pauseTime);
            }
            //Trigger the afterChange callback
            settings.afterChange.call(this);
        });

		if((navigator.userAgent.match(/iPhone/i)) 
			|| (navigator.userAgent.match(/iPod/i)) 
				|| (navigator.userAgent.match(/iPad/i)))
			vars.useHtml5 = true;
		else
			vars.useHtml5 = false;
			
		this.videoEnd = function()
		{
			//
			trace("videoEnd fired.");
			vars.waitForMediaFinishEvent = false;
			/*if(!vars.paused && !settings.manualAdvance){
                nivoRun(slider, kids, settings, false);
            }*/

		}

		var startCountDown = function()
		{
			if (vars.stop)
			{
				return;
			}

			var element = $(".countDown", slider);
			if (element.length == 0)
			{
				return;
			}

			var inner = element.children();
			element.show();
			inner.stop();

			var cdType;
			if (element.data("style"))
			{
				cdType = element.data("style")/*settings.countDown*/.substring(0,4);
			}
			else
			{
				cdType = settings.countDown.substring(0,4);
			}

			if (cdType == "hrz-")
			{
				inner.css("width", 0);
				inner.animate({"width": element.width()}, {easing:'linear', duration:settings.pauseTime, complete:function(){element.hide();}});
			}
			else if (cdType == "vtc-")
			{
				inner.css("height", 0);
				inner.animate({"height": element.height()}, {easing:'linear', duration:settings.pauseTime, complete:function(){element.hide();}});
			}
			else if (cdType == "nmr-" || cdType == "bgd-")
			{
				if (vars.countDownTimer > 0)
				{
					clearInterval(vars.countDownTimer);
					vars.countDownTimer = -1;
				}
				if (cdType == "bgd-")
				{
					element.css("backgroundPosition", "0px 100px");
				}
				element.children().html("");
				vars.countDown = settings.pauseTime/1000;
				vars.countDownTimer = setInterval(function(){ countDown(slider); }, 1000);
			}
			else
			{
				//disabled?
			}
		}

		var stopCountDown = function()
		{
			if (settings.countDown != "")
			{
				if (vars.countDownTimer > 0)
				{
					clearInterval(vars.countDownTimer);
					vars.countDownTimer = -1;
				}

				var element = $(".countDown", slider);
				var inner = element.children();
				inner.stop();
				element.hide();
			}		
		}

		var replaceRichContent = function()
		{
			vars.mediaSlideIndex = -1;
            if($(kids[vars.currentSlide]).is('a')){
				var aTag = $(kids[vars.currentSlide]);

                aTag.css('display','block');

				if (aTag.hasClass("media"))
				{
					var showControlBar = "&showControlBar=True";
					if (!settings.mediaControlBar)
					{
						showControlBar = "&showControlBar=False";
					}

					var mediaUrl = aTag.find("img").attr("alt");
					var extension = mediaUrl.toLowerCase().substring(mediaUrl.length - 4, mediaUrl.length);
					var mediaHtml = "";
					if (extension == ".mp4" || extension == ".flv")
					{
						//is a video
						if (vars.useHtml5)
						{
							mediaHtml = "<video src='" + mediaUrl + "' type='video/mp4' width='100%' height='100%' autoplay='true' controls='controls' />";
						}
						else
						{
							var extraParams = "&autoStart=" + (settings.videoAutoStart?"true":"false");
							if (!doubleClickNotified)
							{
								doubleClickNotified = true;
								extraParams += "&notification=Double click to watch in full screen";
							}
							mediaHtml = "<object allowFullScreen='True' allowScriptAccess='always' wmode='transparent' width='100%' height='100%'><param name='movie' value='"+settings.modulePath+"SimpleVideo.swf' /><param name='allowFullScreen' value='true' /><param name='wmode' value='transparent' /><param name='flashvars' value='sender="+instanceName+"&video="+mediaUrl+showControlBar+extraParams+"' /><embed src='"+settings.modulePath+"SimpleVideo.swf' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' wmode='transparent' width='100%' height='100%' flashvars='sender="+instanceName+"&video="+mediaUrl+showControlBar+extraParams+"'></embed></object>"
						}

					}
					else if (extension == ".mp3")
					{
						//is a audio
						if (vars.useHtml5)
						{
							mediaHtml = "<audio src='" + mediaUrl + "' type='audio/mp3' width='100%' height='100%' autoplay='true' controls='controls' />";
						}
						else
						{
							mediaHtml = "<object allowFullScreen='True' allowScriptAccess='always' wmode='transparent' width='100%' height='100%'><param name='movie' value='"+settings.modulePath+"SimpleAudio.swf' /><param name='allowFullScreen' value='true' /><param name='wmode' value='transparent' /><param name='flashvars' value='sender="+instanceName+"&audio="+mediaUrl+showControlBar+"' /><embed src='"+settings.modulePath+"SimpleAudio.swf' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' wmode='transparent' width='100%' height='100%' flashvars='sender="+instanceName+"&audio="+mediaUrl+showControlBar+"'></embed></object>"
						}
					}

					aTag.append(mediaHtml);
					vars.waitForMediaFinishEvent = true;
					vars.mediaSlideIndex = vars.currentSlide;
				}
            }

			if(!settings.manualAdvance && kids.length > 1){
				startCountDown();
			}
		}

		//Manually trigger this method for the 1st slide
		replaceRichContent();
        
        // Add slices for slice animations
        var createSlices = function(slider, settings, vars){
            for(var i = 0; i < settings.slices; i++){
				var sliceWidth = Math.round(slider.width()/settings.slices);
				if(i == settings.slices-1){
					sliderMain.append(
						$('<div class="nivo-slice"></div>').css({ 
							left:(sliceWidth*i)+'px', width:(slider.width()-(sliceWidth*i))+'px',
							height:'0px', 
							opacity:'0', 
							background: 'url("'+ vars.currentImage.attr('src') +'") no-repeat -'+ ((sliceWidth + (i * sliceWidth)) - sliceWidth) +'px 0%'
						})
					);
				} else {
					sliderMain.append(
						$('<div class="nivo-slice"></div>').css({ 
							left:(sliceWidth*i)+'px', width:sliceWidth+'px',
							height:'0px', 
							opacity:'0', 
							background: 'url("'+ vars.currentImage.attr('src') +'") no-repeat -'+ ((sliceWidth + (i * sliceWidth)) - sliceWidth) +'px 0%'
						})
					);
				}
			}
        }
		
		// Add boxes for box animations
		var createBoxes = function(slider, settings, vars){
			var boxWidth = Math.round(slider.width()/settings.boxCols);
			var boxHeight = Math.round(slider.height()/settings.boxRows);
			
			for(var rows = 0; rows < settings.boxRows; rows++){
				for(var cols = 0; cols < settings.boxCols; cols++){
					if(cols == settings.boxCols-1){
						sliderMain.append(
							$('<div class="nivo-box"></div>').css({ 
								opacity:0,
								left:(boxWidth*cols)+'px', 
								top:(boxHeight*rows)+'px',
								width:(slider.width()-(boxWidth*cols))+'px',
								height:boxHeight+'px',
								background: 'url("'+ vars.currentImage.attr('src') +'") no-repeat -'+ ((boxWidth + (cols * boxWidth)) - boxWidth) +'px -'+ ((boxHeight + (rows * boxHeight)) - boxHeight) +'px'
							})
						);
					} else {
						sliderMain.append(
							$('<div class="nivo-box"></div>').css({ 
								opacity:0,
								left:(boxWidth*cols)+'px', 
								top:(boxHeight*rows)+'px',
								width:boxWidth+'px',
								height:boxHeight+'px',
								background: 'url("'+ vars.currentImage.attr('src') +'") no-repeat -'+ ((boxWidth + (cols * boxWidth)) - boxWidth) +'px -'+ ((boxHeight + (rows * boxHeight)) - boxHeight) +'px'
							})
						);
					}
				}
			}
		}

        // Private run method
		var nivoRun = function(slider, kids, settings, nudge){
			//Get our vars
			var vars = slider.data('nivo:vars');
			trace("nivoRun");

			if (vars.waitForMediaFinishEvent)
			{
				if (nudge)
				{
					trace("calling nivoRun with nudge, I have to stop.");
					vars.waitForMediaFinishEvent = false;
				}
				else
				{
					trace("waitForMediaFinishEvent");
					return;
				}
			}

			//check to see if there is a rich media element.
			if(vars.mediaSlideIndex >= 0)
			{
				var aTag = $(kids[vars.mediaSlideIndex]);
				//alert(aTag.children().length);
				//alert(aTag.children().not("img").length);
				aTag.children().not("img").remove();

				trace(vars.currentSlide + " terminated");
			}

            
            //Trigger the lastSlide callback
            if(vars && (vars.currentSlide == vars.totalSlides - 1)){ 
				settings.lastSlide.call(this);
			}
            
            // Stop
			if((!vars || vars.stop) && !nudge) return false;
			
			//Trigger the beforeChange callback
			settings.beforeChange.call(this);

			if (settings.countDown != "")
			{
				$(".countDown", slider).hide();
			}
					
			//Set current background before change
			if(!nudge){
				sliderMain.css('background','url("'+ vars.currentImage.attr('src') +'") no-repeat');
			} else {
				if(nudge == 'prev'){
					sliderMain.css('background','url("'+ vars.currentImage.attr('src') +'") no-repeat');
				}
				if(nudge == 'next'){
					sliderMain.css('background','url("'+ vars.currentImage.attr('src') +'") no-repeat');
				}
			}
			vars.currentSlide++;
            //Trigger the slideshowEnd callback
			if(vars.currentSlide == vars.totalSlides){ 
				vars.currentSlide = 0;
				settings.slideshowEnd.call(this);
			}
			if(vars.currentSlide < 0) vars.currentSlide = (vars.totalSlides - 1);
			//Set vars.currentImage
			if($(kids[vars.currentSlide]).is('img')){
				vars.currentImage = $(kids[vars.currentSlide]);
			} else {
				vars.currentImage = $(kids[vars.currentSlide]).find('img:first');
			}
			
			//Set active links
			if(settings.quickNav){
				$('.quickNav3 a', slider).removeClass('active');
				$('.quickNav3 a:eq('+ vars.currentSlide +')', slider).addClass('active');
			}
			if(settings.thumbNav){
				$('.thumbNav a', slider).removeClass('active');
				$('.thumbNav a:eq('+ vars.currentSlide +')', slider).addClass('active');
			}
			
			//Process caption
			processCaption(settings);

			//ensure the corresponding item on thumbNav is vislbe
			ensureThumbNavVisible();
			
			// Remove any slices from last transition
			$('.nivo-slice', slider).remove();
			
			// Remove any boxes from last transition
			$('.nivo-box', slider).remove();
			
			if(settings.effect == 'random'){
				var anims = new Array('sliceDownRight','sliceDownLeft','sliceUpRight','sliceUpLeft','sliceUpDown','sliceUpDownLeft','fold','fade',
                'boxRandom','boxRain','boxRainReverse','boxRainGrow','boxRainGrowReverse');
				vars.randAnim = anims[Math.floor(Math.random()*(anims.length + 1))];
				if(vars.randAnim == undefined) vars.randAnim = 'fade';
			}
            
            //Run random effect from specified set (eg: effect:'fold,fade')
            if(settings.effect.indexOf(',') != -1){
                var anims = settings.effect.split(',');
                vars.randAnim = anims[Math.floor(Math.random()*(anims.length))];
				if(vars.randAnim == undefined) vars.randAnim = 'fade';
            }
		
			//Run effects
			vars.running = true;
			if(settings.effect == 'sliceDown' || settings.effect == 'sliceDownRight' || vars.randAnim == 'sliceDownRight' ||
				settings.effect == 'sliceDownLeft' || vars.randAnim == 'sliceDownLeft'){
				createSlices(slider, settings, vars);
				var timeBuff = 0;
				var i = 0;
				var slices = $('.nivo-slice', slider);
				if(settings.effect == 'sliceDownLeft' || vars.randAnim == 'sliceDownLeft') slices = $('.nivo-slice', slider)._reverse();
				
				slices.each(function(){
					var slice = $(this);
					slice.css({ 'top': '0px' });
					if(i == settings.slices-1){
						setTimeout(function(){
							slice.animate({ height:'100%', opacity:'1.0' }, settings.animSpeed, '', function(){ slider.trigger('nivo:animFinished'); });
						}, (100 + timeBuff));
					} else {
						setTimeout(function(){
							slice.animate({ height:'100%', opacity:'1.0' }, settings.animSpeed);
						}, (100 + timeBuff));
					}
					timeBuff += 50;
					i++;
				});
			} 
			else if(settings.effect == 'sliceUp' || settings.effect == 'sliceUpRight' || vars.randAnim == 'sliceUpRight' ||
					settings.effect == 'sliceUpLeft' || vars.randAnim == 'sliceUpLeft'){
				createSlices(slider, settings, vars);
				var timeBuff = 0;
				var i = 0;
				var slices = $('.nivo-slice', slider);
				if(settings.effect == 'sliceUpLeft' || vars.randAnim == 'sliceUpLeft') slices = $('.nivo-slice', slider)._reverse();
				
				slices.each(function(){
					var slice = $(this);
					slice.css({ 'bottom': '0px' });
					if(i == settings.slices-1){
						setTimeout(function(){
							slice.animate({ height:'100%', opacity:'1.0' }, settings.animSpeed, '', function(){ slider.trigger('nivo:animFinished'); });
						}, (100 + timeBuff));
					} else {
						setTimeout(function(){
							slice.animate({ height:'100%', opacity:'1.0' }, settings.animSpeed);
						}, (100 + timeBuff));
					}
					timeBuff += 50;
					i++;
				});
			} 
			else if(settings.effect == 'sliceUpDown' || settings.effect == 'sliceUpDownRight' || vars.randAnim == 'sliceUpDown' || 
					settings.effect == 'sliceUpDownLeft' || vars.randAnim == 'sliceUpDownLeft'){
				createSlices(slider, settings, vars);
				var timeBuff = 0;
				var i = 0;
				var v = 0;
				var slices = $('.nivo-slice', slider);
				if(settings.effect == 'sliceUpDownLeft' || vars.randAnim == 'sliceUpDownLeft') slices = $('.nivo-slice', slider)._reverse();
				
				slices.each(function(){
					var slice = $(this);
					if(i == 0){
						slice.css('top','0px');
						i++;
					} else {
						slice.css('bottom','0px');
						i = 0;
					}
					
					if(v == settings.slices-1){
						setTimeout(function(){
							slice.animate({ height:'100%', opacity:'1.0' }, settings.animSpeed, '', function(){ slider.trigger('nivo:animFinished'); });
						}, (100 + timeBuff));
					} else {
						setTimeout(function(){
							slice.animate({ height:'100%', opacity:'1.0' }, settings.animSpeed);
						}, (100 + timeBuff));
					}
					timeBuff += 50;
					v++;
				});
			} 
			else if(settings.effect == 'fold' || vars.randAnim == 'fold'){
				createSlices(slider, settings, vars);
				var timeBuff = 0;
				var i = 0;
				
				$('.nivo-slice', slider).each(function(){
					var slice = $(this);
					var origWidth = slice.width();
					slice.css({ top:'0px', height:'100%', width:'0px' });
					if(i == settings.slices-1){
						setTimeout(function(){
							slice.animate({ width:origWidth, opacity:'1.0' }, settings.animSpeed, '', function(){ slider.trigger('nivo:animFinished'); });
						}, (100 + timeBuff));
					} else {
						setTimeout(function(){
							slice.animate({ width:origWidth, opacity:'1.0' }, settings.animSpeed);
						}, (100 + timeBuff));
					}
					timeBuff += 50;
					i++;
				});
			}  
			else if(settings.effect == 'fade' || vars.randAnim == 'fade'){
				createSlices(slider, settings, vars);
				
				var firstSlice = $('.nivo-slice:first', slider);
                firstSlice.css({
                    'height': '100%',
                    'width': slider.width() + 'px'
                });
    
				firstSlice.animate({ opacity:'1.0' }, (settings.animSpeed*2), '', function(){ slider.trigger('nivo:animFinished'); });
			}          
            else if(settings.effect == 'slideInRight' || vars.randAnim == 'slideInRight'){
				createSlices(slider, settings, vars);
				
                var firstSlice = $('.nivo-slice:first', slider);
                firstSlice.css({
                    'height': '100%',
                    'width': '0px',
                    'opacity': '1'
                });

                firstSlice.animate({ width: slider.width() + 'px' }, (settings.animSpeed*2), '', function(){ slider.trigger('nivo:animFinished'); });
            }
            else if(settings.effect == 'slideInLeft' || vars.randAnim == 'slideInLeft'){
				createSlices(slider, settings, vars);
				
                var firstSlice = $('.nivo-slice:first', slider);
                firstSlice.css({
                    'height': '100%',
                    'width': '0px',
                    'opacity': '1',
                    'left': '',
                    'right': '0px'
                });

                firstSlice.animate({ width: slider.width() + 'px' }, (settings.animSpeed*2), '', function(){ 
                    // Reset positioning
                    firstSlice.css({
                        'left': '0px',
                        'right': ''
                    });
                    slider.trigger('nivo:animFinished'); 
                });
            }
			else if(settings.effect == 'boxRandom' || vars.randAnim == 'boxRandom'){
				createBoxes(slider, settings, vars);
				
				var totalBoxes = settings.boxCols * settings.boxRows;
				var i = 0;
				var timeBuff = 0;
				
				var boxes = shuffle($('.nivo-box', slider));
				boxes.each(function(){
					var box = $(this);
					if(i == totalBoxes-1){
						setTimeout(function(){
							box.animate({ opacity:'1' }, settings.animSpeed, '', function(){ slider.trigger('nivo:animFinished'); });
						}, (100 + timeBuff));
					} else {
						setTimeout(function(){
							box.animate({ opacity:'1' }, settings.animSpeed);
						}, (100 + timeBuff));
					}
					timeBuff += 20;
					i++;
				});
			}
			else if(settings.effect == 'boxRain' || vars.randAnim == 'boxRain' || settings.effect == 'boxRainReverse' || vars.randAnim == 'boxRainReverse' || 
                    settings.effect == 'boxRainGrow' || vars.randAnim == 'boxRainGrow' || settings.effect == 'boxRainGrowReverse' || vars.randAnim == 'boxRainGrowReverse'){
				createBoxes(slider, settings, vars);
				
				var totalBoxes = settings.boxCols * settings.boxRows;
				var i = 0;
				var timeBuff = 0;
				
				// Split boxes into 2D array
				var rowIndex = 0;
				var colIndex = 0;
				var box2Darr = new Array();
				box2Darr[rowIndex] = new Array();
				var boxes = $('.nivo-box', slider);
				if(settings.effect == 'boxRainReverse' || vars.randAnim == 'boxRainReverse' ||
                   settings.effect == 'boxRainGrowReverse' || vars.randAnim == 'boxRainGrowReverse'){
					boxes = $('.nivo-box', slider)._reverse();
				}
				boxes.each(function(){
					box2Darr[rowIndex][colIndex] = $(this);
					colIndex++;
					if(colIndex == settings.boxCols){
						rowIndex++;
						colIndex = 0;
						box2Darr[rowIndex] = new Array();
					}
				});
				
				// Run animation
				for(var cols = 0; cols < (settings.boxCols * 2); cols++){
					var prevCol = cols;
					for(var rows = 0; rows < settings.boxRows; rows++){
						if(prevCol >= 0 && prevCol < settings.boxCols){
							/* Due to some weird JS bug with loop vars 
							being used in setTimeout, this is wrapped
							with an anonymous function call */
							(function(row, col, time, i, totalBoxes) {
								var box = $(box2Darr[row][col]);
                                var w = box.width();
                                var h = box.height();
                                if(settings.effect == 'boxRainGrow' || vars.randAnim == 'boxRainGrow' ||
                                   settings.effect == 'boxRainGrowReverse' || vars.randAnim == 'boxRainGrowReverse'){
                                    box.width(0).height(0);
                                }
								if(i == totalBoxes-1){
									setTimeout(function(){
										box.animate({ opacity:'1', width:w, height:h }, settings.animSpeed/1.3, '', function(){ slider.trigger('nivo:animFinished'); });
									}, (100 + time));
								} else {
									setTimeout(function(){
										box.animate({ opacity:'1', width:w, height:h }, settings.animSpeed/1.3);
									}, (100 + time));
								}
							})(rows, prevCol, timeBuff, i, totalBoxes);
							i++;
						}
						prevCol--;
					}
					timeBuff += 100;
				}
			}
		}
		
		// Shuffle an array
		var shuffle = function(arr){
			for(var j, x, i = arr.length; i; j = parseInt(Math.random() * i), x = arr[--i], arr[i] = arr[j], arr[j] = x);
			return arr;
		}
        
        // Start / Stop
        /*this.stop = function(){
            if(!$(element).data('nivo:vars').stop){
                $(element).data('nivo:vars').stop = true;
                trace('Stop Slider');
            }
        }
        
        this.start = function(){
            if($(element).data('nivo:vars').stop){
                $(element).data('nivo:vars').stop = false;
                trace('Start Slider');
            }
        }*/

		var stopAutoPlay = function()
		{
            if(!slider.data('nivo:vars').stop){
                slider.data('nivo:vars').stop = true;
				$('a.cb-play', slider).removeClass("active");
                trace('Stop Slider');
            }
		}

		var startAutoPlay = function()
		{
            if(slider.data('nivo:vars').stop){
                slider.data('nivo:vars').stop = false;
				$('a.cb-play', slider).addClass("active");
                trace('Start Slider');

				timer = setInterval(function(){ nivoRun(slider, kids, settings, false); }, settings.pauseTime);
				trace("startAutoPlay");
				startCountDown();
            }
		}
        


		//countDown
		var countDown = function(slider)
		{
			var vars = slider.data('nivo:vars');
			var countDown = $(".countDown", slider);
			vars.countDown --;

			if (vars.countDown > 0)
			{
				var cdType = settings.countDown.substring(0,4);
				if (cdType == "nmr-")
				{
					countDown.children().html(vars.countDown);
				}
				else if (cdType == "bgd-")
				{
					var cdWidth = countDown.width();
					countDown.css("backgroundPosition", "0px -" + cdWidth * (vars.countDown -1) + "px");
				}
			}
			else
			{
				countDown.hide();
			}
		}

        //Trigger the afterLoad callback
        settings.afterLoad.call(this);
		
		return this;
    };
        
    $.fn.nivoSlider = function(options) {
    
        return this.each(function(key, value){
            var element = $(this);
            // Return early if this element already has a plugin instance
            if (element.data('nivoslider')) return element.data('nivoslider');
            // Pass options to plugin constructor
            var nivoslider = new NivoSlider(this, options);
            // Store plugin object in this element's data
            element.data('nivoslider', nivoslider);

			this.videoEnd = function()
			{
				nivoslider.videoEnd();
			}
        });

	};
	
	//Default settings
	$.fn.nivoSlider.defaults = {
		effect: 'random',
		slices: 15,
		boxCols: 8,
		boxRows: 4,
		animSpeed: 500,
		pauseTime: 5000,
		startSlide: 0,
		//controlNavThumbs: false,
        //controlNavThumbsFromRel: false,
		//controlNavThumbsSearch: '.jpg',
		//controlNavThumbsReplace: '_thumb.jpg',
		keyboardNav: true,
		pauseOnHover: false,
		manualAdvance: false,
		//captionOpacity: 0.8,
		prevText: 'Prev',
		nextText: 'Next',
		beforeChange: function(){},
		afterChange: function(){},
		slideshowEnd: function(){},
        lastSlide: function(){},
        afterLoad: function(){}


		//modulePath
		,modulePath: '',

		//UI Parts
		directionNav: 'darkknight',
		directionNavHide: "",
		quickNav: 'darkknight',
		quickNavHide: '',
		countDown:'',
		controlBar:'none',
		thumbNav:'',
		thumbNavCover:true,
		overlay:'none',
		caption:'none',
		captionHide: '',
		captionEffect: "direct",
		readMoreInNewWindow:true,
		frame:'none',

		//behaviors
		mediaControlBar:true,
		videoAutoStart:true
	};
	
	$.fn._reverse = [].reverse;
	
})(jQuery);

