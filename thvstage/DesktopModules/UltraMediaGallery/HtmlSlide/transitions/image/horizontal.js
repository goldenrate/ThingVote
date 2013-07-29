	slide[MODULEID].umg_transition_image_align = function(objImage, objImgTag)
	{
		var maxWidth = this.umg_large.width();
		var position = this.getSuggestedPosition(objImgTag);
		objImgTag.css("margin-left", position.suggestedX + (maxWidth * objImgTag.attr("index")));
		objImgTag.css("margin-top", position.suggestedY);

		objImgTag.attr("src", objImage.src);
		objImgTag.css("display", "block");
	}

	slide[MODULEID].umg_transition_image_activate = function(objCurrent, objPrevious)
	{
		var offset = objCurrent.attr("index") * this.umg_large.width() *-1;
		this.umg_large.stop();
		this.umg_large.animate({"margin-left":offset}, "slow");
	}
