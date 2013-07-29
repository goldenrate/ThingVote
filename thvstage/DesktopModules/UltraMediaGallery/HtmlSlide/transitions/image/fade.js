	slide[MODULEID].umg_transition_image_align = function(objImage, objImgTag)
	{
		var position = this.getSuggestedPosition(objImgTag);
		objImgTag.css("margin-left", position.suggestedX);
		objImgTag.css("margin-top", position.suggestedY);


		objImgTag.css("opacity", 0);
		objImgTag.attr("src", objImage.src);
	}

	slide[MODULEID].umg_transition_image_activate = function(objCurrent, objPrevious)
	{
		if (objPrevious.length > 0)
			objPrevious.fadeTo("slow", 0);
		objCurrent.fadeTo("slow", 1);
	}
