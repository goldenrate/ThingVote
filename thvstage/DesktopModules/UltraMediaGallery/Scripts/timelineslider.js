(function(jQuery){
 jQuery.fn.timelineslider = function(options) {
    
	var defaults = {
		autoplay:false,
		pauseTime:5,
		transition:'slide',
		numberOfPhotos:'morethanone', //'always', 'no'
		desc:'onhover',
		quicknav:'onhover',
		xofy:'always',
		moretext:'More'
	};
  
	var options = jQuery.extend(defaults, options);
    
	return this.each(function() {
		var _this = this;
		var me = jQuery(this);
		var log = jQuery("#log");
		var instanceName = 'jQuery("#'+me.attr("ID")+'")[0]';
		var onhover = false;

		var slidesouter = me.find(".slidesouter");
		var slides = me.find(".slides");
		var slide = me.find(".slide");
		var markers = me.find(".markers");

		var CURRENT_Z_INDEX = 10;

		slidesouter.hover(function(){
				onhover = true;
			}, function(){
				onhover = false;
		});

		var descouter = me.find(".descouter");
		var desc = me.find(".desc");
		if (options.desc == "onhover")
		{
			descouter.hide();
			me.hover(function(){
				descouter.show();
			},function(){
				descouter.hide();
			});
		}
		else if (options.desc == "no")
		{
			descouter.hide();
		}

		var xofy = me.find(".xofyouter");
		if (options.xofy == "onhover")
		{
			xofy.hide();
			me.hover(function(){
				xofy.show();
			},function(){
				xofy.hide();
			});
		}
		else if (options.xofy == "no")
		{
			xofy.hide();
		}

		//implement draggable slider
		var dragstate = 0;
		var dragstart = 0;
		var sliderx;
		var draggable = me.find(".draggable");
		var dragarea = draggable.parent();
		var timeline = dragarea.parent();
		var jdoc = jQuery(document);

		function draggable_down()
		{
			if (dragstate == 1)
			{
				return;
			}
			dragstate = 1;
			log.append("<p>down</p>");
		}

		function draggable_move(x)
		{
			if (dragstate == 1)
			{
				dragstate = 2;
				dragstart = x;
				sliderx = draggable.position().left;
				log.append("<p>detected first move</p>");
			}

			if (dragstate == 2)
			{
				var newx = sliderx + x - dragstart;
				if (newx < 0)
				{
					newx = 0;
				}
				else if (newx > dragarea.width())
				{
					newx = dragarea.width();
				}
				draggable.css("left", newx+"px");
				//log.append("<p>slider to "+newx+", "+sliderx+"/"+x+"/"+dragstart+"</p>");
			}
		}

		function draggable_up()
		{
			if (dragstate == 2)
			{
				dragstate = 0;

				var newx = draggable.position().left;
				var percentage = newx / dragarea.width();

				moveToTime(percentage);

				log.append("<p>released at "+percentage+"%,("+newx+"/"+sliderx+")</p>");
			}
		}

		draggable.bind("mousedown", function(e){
			if (dragstate == 2)
			{
				draggable_up();
				return;
			}
			if (e.preventDefault())
			{
				e.preventDefault();
			}
			draggable_down();
		});

		jdoc.bind("mousemove", function(e){
			draggable_move(e.pageX);
		});

		jdoc.bind("mouseup", function(e){
			draggable_up();
		});

		//handle touch events
		if (document.addEventListener)
		{
			draggable.get(0).addEventListener('touchstart', function(e) {
			//draggable.bind("touchstart", function(e){
				e.preventDefault();
				draggable_down();
			});

			document.addEventListener('touchmove', function(e) {
			//jdoc.bind("touchmove", function(e){
				e.preventDefault();
				draggable_move(e.touches[0].pageX);
			});

			document.addEventListener('touchend', function(e) {
			//jdoc.bind("touchend", function(e){
				e.preventDefault();
				draggable_up();
			});
		}


		//handle markers
		var times = new Array();
		var timelabels = new Array();
		var counts = new Array();

		var currentPhoto = 0;
		var timeIsNumber = true;
		for (var i=0;i<slide.length ;i++ )
		{
			var slidei = jQuery(slide[i]);
			var time = slidei.data("time");
			var timelabel = slidei.data("timelabel");
			if (!time)
			{
				time = timelabel;
				timeIsNumber = false;
			}

			var timeindex = jQuery.inArray(timelabel,timelabels);
			if (timeindex == -1)
			{
				times.push(time);
				timelabels.push(timelabel);
				counts.push(1);
			}
			else
			{
				//already in array!
				counts[timeindex] += 1;
			}
		}

		if (timelabels.length ==0)
		{
			return;
		}

		var minX;
		var maxX;
		if (times.length ==1)
		{
			minX = times[0];
			maxX = times[0];
		}
		else
		{
			minX = times[0];
			maxX = times[times.length-1];
		}
		var duration = maxX - minX;

		for (var i=0;i<times.length ;i++ )
		{
			var photoCount = counts[i];
			var position;
			if (timeIsNumber)
			{
				position = (times[i]-minX) / duration;
			}
			else
			{
				if (times.length > 1)
				{
					position = i / (times.length - 1);
				}
				else
				{
					position = 0.5;
				}
			}
			var timeToDisplay = timelabels[i];
			if (options.numberOfPhotos == 'always' || (options.numberOfPhotos == 'morethanone' && photoCount > 1))
			{
				timeToDisplay += " ("+photoCount+")";
			}
			var marker = jQuery("<a href='javascript:void(0);' class='marker'><span>"+timeToDisplay+"</span></a>");
			marker.data("time", times[i]);
			marker.data("timelabel", timelabels[i]);
			marker.data("percentage", position);
			markers.append(marker);
			marker.css("width", marker.width());
			marker.css("left", (position * 100) + "%");

			//check to see if there is enough place to show this marker
			marker.css("margin-left", marker.width() / -2);
		}

		var marker = markers.children();
		setActiveMarker(0);

		//hide text of markers that overlaps previous item
		var marker0 = jQuery(marker[0]);
		var lastitemx = marker0.position().left + marker0.width() / 2;
		for (var i=1;i<=marker.length - 1 ;i++ )
		{
			var markeri = jQuery(marker[i]);
			var itemx = markeri.position().left - markeri.width() / 2;
			//alert(i+"/"+marker.length+"/"+itemx +"/"+ lastitemx);
			if (itemx < lastitemx)
			{
				markeri.addClass("expended");
				//markeri.html("");
			}
			else
			{
				lastitemx = markeri.position().left + markeri.width() / 2;
			}
		}

		var marker = me.find(".marker");
		marker.click(function(){
			//marker.removeClass("active");
			//jQuery(this).addClass("active");

			var totime = jQuery(this).data("timelabel");

			for (var i=0;i<slide.length ;i++ )
			{
				var time = jQuery(slide[i]).data("timelabel");
				if (time == totime)
				{
					moveToSlide(i);
					return;
				}
			}
		});

		function moveToTime(percentage)
		{
			var index = 0;
			var offset = 1;
			for (var i=0;i<marker.length ;i++ )
			{
				var markerpercentage = jQuery(marker[i]).data("percentage") * 1;
				if (Math.abs(markerpercentage - percentage) < offset)
				{
					offset = Math.abs(markerpercentage - percentage);
					index = i;
				}
			}

			jQuery(marker[index]).click();
		}

		function moveToSlide(index)
		{
			if ((index == currentPhoto+1) || (index==0 && currentPhoto==slide.length-1))
			{
				slideTimePassed = 0;
			}
			else
			{
				//stopAutoPlay();
				//log.append("stopAutoPlay");
			}

			if (index < 0)
			{
				index = slide.length - 1;
			}
			else if (index > slide.length - 1)
			{
				index = 0;
			}

			if (options.transition == 'slide')
			{
				var slidesx = slidesouter.width() * index * -1;
				slides.animate({"margin-left":slidesx}, "slow");
			}
			else//fade
			{
				var currentslide, nextslide;
				for (var i=0;i<slide.length ;i++ )
				{
					if (i == currentPhoto)
					{
						currentslide = jQuery(slide[i]);
					}
					else if (i == index)
					{
						nextslide = jQuery(slide[i]);
					}
					else
					{
						jQuery(slide[i]).css("z-index", CURRENT_Z_INDEX-2);
					}
				}

				currentslide.css("z-index", CURRENT_Z_INDEX);
				nextslide.css("z-index", CURRENT_Z_INDEX-1);
				currentslide.css("position", "absolute");
				nextslide.css("position", "absolute");
				//nextslide.fadeTo(0.1, 0);

				currentslide.fadeTo("slow", 0);
				nextslide.fadeTo("slow", 1, function(){currentslide.css("z-index", CURRENT_Z_INDEX);nextslide.css("z-index", CURRENT_Z_INDEX-1);});
			}

			currentPhoto = index;
			setActiveMarker(index);

			postMove();
		}

		function postMove()
		{
			var deschtml = jQuery(slide[currentPhoto]).data("desc");
			var link = jQuery(slide[currentPhoto]).data("link");
			if (link)
			{
				deschtml += "<a href='"+link+"' class='readmore'>"+options.moretext+"</a>";
			}

			desc.html(deschtml);
			var x = currentPhoto+1;
			/*if (slide.length >= 10 && x < 10)
			{
				x = "0" + x;
			}*/
			me.find(".xofy .x").html(x);
			me.find(".xofy .y").html(slide.length);
		}

		postMove();

		function setActiveMarker(index)
		{
			marker.removeClass("active");
			var time = jQuery(slide[index]).data("timelabel");
			for (var i=0;i<marker.length ;i++ )
			{
				var totime = jQuery(marker[i]).data("timelabel");
				if (time == totime)
				{
					jQuery(marker[i]).addClass("active");

					var newx = jQuery(marker[i]).css("left");
					draggable.stop().animate({"left": newx}, "fast");
					//draggable.css("left", newx);
					return;
				}
			}
		}

		//handle slides
		slide.css("width", slidesouter.width());
		slides.css("width", slide.length * slidesouter.width());
		var bestHeight = slidesouter.height();

		for (var i=0;i<slide.length ;i++ )
		{
			//vertical center
			var slidei = jQuery(slide[i]);
			var slideheight;
			if (slidei.find("img").length > 0)
			{
				slideheight = slidei.height();
			}
			else
			{
				slidei.css("height", "100%");
				return;
			}
			
			var offset = (bestHeight-slideheight) / 2;
			slidei.css("margin-top", offset);
		}

		slide.find("img").load(function(){
			var slidei = jQuery(this).parent();
			var offset = (bestHeight-slidei.height()) / 2;
			slidei.css("margin-top", offset);
		});

		//handle auto play
		var slideTimePassed=0;
		var autoPlayHandler;
		var prev = me.find(".previtem");
		var next = me.find(".nextitem");
		var prevnext = prev.parent();
		if (options.quicknav == "onhover")
		{
			prevnext.hide();
			slidesouter.hover(function(){
				prevnext.show();
			}, function(){
				prevnext.hide();
			});
		}
		else if (options.quicknav == "no")
		{
			prevnext.hide();
		}

		prev.bind("click touchend", function(){
			moveToSlide(currentPhoto - 1);
		});

		next.bind("click touchend", function(){
			moveToSlide(currentPhoto + 1);
		});

		if (options.autoplay)
		{
			autoPlay();
		}

		function autoPlay()
		{
			if (autoPlayHandler > 0)
			{
				stopAutoPlay();
			}
			else
			{
				autoPlayHandler = window.setInterval(instanceName + ".onInterval()", 1000);
			}
		}

		function stopAutoPlay()
		{
			if (autoPlayHandler < 0) return;
			
			window.clearInterval(autoPlayHandler);
			autoPlayHandler = -1;
			slideTimePassed = 0;
		}

		this.onInterval = function()
		{
			if (onhover)
			{
				return;
			}

			slideTimePassed += 1;

			if (slideTimePassed >= options.pauseTime)
			{
				slideTimePassed = 0;

				if (currentPhoto < slide.length - 1)
				{
					moveToSlide(currentPhoto + 1);
				}
				else
				{
					//reached last item
					moveToSlide(0);
				}
			}
		}

		//handle touch events of slides
		if (options.transition == 'slide')
		{
			var slidedragstate = 0;
			var slidedragstart = 0;
			var slidesx;
			if (document.addEventListener)
			{
				slidesouter.get(0).addEventListener('touchstart', function(e) {
					e.preventDefault();
					if (slidedragstate == 1)
					{
						return;
					}
					slidedragstate = 1;
				});

				slidesouter.get(0).addEventListener('touchmove', function(e) {
					e.preventDefault();
					if (slidedragstate == 1)
					{
						slidedragstate = 2;
						slidedragstart = e.touches[0].pageX;
						slidesx = parseInt(slides.css("margin-left"));
					}

					if (slidedragstate == 2)
					{
						var newx = slidesx + e.touches[0].pageX - slidedragstart;
						slides.css("margin-left", newx+"px");
					}
				});

				slidesouter.get(0).addEventListener('touchend', function(e) {
					e.preventDefault();
					if (slidedragstate == 2)
					{
						slidedragstate = 0;

						var min = (slide.length-1) * slidesouter.width() * -1;

						var newx = parseInt(slides.css("margin-left"));
						if (newx > 0)
						{
							slides.stop().animate({"margin-left": 0}, "fast");
							return;
						}
						else if (newx < min)
						{
							slides.stop().animate({"margin-left": min}, "fast");
							return;
						}

						if (Math.abs(newx-slidesx) / (slidesouter.width() > .25))
						{
							if (newx > slidesx)
							{
								moveToSlide(currentPhoto - 1);
							}
							else
							{
								moveToSlide(currentPhoto + 1);
							}
						}
						else
						{
							slides.stop().animate({"margin-left": slidesx}, "fast");
						}
					}
				});
			}
		}

	
	
	});

};
})(jQuery);


