<%@ Control Language="vb" AutoEventWireup="false" Codebehind="PhotoStack.ascx.vb" Inherits="BizModules.UltraPhotoGallery.PhotoStack" %>

<div class="umg_ps" id="umg_ps<%=ModuleId %>" style="width:<%=GalleryWidth %>px; height:<%=GalleryHeight %>px; ">
		<div id="ps_slider" class="ps_slider" style="margin-top:<%=((GalleryHeight-310)/2).ToString() %>px;">
			<div id="ps_albumsouter">
			    <div id="ps_albums">
				    <%=DataHtml %>
				</div>
			</div>	
			<a class="prev disabled"></a>
			<a class="next disabled"></a>
		</div>
		
		<div id="ps_overlay" class="ps_overlay" style="display:none;"></div>

		<a id="ps_close" class="ps_close" style="display:none;"></a>
		<div id="ps_container" class="ps_container" style="display:none;">
			<a id="ps_next_photo" class="ps_next_photo" style="display:none;"></a>
		</div>
</div>

		<script type="text/javascript">
            jQuery(function() {
                var gallery = jQuery("#umg_ps<%=ModuleId %>");
				/**
				* navR,navL are flags for controlling the albums navigation
				* first gives us the position of the album on the left
				* positions are the left positions for each of the 5 albums displayed at a time
				*/
                var navR,navL	= false;
				var first		= 1;
//				var positions 	= {
//					'0'		: 0,
//					'1' 	: 170,
//					'2' 	: 340,
//					'3' 	: 510,
//					'4' 	: 680
//				}
				var $ps_albums 		= jQuery('#ps_albums');
				/**
				* number of albums available
				*/
				var elems			= $ps_albums.children().length;
				var $ps_slider		= jQuery('#ps_slider');
				
				var ps_albumsouter = jQuery('#ps_albumsouter');
				var first = jQuery($ps_albums.children(".ps_album")[0]);
				if(first.length > 0)
				{
					var firstW = first.width() + first.css("borderLeftWidth").replace("px","") * 2 + first.css("padding-left").replace("px","") * 2 + first.css("margin-left").replace("px","") * 2;
					var itemsPerPage = Math.floor((gallery.width() - 60) / firstW);
					ps_albumsouter.css("width", itemsPerPage * firstW);
					ps_albumsouter.css("margin-left", (gallery.width() - itemsPerPage * firstW) / 2);
					var last = jQuery($ps_albums.children()[elems-1]);
					var totalW = last.position().left+last.width()+last.css("margin-right").replace("px","") * 1;
					$ps_albums.css("width", totalW);
				}
				showHideControls();
				
				function showHideControls()
				{
				    var left = $ps_albums.css("margin-left").replace("px","") * 1;
				    if(left < 0)
				    {
				        enableNavLeft();
				    }
				    else
				    {
				        disableNavLeft();
				    }
				    //alert(left +"/"+ totalW +"/"+ ps_albumsouter.width());
				    if(left + totalW > ps_albumsouter.width())
				    {
				        enableNavRight();
				    }
				    else
				    {
				        disableNavRight();
				    }
				}
				
				
				/**
				* let's position the albums on the right side of the window
				*/
//				var hiddenRight 	= jQuery(window).width() - $ps_albums.offset().left;
//				$ps_albums.children('div').css('left',hiddenRight + 'px');
//				/**
//				* move the first 5 albums to the viewport
//				*/
//				$ps_albums.children('div:lt(5)').each(
//					function(i){
//						var $elem = jQuery(this);
//						$elem.animate({'left': positions[i] + 'px','opacity':1},800,function(){
//							if(elems > 5)
//								enableNavRight();
//						});
//					}
//				);
				
					

				/**
				* next album
				*/
				$ps_slider.find('.next').bind('click',function(){
//					if(!$ps_albums.children('div:nth-child('+parseInt(first+5)+')').length || !navR) return;
//					disableNavRight();
//					disableNavLeft();
					moveRight();
				});
				
				/**
				* we move the first album (the one on the left) to the left side of the window
				* the next 4 albums slide one position, and finally the next one in the list
				* slides in, to fill the space of the first one
				*/
				function moveRight () {
				    var left = $ps_albums.css("margin-left").replace("px","") * 1;
				    var newLeft = left - firstW * (itemsPerPage-1);
				    newLeft-=newLeft%firstW;
				    if (newLeft+totalW < ps_albumsouter.width())
				    {
				        newLeft = ps_albumsouter.width() - totalW;
				    }
				    $ps_albums.animate({'margin-left': newLeft},"slow", function(){showHideControls();});
				}
				
				/**
				* previous album
				*/
				$ps_slider.find('.prev').bind('click',function(){
//					if(first==1  || !navL) return;
//					disableNavRight();
//					disableNavLeft();
					moveLeft();
				});
				
				/**
				* we move the last album (the one on the right) to the right side of the window
				* the previous 4 albums slide one position, and finally the previous one in the list
				* slides in, to fill the space of the last one
				*/
				function moveLeft () {
				    var left = $ps_albums.css("margin-left").replace("px","") * 1;
				    var newLeft = left + firstW * (itemsPerPage-1);
				    newLeft-=newLeft%firstW;
				    if (newLeft > 0)
				    {
				        newLeft = 0;
				    }
				    $ps_albums.animate({'margin-left': newLeft},"slow", function(){showHideControls();});
				    return;
				}
				
				/**
				* disable or enable albums navigation
				*/
				function disableNavRight () {
					navR = false;
					$ps_slider.find('.next').addClass('disabled');
					$ps_slider.find('.next').hide();
				}
				function disableNavLeft () {
					navL = false;
					$ps_slider.find('.prev').addClass('disabled');
					$ps_slider.find('.prev').hide();
				}
				function enableNavRight () {
					navR = true;
					$ps_slider.find('.next').removeClass('disabled');
					$ps_slider.find('.next').show();
				}
				function enableNavLeft () {
					navL = true;
					$ps_slider.find('.prev').removeClass('disabled');
					$ps_slider.find('.prev').show();
				}		
				
				var $ps_container 	= jQuery('#ps_container');
				var $ps_overlay 	= jQuery('#ps_overlay');
				var $ps_close		= jQuery('#ps_close');
				
				$ps_container.css("width", gallery.width() * .8)
				$ps_container.css("height", gallery.height() * .8)
				$ps_container.css("margin-top", gallery.height() * -0.4)
				$ps_container.css("margin-left", gallery.width() * -0.4)
				/**
				* when we click on an album,
				* we load with AJAX the list of pictures for that album.
				* we randomly rotate them except the last one, which is
				* the one the User sees first. We also resize and center each image.
				*/
				$ps_albums.children('div').bind('click',function(){
					var $elem = jQuery(this);
					var album_name 	= 'album' + parseInt($elem.index() + 1);
					var $loading 	= jQuery('<div />',{className:'loading'});
					$elem.append($loading);
					$ps_container.find('img').remove();
					
					var data = $elem.children('.ps_images').children("img");
					var items_count	= data.length;
					for(var i = 0; i < items_count; ++i){
						var item_source = jQuery(data[i]).attr("alt");
						var cnt 		= 0;
						jQuery('<img />').load(function(){
							var $image = jQuery(this);
							++cnt;
							resizeCenterImage($image);
							$ps_container.append($image);
							var r		= Math.floor(Math.random()*41)-20;
							if(cnt < items_count){
								$image.css({
									'-moz-transform'	:'rotate('+r+'deg)',
									'-webkit-transform'	:'rotate('+r+'deg)',
									'transform'			:'rotate('+r+'deg)'
								});
							}
							if(cnt >= items_count *.5){
								$loading.remove();
								$ps_container.show();
								$ps_close.show();
								$ps_overlay.show();
							}
						}).attr('src',item_source);
					}
				});
				
				/**
				* when hovering each one of the images, 
				* we show the button to navigate through them
				*/
				$ps_container.live('mouseenter',function(){
					jQuery('#ps_next_photo').show();
				}).live('mouseleave',function(){
					jQuery('#ps_next_photo').hide();
				});
				
				/**
				* navigate through the images: 
				* the last one (the visible one) becomes the first one.
				* we also rotate 0 degrees the new visible picture 
				*/
				jQuery('#ps_next_photo').bind('click',function(){
					var $current 	= $ps_container.find('img:last');
					var r			= Math.floor(Math.random()*41)-20;
					
					var currentPositions = {
						marginLeft	: $current.css('margin-left'),
						marginTop	: $current.css('margin-top')
					}
					var $new_current = $current.prev();
					
					$current.animate({
						'marginLeft':'250px',
						'marginTop':'-385px'
					},250,function(){
						jQuery(this).insertBefore($ps_container.find('img:first'))
							   .css({
									'-moz-transform'	:'rotate('+r+'deg)',
									'-webkit-transform'	:'rotate('+r+'deg)',
									'transform'			:'rotate('+r+'deg)'
								})
							   .animate({
									'marginLeft':currentPositions.marginLeft,
									'marginTop'	:currentPositions.marginTop
									},250,function(){
										$new_current.css({
											'-moz-transform'	:'rotate(0deg)',
											'-webkit-transform'	:'rotate(0deg)',
											'transform'			:'rotate(0deg)'
										});
							   });
					});
				});
				
				/**
				* close the images view, and go back to albums
				*/
				jQuery('#ps_close').bind('click',function(){
					$ps_container.hide();
					$ps_close.hide();
					$ps_overlay.hide();
				});
				
				/**
				* resize and center the images
				*/
				function resizeCenterImage($image){
					var theImage 	= new Image();
					theImage.src 	= $image.attr("src");
					var imgwidth 	= theImage.width;
					var imgheight 	= theImage.height;
					
					var containerwidth  = $ps_container.width() - 20;
					var containerheight = $ps_container.height() - 20;
					
					if(imgwidth	> containerwidth){
						var newwidth = containerwidth;
						var ratio = imgwidth / containerwidth;
						var newheight = imgheight / ratio;
						if(newheight > containerheight){
							var newnewheight = containerheight;
							var newratio = newheight/containerheight;
							var newnewwidth =newwidth/newratio;
							theImage.width = newnewwidth;
							theImage.height= newnewheight;
						}
						else{
							theImage.width = newwidth;
							theImage.height= newheight;
						}
					}
					else if(imgheight > containerheight){
						var newheight = containerheight;
						var ratio = imgheight / containerheight;
						var newwidth = imgwidth / ratio;
						if(newwidth > containerwidth){
							var newnewwidth = containerwidth;
							var newratio = newwidth/containerwidth;
							var newnewheight =newheight/newratio;
							theImage.height = newnewheight;
							theImage.width= newnewwidth;
						}
						else{
							theImage.width = newwidth;
							theImage.height= newheight;
						}
					}
					$image.css({
						'width'			:theImage.width,
						'height'		:theImage.height,
						'margin-top'	:-(theImage.height/2)-10+'px',
						'margin-left'	:-(theImage.width/2)-10+'px'	
					});
				}
            });
        </script>
