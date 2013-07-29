<%@ Control Language="vb" AutoEventWireup="false" Codebehind="CarouselEvolution.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.CarouselEvolution" %>
<div style="width:<%=GalleryWidthEx %>px;height:<%=GalleryHeightEx %>px;">
<div id='umg_carousel<%=ModuleId %>' class="carousel" > <!-- BEGIN CONTAINER -->
<%=TextHtml %>
<%=DataHtml %>
</div>
</div>

<script type="text/javascript">

jQuery(document).ready(function(){
		
	var carousel<%=ModuleId %> = jQuery("#umg_carousel<%=ModuleId %>").carousel( { 
	    <%=Params %>, after: afterMove<%=ModuleId %>
	});	
	
	afterMove<%=ModuleId %>(carousel<%=ModuleId %>);
});

function afterMove<%=ModuleId %>(carousel)
{
    jQuery("#umg_carousel<%=ModuleId %> .slideItem").removeClass("current").eq(carousel.current).addClass("current");
}
</script>
