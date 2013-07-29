/**
 * Portfolio setter- parses the portfolio item data from a XML file, displays the items separated
 * by pages and adds a category filter functionality.
 * @author Pexeto
 * http://pexeto.com 
 */


(function($){
	$.fn.portfolioSetter=function(options){
		var defaults={
			//default settings
			itemsPerPage: 12, //the number of items per page
			pageWidth: 960,  //the width of each page
			pageHeight:430,  //the height of each page
			itemMargin:30,  //margin of each of the portfolio items
			showCategories: true,  // if set to false, the categories will be hidden
			allText: 'ALL', //the ALL text displayed before the categories names
			easing: 'easeOutExpo', //the animation easing
			animationSpeed: 800, //the speed of the animation of the pagination
			navButtonWidth:21,  //the width of the pagination button 
			wavyAnimation:false, //if set the true, all the elements will fade in consecutively with a wavy effect
			xmlSource : 'portfolio.xml',  //the XML file from which the data is exctracted
			pageWrapperClass: 'page_wrapper',  //the class of the div that wraps the items in order to set a page
			navigationId: 'portfolio_pagination',  //the ID of the pagination div
			categoriesId: 'portfolio_categories', //the ID of the categories div
			itemClass: 'portfolio_item' //the class of the div that wraps each portfolio item data
			//my customization
			,socialTools:true ,prettyPhotoTheme:'pp_default' ,prettyPhotoWmode:'window' ,audioWidth:500, audioHeight:200, videoWidth:600, videoHeight:400
			,defaultAlbum:-1
		};
		
		var options=$.extend(defaults, options);
		options.pageHolder=$(this);
		
		//define some helper variables
		var categories=[], items=[], pageWrappers=[], imagesLoaded=0, counter=0, ie=false, categoryHolder;
		
		var root=$('<div />').css({width:(options.pageWidth*2), height:options.pageHeight, float:'left'});
		$(this).css({width:options.pageWidth, height:'auto', overflow:'hidden'}).append(root);
		var parentId=$(this).attr('id');

		
	init();
	function init() {
		root.parent().append('<div class="loading"></div>');
		loadItems();
	}
	
	/**
	 * Parses the XML portfolio item data.
	 */
	function loadItems(){
		$.ajax({
			type:'GET',
			url: options.xmlSource,
			dataType:'xml',
			success:function(xml){
			
				//get the settings
				if($(xml).find('show_categories:first').text()==='off'){
					options.showCategories=false;
				}				
			
				if(options.showCategories){
					//get the portfolio categories
					$(xml).find('categories').eq(0).find('category').each(function(i){
						var current=$(this);
						var category = {
							id:	current.attr('id'),
							name: current.text()
						};
						categories.push(category);
					});
				}
				
				//my customization
				var mediaIndex = 0;
				var mediaContainer = options.pageHolder.find(".mediaContainer");
				if (mediaContainer.length == 0)
				{
					mediaContainer = $("<div class='mediaContainer' style='display:none;'></div>");
					options.pageHolder.append(mediaContainer);
				}

				//get the portfolio items
				$(xml).find('item').each(function(i){
					var current=$(this);
					var thum=current.find('thumbnail:first').text();
					var prev = current.find('preview:first').text();
					var cat=current.find('category:first').text().split(',');
					var desc = current.find('description:first').text();

					//my customization
					//handle link target(prev)
					var useHtml5 = false;
					if((navigator.userAgent.match(/iPhone/i)) 
						|| (navigator.userAgent.match(/iPod/i)) 
							|| (navigator.userAgent.match(/iPad/i)))
						useHtml5 = true;

					var extension = prev.toLowerCase().substring(prev.length - 4, prev.length).trim();
					if (extension == "")
					{
						mediaHtml = current.find('htmlcontent:first').text();;
						mediaContainer.append("<div id='mediaItem-"+mediaIndex+"'>" + mediaHtml + "</div>");
						prev = "#mediaItem-"+mediaIndex++;
					}
					if (extension == ".mp4" || extension == ".flv")
					{
						//is a video
						var mediaHtml = "";
						if (useHtml5)
						{
							mediaHtml = "<video src='" + prev + "' type='video/mp4' width='100%' height='100%' autoplay='true' controls='controls' />";
						}
						else
						{
							mediaHtml = "<object allowFullScreen='True' allowScriptAccess='always' wmode='"+ options.prettyPhotoWmode +"' width='100%' height='100%'><param name='movie' value='"+options.modulePath+"SimpleVideo.swf' /><param name='allowFullScreen' value='true' /><param name='wmode' value='"+ options.prettyPhotoWmode +"' /><param name='flashvars' value='video="+prev+"&showControlBar=True' /><embed src='"+options.modulePath+"SimpleVideo.swf' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' wmode='"+ options.prettyPhotoWmode +"' width='100%' height='100%' flashvars='video="+prev+"&showControlBar=True'></embed></object>"
						}

						mediaContainer.append("<div id='mediaItem-"+mediaIndex+"'><div style='width:"+options.videoWidth+"px; height:"+options.videoHeight+"px;'>" + mediaHtml + "</div></div>");
						prev = "#mediaItem-"+mediaIndex++;
					}
					else if (extension == ".mp3")
					{
						//is a audio
						var mediaHtml = "";
						if (useHtml5)
						{
							mediaHtml = "<audio src='" + prev + "' type='audio/mp3' width='100%' height='100%' autoplay='true' controls='controls' />";
						}
						else
						{
							mediaHtml = "<object allowFullScreen='True' allowScriptAccess='always' wmode='"+ options.prettyPhotoWmode +"' width='100%' height='100%'><param name='movie' value='"+options.modulePath+"SimpleAudio.swf' /><param name='allowFullScreen' value='true' /><param name='wmode' value='"+ options.prettyPhotoWmode +"' /><param name='flashvars' value='audio="+prev+"' /><embed src='"+options.modulePath+"SimpleAudio.swf' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' wmode='"+ options.prettyPhotoWmode +"' width='100%' height='100%' flashvars='audio="+prev+"'></embed></object>"
						}

						mediaContainer.append("<div id='mediaItem-"+mediaIndex+"'><div style='width:"+options.audioWidth+"px; height:"+options.audioHeight+"px;'>" + mediaHtml + "</div></div>");
						prev = "#mediaItem-"+mediaIndex++;
					}
					
					var item = {
						thumbnail:thum,
						preview:prev,
						category:cat,
						description:desc,
						obj:$('<div class="'+options.itemClass+'"><a rel="lightbox['+parentId+']" class="single_image" href="'+prev+'" title="'+desc+'"><img src="'+thum+'" /></a></div>')
					};
					items.push(item);
				});
			
				setSetter();
			}
		});
	}
	
	/**
	 * Calls the main functions for setting the portfolio items.
	 */
	function setSetter(){
		 
		if($.browser.msie){
			ie=true;
		}
		root.siblings('.loading').remove();
		root.after('<div id="'+options.navigationId+'"><ul></ul></div>');
		if(options.showCategories){
			displayCategories();
		}
		loadImages();
		
	}
	
	/**
	 * Displays the categories.
	 */
	function displayCategories(){
		
		categoryHolder=$('<div id="'+options.categoriesId+'"></div>');	
		categoryHolder.append('<div id="portfolio_categories_left"></div><ul></ul><div id="portfolio_categories_right"></div>');
		root.before(categoryHolder);
		var catUl=categoryHolder.find('ul');
		
		
		//add the ALL link
		var allLink= $('<li>'+options.allText+'</li>');
		catUl.append(allLink);
		showSelectedCat(allLink);
		
		//bind the click event
		allLink.bind({
			'click': function(){
				displayItems();
				showSelectedCat($(this));
			},
			'mouseover':function(){
				$(this).css({cursor:'pointer'});
			}
		});
		
		//add all the category names to the list
		var catNumber=categories.length;
		for(var i =0; i<catNumber; i++)(function(i){
			var category = $('<li data-itemid="'+categories[i].id+'">'+categories[i].name+'</li>');
			catUl.append(category);
			
			//bind the click event
			category.bind({
				'click': function(){
					displayItems(categories[i].id);
					showSelectedCat($(this));
				},
				'mouseover':function(){
					$(this).css({cursor:'pointer'});
				}
			});
		})(i);



		//my customization
		if (options.defaultAlbum >= 0)
		{
			var liAlbum = catUl.find("li[data-itemid="+options.defaultAlbum+"]");
			showSelectedCat(liAlbum);
		}
		else
		{
			showSelectedCat(allLink);
		}
	}
	
	function showSelectedCat(selected){
		//hide the previous selected element
		var prevSelected=categoryHolder.find('ul li.selected');
		if(prevSelected[0]){
			var prevHtml=prevSelected.find('div.port_cat').html();
			prevSelected.html(prevHtml);
			prevSelected.removeClass('selected');
		}
		
		//show the new selected element
		var html = selected.html();
		selected.html('<div class="port_cat_active"><div class="port_cat_l"></div><div class="port_cat">'+html+'</div><div class="port_cat_r"></div> </div>');
		selected.addClass('selected');
	}
	
	/**
	 * Loads the images. When all the images are loaded calls the displayItems 
	 * function to display the images.
	 */
	function loadImages(){
		var imageCount=items.length;
		for(var i in items){
			if(items.hasOwnProperty(i)){
			 var img = new Image();
				$(img).load(function() {
					imagesLoaded++;
					if(imagesLoaded===imageCount){
						//all the images are loaded, display them all
						displayItems();
					}
				}).attr('src', items[i].thumbnail);  
			}
		}
	}
	
	/**
	 * Displays the portfolio items.
	 */
	function displayItems(){
		
		var filterCat=arguments.length===0?false:true;
				
		//reset the divs and arrays

		root.html('');
		root.width(200);
		pageWrappers=[];
		root.animate({marginLeft:0});
		
		var length=items.length;	

		counter=0;
		var catId=arguments[0];
		for ( var i = 0; i < length; i++)
			(function(i, filterCat, catId) {
				
				if(!filterCat || (filterCat && items[i].category.contains(catId))){
					if(counter%options.itemsPerPage===0){
						//create a new page wrapper and make the holder wider
						root.width(root.width()+options.pageWidth+20);
						var wrapper=$('<div class="'+options.pageWrapperClass+'"></div>').css({float:'left', width:options.pageWidth+options.itemMargin, height:options.pageHeight});
						pageWrappers.push(wrapper);
						root.append(wrapper);
					}
					
					if(ie){
						var obj=$('<div class="'+options.itemClass+'" ><a rel="lightbox['+parentId+']" class="single_image" href="'+items[i].preview+'" title="'+items[i].description+'"><img src="'+items[i].thumbnail+'" /></a></div>');
						if (items[i].preview.substring(0,1) == "#")
						{
							obj.children("a").attr("href", items[i].preview);
						}
						pageWrappers[pageWrappers.length-1].append(obj.css({display:'none'}));
						items[i].obj=obj;
					}else{
						pageWrappers[pageWrappers.length-1].append(items[i].obj.css({display:'none'}));
					}

					var timeout=counter>=options.itemsPerPage?0:100;
					
					if(counter>=options.itemsPerPage || !options.wavyAnimation){
						items[i].obj.fadeIn().animate({opacity:1},0);
					}else{
						setTimeout(function() {
							//display the image by fading in
							items[i].obj.fadeIn().animate({opacity:1},0);
						},counter*100);
					}

					counter++;
				}
		})(i,filterCat, catId);
		
		//call the lightbox plugin
		//my customization
		//$('a[rel="lightbox['+parentId+']"]').prettyPhoto({theme:'dark_rounded', keyboard_shortcuts: false});
		if (options.socialTools)
		{
			$('a[rel="lightbox['+parentId+']"]').prettyPhoto({theme:options.prettyPhotoTheme, wmode:options.prettyPhotoWmode, keyboard_shortcuts: false, overlay_gallery:false, deeplinking:false});
		}
		else
		{
			$('a[rel="lightbox['+parentId+']"]').prettyPhoto({social_tools:'<div class="pp_social" style="display:none;"></div>', theme:options.prettyPhotoTheme, wmode:options.prettyPhotoWmode, keyboard_shortcuts: false, overlay_gallery:false, deeplinking:false});
		}
				
		//show the navigation buttons
		showNavigation();
		setHoverFunctionality();
				
	}
	
	
	/**
	 * Displays the navigation buttons.
	 */
	function showNavigation(){
		//reset the divs and arrays
		var navUl=root.siblings('#'+options.navigationId).find('ul');
		navUl.html('');
		
		var pageNumber=pageWrappers.length;
		if(pageNumber>1){
			for(var i=0; i<pageNumber; i++)(function(i){
				var li = $('<li></li>');
				navUl.append(li);
				//bind the click handler
				li.bind({
					'click': function(){
						var marginLeft=i*options.pageWidth+i*options.itemMargin-2;
						
						//set a bigger margin for IE6
						if ($.browser.msie && $.browser.version.substr(0,1)<7) {
							marginLeft+=i*options.itemMargin;
						}
						root.animate({marginLeft:[-marginLeft,options.easing]}, options.animationSpeed);
						
						navUl.find('li.selected').removeClass('selected');
						$(this).addClass('selected');
					},
					'mouseover':function(){
						$(this).css({cursor:'pointer'});
					}
				});
			})(i);
			
			navUl.find('li:first').addClass('selected');
			
			//center the navigation
			var marginLeft=(options.pageWidth)/2-pageNumber*options.navButtonWidth/2;
			navUl.css({marginLeft:marginLeft});
		}
	}
	
	function setHoverFunctionality(){
		$('.portfolio_item').hover(function(){
			$(this).stop().animate({opacity:0.8}, 300);
		}, function(){
			$(this).stop().animate({opacity:1}, 300);
		});
	}
	};
}(jQuery));


/**
 * Declare a function for the arrays that checks
 * whether an array contains a value.
 * @param value the value to search for
 * @return true if the array contains the value and false if the
 * array doesn't contain the value
 */
Array.prototype.contains=function(value){
	var length=this.length;
	for(var i=0; i<length; i++){
		if(this[i]===value){
			return true;
		}
	}
	return false;
};
