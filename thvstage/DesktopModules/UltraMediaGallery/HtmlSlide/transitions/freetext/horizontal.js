	slide[MODULEID].umg_transition_freetext_align = function(objSlide)
	{
		var maxWidth = this.umg_large.width();
		objSlide.css("margin-left", maxWidth * objSlide.attr("index"));
		objSlide.css("position", "absolute");
		objSlide.css("display", "block");
	}

	slide[MODULEID].umg_transition_freetext_activate = function(objCurrent, objPrevious)
	{
		var offset = objCurrent.attr("index") * this.umg_large.width() *-1;
		this.umg_large.animate({"margin-left":offset}, "slow");
	}