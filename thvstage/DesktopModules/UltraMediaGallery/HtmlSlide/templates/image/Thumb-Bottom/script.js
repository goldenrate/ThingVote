	slide[MODULEID].buildThumbList = function()
	{
		for (var i=0;i<this.umg_images.length ;i++ )
		{
			var item = "";
			if (this.umg_mouseoverbehavior == "moveto")
			{
				item = "<a href='javascript:void(0);' onmouseover='slide[MODULEID].navigateTo("+i+")'  class='umg_page' id='page[MODULEID]_"+i+"'><img border='0' src='"+jQuery(this.umg_images[i]).attr("alt")+"' alt='' /></" + "a>";
			}
			else if (this.umg_mouseoverbehavior == "scroll")
			{
				item = "<a href='javascript:slide[MODULEID].navigateTo("+i+")' onmouseover='slide[MODULEID].hoverTo("+i+")' class='umg_page' id='page[MODULEID]_"+i+"'><img border='0' src='"+jQuery(this.umg_images[i]).attr("alt")+"' alt='' /></" + "a>";
			}
			else //default, do nothing
			{
				item = "<a href='javascript:slide[MODULEID].navigateTo("+i+")' class='umg_page' id='page[MODULEID]_"+i+"'><img border='0' src='"+jQuery(this.umg_images[i]).attr("alt")+"' alt='' /></" + "a>";
			}

			this.umg_thumbs.append(item);
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
			jQuery(this.umg_thumbs.find("#page[MODULEID]_" + this.umg_index)).removeClass("active");
		}
		var currentThumb = jQuery(this.umg_thumbs.find("#page[MODULEID]_" + index));
		currentThumb.addClass("active");

		if (this.umg_more.css("display")!="none")
		{
			this.umg_more.html("");
		}

		this.ensureVisibility(index, this.umg_index, "fast");
	}

	slide[MODULEID].ensureVisibility = function(index, compareToIndex, speed)
	{
		if(this.umg_thumbs.width() <= this.umg_large.width()) return;

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
				this.umg_thumbs.animate({"left":scrollTo},"fast");
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
				this.umg_thumbs.animate({"left":scrollTo},"fast");
			}
		}
	}