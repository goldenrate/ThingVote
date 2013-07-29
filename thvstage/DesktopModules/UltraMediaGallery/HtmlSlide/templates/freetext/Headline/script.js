	slide[MODULEID].buildThumbList = function()
	{
		for (var i=0;i<this.umg_titles.length ;i++ )
		{
			this.umg_thumbs.append("<a href='javascript:"+this.umg_instancename+"[MODULEID].navigateTo("+i+")' class='umg_page' id='page[MODULEID]_"+i+"'>"+(i+1)+"</a>");
		}

	}

	slide[MODULEID].onMoveTo = function(index)
	{
		if (this.umg_index >= 0)
		{
			jQuery(this.umg_thumbs.find("#page[MODULEID]_" + this.umg_index)).removeClass("active");
		}
		jQuery(this.umg_thumbs.find("#page[MODULEID]_" + index)).addClass("active");

		if (this.umg_more.css("display")!="none")
		{
			this.umg_more.html("");
		}
	}