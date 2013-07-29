<%@ Control Language="vb" AutoEventWireup="false" Codebehind="SimpleSlider.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.SimpleSlider" %>

     <span id="slider<%=ModuleId %>" class="nivoFrame1"><span class="nivoFrame2"><span class="nivoFrame3"><span class="nivoFrame4">

			<div class="nivoSlider">
				<div class="sliderMain" style="width: <%=GalleryWidthEx %>px; height: <%=GalleryHeightEx %>px;">
                <%=DataHtml %>
				</div>
            </div>

			<div class="dataholder">
                <%=CaptionHtml %>
			</div>


	 </span></span></span></span>

<script type="text/javascript">
    jQuery(window).load(function() {
        jQuery('#slider<%=ModuleId %>').nivoSlider({
            <%=Params %>, slices:15, boxCols: 8, boxRows: 4
        });
    });
</script>