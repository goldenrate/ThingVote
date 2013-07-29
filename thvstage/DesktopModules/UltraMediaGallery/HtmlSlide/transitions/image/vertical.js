	slide[MODULEID].umg_transition_image_align = function(objImage, objImgTag)
	{
		var maxHeight = this.umg_large.height();
		var position = this.getSuggestedPosition(objImgTag);
		objImgTag.css("margin-left", position.suggestedX);
		objImgTag.css("margin-top", position.suggestedY + (maxHeight * objImgTag.attr("index")));
		//objImgTag.css("opacity", 0);
		objImgTag.attr("src", objImage.src);
		objImgTag.css("display", "block");
	}

	slide[MODULEID].umg_transition_image_activate = function(objCurrent, objPrevious)
	{
		var offset = objCurrent.attr("index") * this.umg_large.height() *-1;
		this.umg_large.stop();
		this.umg_large.animate({"margin-top":offset}, "slow");
	}
