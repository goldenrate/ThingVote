	slide[MODULEID].buildThumbList = function()
	{
		for (var i=0;i<this.umg_titles.length ;i++ )
		{
			var item = "";
			if (this.umg_mouseoverbehavior == "moveto")
			{
				item = "<a href='javascript:void(0);' onmouseover='slide[MODULEID].navigateTo("+i+")'  class='umg_page' id='page[MODULEID]_"+i+"'>"+jQuery(this.umg_titles[i]).html()+"</" + "a>";
			}
			else if (this.umg_mouseoverbehavior == "scroll")
			{
				item = "<a href='javascript:slide[MODULEID].navigateTo("+i+")' onmouseover='slide[MODULEID].hoverTo("+i+")' class='umg_page' id='page[MODULEID]_"+i+"'>"+jQuery(this.umg_titles[i]).html()+"</" + "a>";
			}
			else //default, do nothing
			{
				item = "<a href='javascript:slide[MODULEID].navigateTo("+i+")' class='umg_page' id='page[MODULEID]_"+i+"'>"+jQuery(this.umg_titles[i]).html()+"</" + "a>";
			}

			this.umg_thumbs.append(item);
		}
	}

	slide[MODULEID].previousHover = -1;

	slide[MODULEID].hoverTo = function(index)
	{
		this.ensureVisibility(index, this.previousHover, 2000, false);
		slide[MODULEID].previousHover = index;
	}

	slide[MODULEID].onMoveTo = function(index)
	{
		if (this.umg_index >= 0)
		{
			var previousThumb = jQuery(this.umg_thumbs.find("#page[MODULEID]_" + this.umg_index));
			previousThumb.removeClass("active");
			previousThumb.css("background-position", "0px -120px");
		}
		var currentThumb = jQuery(this.umg_thumbs.find("#page[MODULEID]_" + index));
		currentThumb.addClass("active");

		this.ensureVisibility(index, this.umg_index, "fast", true);
	}

	slide[MODULEID].ensureVisibility = function(index, compareToIndex, speed, ensureTitleBg)
	{
		if(this.umg_thumbs.width() <= this.umg_container.width()) 
		{
			slide[MODULEID].ensureTitleBgPosition(index);
			return;
		}

		var currentThumb = jQuery(this.umg_thumbs.find("#page[MODULEID]_" + index));

		if (index > compareToIndex)
		{
			//scroll right
			var xOffset = currentThumb.position().left+currentThumb.width()+this.umg_thumbs.position().left;
			if (xOffset > this.umg_container.width() * .67)
			{
				var scrollTo = (currentThumb.width() / 2 + currentThumb.position().left)*-1 + this.umg_container.width() * .5;
				if (scrollTo + this.umg_thumbs.width() < this.umg_container.width())
				{
					scrollTo = this.umg_container.width() - this.umg_thumbs.width();
				}
				if (ensureTitleBg)
				{
					this.umg_thumbs.animate({"left":scrollTo},"fast", function(){
						slide[MODULEID].ensureTitleBgPositionEx(index, index);
					});
				}
				else
				{
					slide[MODULEID].umg_thumbs.animate({"left":scrollTo},"fast");
				}
				return;
			}
		}
		else
		{
			//to left
			var xOffset = currentThumb.position().left+this.umg_thumbs.position().left;
			if (xOffset < this.umg_container.width() * .33)
			{
				var scrollTo = (currentThumb.width() / 2 + currentThumb.position().left)*-1 + this.umg_container.width() * .5;
				if (scrollTo > 0)
				{
					scrollTo = 0;
				}
				if(scrollTo+this.umg_thumbs.width() < this.umg_container.width())
				{
					scrollTo = this.umg_container.width() - this.umg_thumbs.width();
				}
				if (ensureTitleBg)
				{
					this.umg_thumbs.animate({"left":scrollTo},"fast", function(){
						slide[MODULEID].ensureTitleBgPositionEx(index, index);
					});
				}
				else
				{
					slide[MODULEID].umg_thumbs.animate({"left":scrollTo},"fast");
				}
				return;
			}
		}
		if (ensureTitleBg)
		{
			this.ensureTitleBgPosition(index);
		}
	}

	slide[MODULEID].ensureTitleBgPositionEx = function(index, finishIndex)
	{
		if (finishIndex >= 0)
		{
			if (finishIndex != this.umg_index)
			{
				return;
			}
		}
		var currentThumb = jQuery(this.umg_thumbs.find("#page[MODULEID]_" + index));
		var currentThumbWidth = currentThumb.width() + currentThumb.css("padding-left").replace("px", "") * 1 + currentThumb.css("padding-right").replace("px", "") * 1;
		var xOffset;
		var yRatio = (currentThumb.position().left + currentThumbWidth / 2 + this.umg_thumbs.position().left) / this.umg_container.width();
		var yOffset;
		if (yRatio < 1/3)
		{
			xOffset = currentThumbWidth-500-10;
			yOffset = 0;
		}
		else if (yRatio < 2/3)
		{
			xOffset = currentThumbWidth/2-500+15;
			yOffset = -180;
		}
		else
		{
			yOffset = -240;
			xOffset = -500+40;
		}
		currentThumb.css("background-position", xOffset+"px "+yOffset+"px");
	}

	slide[MODULEID].ensureTitleBgPosition = function(index)
	{
		slide[MODULEID].ensureTitleBgPositionEx(index, -1);
	}
