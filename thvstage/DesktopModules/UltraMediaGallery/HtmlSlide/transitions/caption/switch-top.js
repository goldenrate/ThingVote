	slide[MODULEID].umg_transition_caption_do = function(index)
	{
		if (!this.captionHeight)
		{
			this.captionHeight = this.umg_caption.height() + this.umg_caption.css("padding-top").replace("px", "")*1+this.umg_caption.css("padding-bottom").replace("px", "")*1;
			this.captionTop = this.umg_caption.position().top;
			this.captionTopNew = this.captionTop - this.captionHeight;
		}

		var caller = this;
		this.umg_caption.animate({height:0, top:caller.captionTopNew},"fast", function(){
			caller.updateCaption(index);
			caller.umg_caption.animate({height:caller.captionHeight, top:caller.captionTop},"fast");
		});

	}