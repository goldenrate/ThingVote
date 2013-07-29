<%@ Control Language="vb" AutoEventWireup="false" Codebehind="KenBurnSlider.ascx.vb" Inherits="BizModules.UltraPhotoGallery.KenBurnSlider" %>

<div id="kenburn<%=ModuleId %>" class="bannercontainer <%=Theme %>" style="max-width:<%=GalleryWidthEx %>px; height:<%=GalleryHeightEx %>px;">
<%=DataHtml %>
</div>

<script type="text/javascript">
    jQuery(document).ready(function() {
    	jQuery('#kenburn<%=ModuleId %>').kenburn({
    	                    <%=Params %>
    	                    thumbVertical: 'bottom',
							thumbHorizontal:"center",							
							thumbXOffset:0,
							thumbYOffset:40,
							bulletXOffset:0,
							bulletYOffset:-16,
							
							repairChromeBug:"on",
																																										
							pauseOnRollOverThumbs:'off',
							preloadedSlides:2,							
							
							debug:"off"
    	});
    });
</script>