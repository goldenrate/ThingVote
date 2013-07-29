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

			if (this.umg_thumbs.width() < this.umg_container.width())
			{
				var diff = this.umg_container.width() - this.umg_thumbs.width();
				var suffix = "<div class='umg_page_last' style='width:"+diff+"px;float:left;'>&nbsp;</div>";
				this.umg_thumbs.append(suffix);
			}
	}

	slide[MODULEID].previousHover = -1;

	slide[MODULEID].hoverTo = function(index)
	{
		this.ensureVisibility(index, this.previousHover, 2000);
		slide[MODULEID].previousHover = index;
	}

	slide[MODULEID].onMoveTo = function(index)
	{
		if (this.umg_index >= 0)
		{
			var previousThumb = jQuery(this.umg_thumbs.find("#page[MODULEID]_" + this.umg_index));
			previousThumb.removeClass("active");
			//previousThumb.css("background-position", "0px -120px");
		}
		var currentThumb = jQuery(this.umg_thumbs.find("#page[MODULEID]_" + index));
		currentThumb.addClass("active");

		this.ensureVisibility(index, this.umg_index, "fast");
	}

	slide[MODULEID].ensureVisibility = function(index, compareToIndex, speed)
	{
		if(this.umg_thumbs.width() <= this.umg_container.width()) return;

		var currentThumb = jQuery(this.umg_thumbs.find("#page[MODULEID]_" + index));

		var itemWidth = 154;

		if (index > compareToIndex)
		{
			//scroll right
			var xOffset = currentThumb.position().left+currentThumb.width()+this.umg_thumbs.position().left;
			if (xOffset > this.umg_container.width() * .67)
			{
				var scrollTo = (currentThumb.width() / 2 + currentThumb.position().left)*-1 + this.umg_container.width() * .5;
				if (scrollTo % itemWidth != 0)
				{
					scrollTo -= scrollTo % itemWidth + itemWidth;
				}
				if (scrollTo + this.umg_thumbs.width() < this.umg_container.width())
				{
					scrollTo = this.umg_container.width() - this.umg_thumbs.width();
				}
				slide[MODULEID].umg_thumbs.animate({"left":scrollTo},"fast");
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
				if (scrollTo % itemWidth != 0)
				{
					scrollTo -= scrollTo % itemWidth;
				}
				if(scrollTo+this.umg_thumbs.width() < this.umg_container.width())
				{
					scrollTo = this.umg_container.width() - this.umg_thumbs.width();
				}
				slide[MODULEID].umg_thumbs.animate({"left":scrollTo},"fast");
				return;
			}
		}
	}