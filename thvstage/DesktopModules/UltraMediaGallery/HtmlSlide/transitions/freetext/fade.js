	slide[MODULEID].umg_transition_freetext_align = function(objSlide)
	{
		objSlide.css("position", "absolute");
		objSlide.css("opacity", 0);
	}

	slide[MODULEID].umg_transition_freetext_activate = function(objCurrent, objPrevious)
	{
		if (objPrevious)
			objPrevious.fadeTo("slow", 0, function(){objPrevious.hide();});
		objCurrent.fadeTo("slow", 1);
	}
