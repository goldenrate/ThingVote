/*
 * SpotlightSlider Script for Ultra Media Gallery 8.1+
 * By Pengcheng Rong (rongers@hotmail.com, service@bizmodules.net)
 * Copyright (c) 2011 Pengcheng Rong
 * All rights reserved, do not use this script library out of Ultra Media Gallery expect directly licensed by the copyright owner.
*/


(function(jQuery){
 jQuery.fn.spotlight = function(options) {
    
  var defaults = {
	loopPlay:true, 

	background:"",
	autoStart:true, 
	navigation:true, 
	openLinkInNewWindow:false,
	itemsPerPage:3,
	playSpeed:5000
  };
  
  var options = jQuery.extend(defaults, options);
    
	return this.each(function() {

		var gallery = jQuery(this);
		var instanceName = gallery.attr("ID");

		//create necessary html documents to host images, albums, and buttons.
		gallery.append("<div class='SLSlistnav'></div>");

		//Identifying html elements to jquery objects.
		var spotlightbody = gallery.find(".SLSbody");
		spotlightbody.append("<div class='SLSleft'></div><div class='SLSright'></div>");
		var spotlightlist = gallery.find(".SLSlist");
		var spotlightlistinner = gallery.find(".SLSlistinner");
		var items = gallery.find(".SLSlistinner .SLSitem");

		var spotlightleft = gallery.find(".SLSleft");
		var spotlightright = gallery.find(".SLSright");
		var spotlightlistnav = gallery.find(".SLSlistnav");

		var currentPage = 0;
		var autoPlayHandler;
		//a reference to my self
		var _this = this;

		if (options.background)
		{
			gallery.css("background-color", options.background);
			gallery.css("background-image", "none");
		}
		if (options.openLinkInNewWindow)
		{
			gallery.find(".SLSlink").attr("target", "_blank");
		}

		gallery.css("width", spotlightbody.width());

		items.mouseover(function(){
			var item = jQuery(this).find(".SLStext");
			var itemdesc = item.find(".SLSdesc");
			item.find(".SLSlink").show();
			if(itemdesc.html() == "")
			{
				//empty description
				return;
			}

			item.stop();
			item.animate({"bottom":0}, "fast");
		});
		items.mouseout(function(){
			var item = jQuery(this).find(".SLStext");
			var itemdesc = item.find(".SLSdesc");
			item.find(".SLSlink").hide();
			if(itemdesc.html() == "")
			{
				//empty description
				return;
			}

			var descheight = itemdesc.css("margin-bottom").replace("px", "") * 1 + itemdesc.height();
			item.stop();
			item.animate({"bottom":descheight * -1}, "fast");
		});

		var spotlightlistwidth = spotlightlist.width();
		var itemWidth = Math.round(spotlightlistwidth / options.itemsPerPage);
		items.css("width", itemWidth);

		items.each(function(){
			var item = jQuery(this);
			var itemtext = item.find(".SLStext");
			var itemdesc = item.find(".SLSdesc");
			if(itemdesc.html() == "")
			{
				itemdesc.hide();
				return;
			}

			var descheight = itemdesc.css("margin-bottom").replace("px", "") * 1 + itemdesc.height();
			itemtext.css("bottom", descheight * -1);

		});

		var pages = Math.ceil(items.length / options.itemsPerPage);
		for (var i=0;i<pages ;i++ )
		{
			spotlightlistnav.append("<a href='javascript:void(0);' rel='"+i+"'></a>");

			if (i == pages-1)
			{
				var lastitem = spotlightlistnav.children("a").last();
				var navwidth = lastitem.width() + lastitem.position().left;
				spotlightlistnav.css("margin-left", (spotlightlistnav.parent().width() - navwidth) / 2);
				//spotlightlistnav.css("width", navwidth);
			}
		}

		if (!options.navigation)
		{
			spotlightlistnav.hide();
		}

		spotlightlistnavitems = spotlightlistnav.children("a");

		spotlightlistnavitems.click(function(){
			_this.gotoPage(jQuery(this).attr("rel"));

			_this.stopAutoPlay();
		});

		spotlightleft.click(function(){
			_this.gotoPage(currentPage - 1);

			_this.stopAutoPlay();
		});
		spotlightright.click(function(){
			_this.gotoPage(currentPage + 1);

			_this.stopAutoPlay();
		});

		if (options.autoStart)
		{
			autoPlayHandler = window.setInterval(instanceName + ".onInterval()", options.playSpeed);
		}

		this.onInterval = function()
		{
			_this.gotoPage(currentPage +1);
		}

		this.stopAutoPlay = function()
		{
			window.clearInterval(autoPlayHandler);
		}

		this.gotoPage = function(pageIndex)
		{
			if (pageIndex < 0)
			{
				return;
			}
			else if (pageIndex >= spotlightlistnavitems.length)
			{
				pageIndex = 0;
				//return;
			}

			var scrollTo = spotlightlistwidth * pageIndex * -1;
			spotlightlistinner.animate({"margin-left":scrollTo}, "slow");
			currentPage = pageIndex;
			_this.afterPaging();
		}

		this.afterPaging = function()
		{
			spotlightlistnavitems.removeClass("active");
			jQuery(spotlightlistnavitems[currentPage]).addClass("active");

			if (currentPage == 0)
			{
				spotlightleft.hide();
			}
			else
			{
				spotlightleft.show();
			}

			if (currentPage >= spotlightlistnavitems.length -1)
			{
				spotlightright.hide();
			}
			else
			{
				spotlightright.show();
			}
		}

		_this.afterPaging();

		return;

  });
 };
})(jQuery);

