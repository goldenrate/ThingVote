	slide[MODULEID].buildThumbList = function()
	{
		for (var i=0;i<this.umg_images.length ;i++ )
		{
			var item = "";
			if (this.umg_mouseoverbehavior == "moveto")
			{
				item = "<a href='javascript:void(0);' onmouseover='slide[MODULEID].navigateTo("+i+")'  class='umg_page' id='page[MODULEID]_"+i+"'><img border='0' src='"+jQuery(this.umg_images[i]).attr("alt")+"' height='30' alt='' /></" + "a>";
			}
			else if (this.umg_mouseoverbehavior == "scroll")
			{
				item = "<a href='javascript:slide[MODULEID].navigateTo("+i+")' onmouseover='slide[MODULEID].hoverTo("+i+")' class='umg_page' id='page[MODULEID]_"+i+"'><img border='0' src='"+jQuery(this.umg_images[i]).attr("alt")+"' height='30' alt='' /></" + "a>";
			}
			else //default, do nothing
			{
				item = "<a href='javascript:slide[MODULEID].navigateTo("+i+")' class='umg_page' id='page[MODULEID]_"+i+"'><img border='0' src='"+jQuery(this.umg_images[i]).attr("alt")+"' height='30' alt='' /></" + "a>";
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

		this.ensureVisibility(index, this.umg_index, "fast");
	}

	slide[MODULEID].ensureVisibility = function(index, compareToIndex, speed)
	{
		if(this.umg_thumbs.height() <= this.umg_thumbslist.height()) return;

		var currentThumb = jQuery(this.umg_thumbs.find("#page[MODULEID]_" + index));

		if (index > compareToIndex)
		{
			//scroll down
			var yOffset = currentThumb.position().top+currentThumb.height()+this.umg_thumbs.position().top;
			if (yOffset > this.umg_thumbslist.height() * .5)
			{
				var scrollTo = currentThumb.position().top*-1 + 42;
				if (scrollTo + this.umg_thumbs.height() < this.umg_thumbslist.height())
				{
					scrollTo = this.umg_thumbslist.height() - this.umg_thumbs.height();
				}
				this.umg_thumbs.animate({"top":scrollTo},"fast");
			}
		}
		else
		{
			//to left
			var yOffset = currentThumb.position().top+this.umg_thumbs.position().top;
			if (yOffset < this.umg_thumbslist.height() * .5)
			{
				var scrollTo = currentThumb.position().top*-1 + 42;
				if (scrollTo > 0)
				{
					scrollTo = 0;
				}
				this.umg_thumbs.animate({"top":scrollTo},"fast");
			}
		}
	}