	slide[MODULEID].umg_transition_caption_do = function(index)
	{
		if (this.umg_index >= 0)
		{
			this.umg_captiontext.css("position", "absolute");
			var umg_captiontext_duplicate = this.umg_captiontext.clone();
			umg_captiontext_duplicate.insertBefore(this.umg_captiontext);
			umg_captiontext_duplicate.fadeTo("slow", 0, function()
			{
				umg_captiontext_duplicate.remove();
			});
		}

		this.updateCaption(index);

		this.umg_captiontext.css("opacity",0);
		//umg_caption.fadeTo("slow", 1);
		this.umg_captiontext.animate({opacity:1},"slow");

	}