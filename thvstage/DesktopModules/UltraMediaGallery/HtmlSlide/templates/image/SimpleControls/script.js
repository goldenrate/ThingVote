	slide[MODULEID].onMoveTo = function(index)
	{
		if (this.umg_more.css("display")!="none")
		{
			this.umg_more.html("");
		}
	}

	slide[MODULEID].umg_container.bind("mouseenter", function()
		{
			if (!slide[MODULEID].umg_buttons.attr("originalY"))
			{
				return;
			}
			slide[MODULEID].umg_buttons.animate({top:slide[MODULEID].umg_buttons.attr("originalY")},"fast");
			slide[MODULEID].umg_caption.animate({top:slide[MODULEID].umg_caption.attr("originalY")},"fast");
			slide[MODULEID].umg_xofy.animate({top:slide[MODULEID].umg_xofy.attr("originalY")},"fast");
		}
	);

	slide[MODULEID].umg_container.bind("mouseleave", function()
		{
			if (!slide[MODULEID].umg_buttons.attr("originalY"))
			{
				slide[MODULEID].umg_buttons.attr("originalY", slide[MODULEID].umg_buttons.position().top);
				slide[MODULEID].umg_caption.attr("originalY", slide[MODULEID].umg_caption.position().top);
				slide[MODULEID].umg_xofy.attr("originalY", slide[MODULEID].umg_xofy.position().top);
			}

			slide[MODULEID].umg_buttons.animate({top:slide[MODULEID].umg_container.height()},"fast");
			slide[MODULEID].umg_caption.animate({top:0-slide[MODULEID].umg_caption.height()},"fast");
			slide[MODULEID].umg_xofy.animate({top:slide[MODULEID].umg_container.height()},"fast");
		}
	);