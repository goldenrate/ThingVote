	slide[MODULEID].umg_transition_freetext_align = function(objSlide)
	{
		var maxHeight = this.umg_large.height();
		objSlide.css("margin-top", maxHeight * objSlide.attr("index"));
		objSlide.css("position", "absolute");
		objSlide.css("display", "block");
	}

	slide[MODULEID].umg_transition_freetext_activate = function(objCurrent, objPrevious)
	{
		var offset = objCurrent.attr("index") * this.umg_large.height() *-1;
		this.umg_large.animate({"margin-top":offset}, "slow");
	}
