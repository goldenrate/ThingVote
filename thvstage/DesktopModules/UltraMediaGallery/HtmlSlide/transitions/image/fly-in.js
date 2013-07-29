
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
			objCurrent.originalLeft = objCurrent.css("margin-left");
			objCurrent.originalTop = objCurrent.css("margin-top");
		}
		objCurrent.css("margin-left", 0-objCurrent.width());
		objCurrent.css("margin-top", 0-objCurrent.height());
		objCurrent.css("display", "block");
		objCurrent.css("z-index", slide[MODULEID].imagezindex++);
		objCurrent.animate({"margin-left":objCurrent.originalLeft, "margin-top":objCurrent.originalTop}, "slow", function()
		{
			if (objPrevious)
				objPrevious.css("display", "none");
		});
	}
