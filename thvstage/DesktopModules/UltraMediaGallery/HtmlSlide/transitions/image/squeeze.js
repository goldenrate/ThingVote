
	slide[MODULEID].imagezindex = 1;
	
	slide[MODULEID].umg_transition_image_align = function(objImage, objImgTag)
	{
		var position = this.getSuggestedPosition(objImgTag);
		objImgTag.css("margin-left", position.suggestedX);
		objImgTag.css("margin-top", position.suggestedY);


		objImgTag.css("display", "none");
		objImgTag.attr("src", objImage.src);
	}

	slide[MODULEID].umg_transition_image_activate = function(objCurrent, objPrevious)
	{
		if (!objCurrent.originalLeft)
		{
			objCurrent.originalTop = objCurrent.css("margin-top").replace("px", "") * 1;
			objCurrent.originalHeight = objCurrent.height();
		}
		objCurrent.css("margin-top", objCurrent.originalTop + objCurrent.originalHeight / 2);
		objCurrent.css("height", 0);
		objCurrent.css("display", "block");
		objCurrent.css("z-index", slide[MODULEID].imagezindex++);
		objCurrent.animate({"margin-top":objCurrent.originalTop, "height":objCurrent.originalHeight}, "slow", function()
		{
			if (objPrevious)
				objPrevious.css("display", "none");
		});
	}
