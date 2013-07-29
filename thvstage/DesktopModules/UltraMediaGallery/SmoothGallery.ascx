<%@ Control Language="vb" AutoEventWireup="false" Codebehind="SmoothGallery.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.SmoothGallery" %>

     <!-- wrapper for the whole component -->
     <div id="componentWrapper" class="SG_Container<%=ModuleId%>" style="width: <%=GalleryWidthEx %>px; height: <%=GalleryHeightEx %>px;<%=BackgroundColor %>">
              
          <!-- preloader -->
          <div class="componentPreloader"></div>    
              
          <!-- playlist (hidden) -->
          <div class="componentPlaylist">
         	              
<%=DataHtml %>
          
          </div>
          
          <!-- slideshow controls - previous,pause/play,next -->
          <div class="slideshow_controls">
              <div class="controls_prev"><img src='<%=ModulePath%>Css/smoothgallery/images/icons/prev_off.png' width='30' height='30' alt='controls_prev'/></div>
              <div class="controls_toggle"><img src='<%=ModulePath%>Css/smoothgallery/images/icons/play_off.png' width='30' height='30' alt='controls_toggle'/></div>
              <div class="controls_next"><img src='<%=ModulePath%>Css/smoothgallery/images/icons/next_off.png' width='30' height='30' alt='controls_next'/></div>
          </div>
          
          <!-- data controls - link/description -->
          <div class="data_controls">
          	  <div class="info_toggle"><img src='<%=ModulePath%>Css/smoothgallery/images/icons/info_off.png' width='30' height='30' alt='info_toggle'/></div>
              <div class="link_toggle"><img src='<%=ModulePath%>Css/smoothgallery/images/icons/link_off.png' width='30' height='30' alt='link_toggle'/></div>
          </div>
          <div class="info_holder"></div>
          
          <!-- playlist toggle -->
          <div class="playlist_toggle"><img src='<%=ModulePath%>Css/smoothgallery/images/icons/plus_off.png' width='30' height='30' alt='playlist_toggle'/></div>
      
      	  <!-- for measuring font dimensions -->
          <div class="fontMeasure">a</div>
      
     </div> 
     	
		<script type="text/javascript">
			
			// SETTINGS
			var settings<%=ModuleId%> = {
				<%=Params %>,
				componentFixedSize: true,
				/* forceImageFitMode: true/false. By default, only images bigger than component size will get proportionally resized to 'fit inside' or 'fit outside' mode. If this is true, all images will be forced into that mode. */
				forceImageFitMode: false,
				/* useGlobalDelay; true, false (use same timer delay for all slides, if false you NEED to set individual delays for all categories) */
				useGlobalDelay: true,
				/* slideshowAdvancesToNextCategory: true/false. On the end of current category, go to next one, instead of loop current one. */
				slideshowAdvancesToNextCategory: true,
				/* randomPlay; true, false (random image play in category) */
				randomPlay: false,
				/* useSlideshowControls; true/false (if false, the code will remove it from the DOM)  */
				useSlideshowControls: true,
				/* useDescription; true/false (if false, the code will remove it from the DOM)  */
				useDescription: true,
				
				/* makeImageClickableForUrl: true/false. By default click on url button triggers url action. If this is true, whole image will be clickable for the same action as well.  */
				makeImageClickableForUrl: false,
				
				/* visibleMenuItems: visible menu items by default. Enter number (if they dont fit into provided area, the code will automatically reduce this number) or 'max' (maximum number that fits). */
				visibleMenuItems: 'max',
				/* visibleThumbs: visible thumb items by default. Enter number (if they dont fit into provided area, the code will automatically reduce this number) or 'max' (maximum number that fits). */
				visibleThumbs: 'max',
				/* menuSpacing: spacing between menu items, vertical or horizontal, depending on menu orientation */
				menuSpacing: 20,
				/* thumbSpacing: spacing between thumbs, vertical or horizontal, depending on thumb orientation */
				thumbSpacing: 10,
				/* thumbBorderRadius: Radius that masks thumbnail. Enter 0 for none or a number. */
				thumbBorderRadius: 5,
				/* menuBtnOffset: offset of menu buttons from the menu */
				menuBtnOffset: 20,
				/* menuBtnPosOffset: additional vertical/horizontal offset value for correcting btn position based on font look  */
				menuBtnPosOffset:-1,
				/* thumbBtnOffset:  offset of thumb buttons from the thumbs */
				thumbBtnOffset: 25,
				
				/* thumbRolloverSize: thumb rollover size (stroke). Enter 0 for none. */
				thumbRolloverSize: 5,
				/* thumbRolloverBorderRadius: Enter 0 for none or a number.*/
				thumbRolloverBorderRadius: 5,
				
				/* menuRolloverLRSize: menu rollover left/right size (stroke). Enter 0 for none. */
				menuRolloverLRSize: 10,
				/* menuRolloverTBSize: menu rollover top/bottom size (stroke). Enter 0 for none. */
				menuRolloverTBSize: 2,
				/* menuRolloverBorderRadius: Enter 0 for none or a number. */
				menuRolloverBorderRadius: 5,
				
				/* disableRightClick: true/false  */
				disableRightClick: false,
				/* usePreloader: true/false (if false, the code will remove it from the DOM) */
				usePreloader: true,
				/* maxDescriptionWidth: max width of the description */
				maxDescriptionWidth: 250,
				
				/* menuBeforeSpace: spacing before menu */
				menuBeforeSpace: 5,
				/* menuThumbSpace: spacing between menu and thumbs */
				menuThumbSpace: 10,
				/* thumbAfterSpace: spacing after thumbs  */
				thumbAfterSpace: 5,
				
				/* fixPlaylistToggleBtn: true/false (set this to false to manually position (in css) this button inside component) */
				fixPlaylistToggleBtn: true,
				
				/* fixMenu: true/false. false by default (menu centered). Can be true ONLY if 'visibleMenuItems' != 'max'. 
				Set this to true to position it from side. */
				fixMenu: false,
				/* fixMenuSettings: side: left/right if menu = horizontal, top/bottom if menu = vertical */
				fixMenuSettings: {side: 'left',value: 200},
				/* fixThumbs: true/false. false by default (thumbs centered). Can be true ONLY if 'visibleThumbs' != 'max'. 
				Set this to true to position it from side */
				fixThumbs: false,
				/* fixThumbsSettings:  side: left/right if thumbs = horizontal, top/bottom if thumbs = vertical */
				fixThumbsSettings: {side: 'right',value: 200}
			};
			
			jQuery(window).load(function() {
				jQuery.multiGallery('.SG_Container<%=ModuleId%>', settings<%=ModuleId%>);
					
		});
		
        </script>