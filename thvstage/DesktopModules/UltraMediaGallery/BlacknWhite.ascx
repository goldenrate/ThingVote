<%@ Control Language="vb" AutoEventWireup="false" Codebehind="BlacknWhite.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.BlacknWhite" %>
    
<div style="border:14px solid #fff;">
<div class="umg_bw" id="umg_bw<%=ModuleId %>" style="width:<%=GalleryWidth %>px; height:<%=GalleryHeight %>px; ">
		<div class="wrapper">
			<!-- BW Box Gallery -->
			<div id="xg_container" class="xg_container">
				<!-- 
				The BW images that are shown in the beginning when hovering 
				First one is shown by default
				-->
				<div class="xg_bgimages">
					<%=PreviewHtml %>
				</div>
				<!-- The grid. Change the rel attribute to the color you want to animate to-->
				<ul class="xg_menu" style="<%=Background %>">
				<%=TitleHtml %>
				</ul>
				<div class="xg_back"></div>
				<div class="xg_preview">
					<div class="xg_nav">
						<a id="xg_prev_image" href="#" class="xg_prev_image"></a>
						<a id="xg_next_image" href="#" class="xg_next_image"></a>
					</div>
					<div class="xg_loader"></div>
					<!-- The albums with all the BW images inside -->
				    <%=DataHtml %>
				</div>
			</div>
		</div>
</div>
</div>

<asp:panel id="pnlBestPractise" runat="server" cssclass="Normal Script">
<div style="padding:20px;">
<asp:label id="lblBestPractise" runat="server" resourcekey="BestPractise"></asp:label>
<asp:linkbutton id="lnkGreyscale" runat="server" resourcekey="here"></asp:linkbutton>
</div>
</asp:panel>

		<!-- The JavaScript -->
		<script type="text/javascript">
			/*
			the images preload plugin
			*/
			(function(jQuery) {
				jQuery.fn.preload = function(options) {
					var opts 	= jQuery.extend({}, jQuery.fn.preload.defaults, options);
					o			= jQuery.meta ? jQuery.extend({}, opts, this.data()) : opts;
					var c		= this.length,
						l		= 0;
					return this.each(function() {
						var $i	= jQuery(this);
						jQuery('<img/>').load(function(i){
							++l;
							if(l == c) o.onComplete();
						}).attr('src',$i.attr('src'));	
					});
				};
				jQuery.fn.preload.defaults = {
					onComplete	: function(){return false;}
				};
			})(jQuery);
		</script>
        <script type="text/javascript">
			jQuery(function() {
				/*some caching elems*/
				var $xg_container	= jQuery('#xg_container'),
					$xg_menu		= $xg_container.children('.xg_menu'),
					$xg_preview		= $xg_container.children('.xg_preview'),
					$xg_back		= $xg_container.children('.xg_back'),
					$xg_next_image	= jQuery('#xg_next_image'),
					$xg_prev_image	= jQuery('#xg_prev_image'),
					//current is the position of the selected item
					current			= 0,
					//for the timeout function
					t,
					$menu_links		= $xg_menu.find('a'),
					$bg_images		= $xg_container.children('.xg_bgimages').children(),
					//all images in the preview container
					$preview_images = $xg_preview.find('img');
				
				/*check if you are using a browser*/	
				var ie 				= false;
				if (jQuery.browser.msie) {
					ie = true;//you are not!Anyway let's give it a try
				}
				
				/*first preload images in the menu*/
				$bg_images.preload({
					onComplete	: function(){
						//init events
						initEventHandlers();
					}
				});
				//preload black&white images
				$preview_images.each(function(i){
					var src = jQuery(this).attr('alt');
					jQuery('<img/>').attr('src',src);
				});
				
				function initEventHandlers(){
					
					$menu_links.bind('mouseenter',function(e){
						var $link = jQuery(this);
					
						//if animation return
						if($xg_menu.is(':animated')) 
							return false;
							
						//animate the color of the span
						$link.find('span')
							 .stop()
							 .animate({ 
								backgroundColor: $link.attr('rel') 
							 }, 1000);
						
						var $item	= $link.parent(),
							pos		= $item.index();
						clearTimeout(t);
						//change the menu image
						//the setTimeout is used to prevent
						//the image to change when the user moves the mouse 
						//very quickly through the images
						t = setTimeout(function(){
							changeBgImage(pos);
						},150);
					}).bind('mouseleave',function(e){
						clearTimeout(t);
						var $link = jQuery(this);
						//reset background color
						$link.find('span')
							 .stop()
							 .animate({ 
								backgroundColor: '#FFFFFF' 
							 }, 1000);
					}).bind('click',function(e){
						clearTimeout(t);
						//if animation return
						if($xg_menu.is(':animated')) 
							return false;
						//get the current album	
						var $album 			= $xg_preview.find('.xg_album')
														 .eq(current),
							$current_image;
						
						//current image for this album
						var current_idx		= $album.data('current');
						if(current_idx)
							$current_image 	= $album.children('img')
													.eq(current_idx);
						else{
							$current_image 	= $album.children('img:first');
							$album.data('current',0)
						}	
						
						//reset the left value and show the image
						$current_image.css('left','0px')
									  .show();
						
						//hide the menu
						if(ie)
							$xg_menu.hide();
						else	
							$xg_menu.fadeOut(500);
						
						//the bg image of the menu
						var	$bg_image	= $bg_images.eq(current);
						
						//animate the opacity of the bg image to 0,
						//and hide it
						$bg_image.stop()
						         .animate({
									'opacity':0
								 },1000,function(){jQuery(this).hide();});
						//animate the opacity of the current image to 1
						//first reset the opacity to 0
						$current_image.css('opacity','0')
									  .stop()
									  .animate({'opacity':1},1000,function(){
											//check if we show the next and previous 
											//navigation buttons
											if($current_image.index() > 0)
												$xg_prev_image.show();
											if($current_image.nextAll().length > 0)
												$xg_next_image.show();	
											
											//clicking the next button,
											//shows the next image. The image is animated 
											//from right to left with an easing effect
											//also, the current image gets hidden
											$xg_next_image.unbind('click')
														  .bind('click',function(e){
															if($current_image.nextAll().length == 1)
																$xg_next_image.hide();
															$xg_prev_image.show();
																
															var $next_image = $current_image.next();
															//if no animations and elem exists
															if($next_image.length && !$next_image.is(':animated')){
																$next_image.show()
																		   .stop()
																		   .animate({
																				left : '0px'
																		   },800,'easeInOutExpo',function(){
																				$current_image.hide();
																				$current_image	= $next_image;
																				$album.data('current',$next_image.index());
																		   });
															}
															e.preventDefault();		
														  });
											//clicking the prev button,
											//shows the prev image. The current image is animated 
											//from left to right with an easing effect
											//also, the slided image gets hidden			  
											$xg_prev_image.unbind('click')
														  .bind('click',function(e){
															if($current_image.nextAll().length == 0)
																$xg_next_image.show();
															if($current_image.index() == 1)
																$xg_prev_image.hide();
																
															var $prev_image = $current_image.prev();
															//if no animations and elem exists
															if($prev_image.length && !$current_image.is(':animated')){
																$prev_image.css('left','0px').show();
																$current_image.stop()
																			  .animate({
																				left : '800px'
																			  },800,'easeInOutExpo',function(){
																				$current_image.hide();
																				$current_image	= $prev_image;
																				$album.data('current',$prev_image.index());		
																			  });
															}
															e.preventDefault();		
														  });
														  
											//when clicking on the back button,
											//hide the navigation buttons,
											//show the menu,
											//show the menu image and hide the current image
											$xg_back.show()
													  .unbind('click')
													  .bind('click',function(){
															//if animations return
															if($current_image.is(':animated')|| 
															   $current_image.next().is(':animated'))
																return false;
															
															$xg_back.hide();
															$xg_next_image.hide();
															$xg_prev_image.hide();
															var	$bg_image	= $bg_images.eq(current);
															$bg_image.attr('src', $current_image.attr('alt'));
															if(ie)
																$xg_menu.show()
															else
																$xg_menu.fadeIn(500);
															$bg_image.show()
																	 .stop()
																	 .animate({'opacity':0.3},1000);
															$current_image.stop()
															              .animate({'opacity':0},1000,function(){
																jQuery(this).hide();
															});
													  });		
											
									  });
									  
						e.preventDefault();
					});	
				}
								
				/*
				changes the menu image 
				*/		
				function changeBgImage(pos){
					if(pos == current) 
						return false;
					//hide the current
					$bg_images.eq(current)
							  .css({
									'z-index'	: '1'
							  })
							  .stop()
							  .animate({
									'opacity'	: '0'
							  },600);
					//show the new one
					$bg_images.eq(pos)
							  .css({
									'opacity' 	: '0',
									'z-index'	: '999'
							  })
							  .show()
							  .stop()
							  .animate({
									'opacity'	: '0.3'
							  },600);
					
					//set new current
					current = pos;		  
				}

			});
        </script>