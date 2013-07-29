<%@ Control Language="vb" AutoEventWireup="false" Codebehind="CloudCarousel.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.CloudCarousel" %>
<div class="umg_carousel" id="umg_carousel<%=ModuleId %>" style="width:<%=GalleryWidth %>px; height:<%=GalleryHeight %>px;background: url(<%=Background %>);overflow: scroll;">
<div class="bgMask" style="background-image:url('<%=ResolveUrl("images/semiblack.png") %>');display:<%=IIf(Background<>"", "block", "none") %>"></div>
    <%=DataHtml %>
    <!-- ************************* -->
    <!-- ************************ -->
    <div id="umg_carousel_title<%=ModuleId %>" class="umg_carousel_title">
    </div>
    <div id="umg_carousel_alt<%=ModuleId %>" class="umg_carousel_alt">
    </div>
    <a href="javascript:void(0);" id="carouselLeft<%=ModuleId %>" class="carouselLeft">
    </a>
    <a href="javascript:void(0);" id="carouselRight<%=ModuleId %>" class="carouselRight">
    </a>
</div>

<asp:panel id="pnlHighslide" runat="server" Visible="False">
<script type="text/javascript">
// 830126e595ae5776b3745d836be3b5ba

hs.graphicsDir = '<%=ResolveUrl("css/highslide/graphics/") %>';

// Add the controlbar
hs.addSlideshow({
	slideshowGroup: <%=ModuleId.ToString() %>,
	interval: 5000,
	repeat: false,
	useControls: true,
	fixedControls: 'fit',
	overlayOptions: {
		opacity: .75,
		position: 'bottom center',
		hideOnMouseOut: true
	}
});
</script>
</asp:panel>

<script type="text/javascript">

jQuery(document).ready(function(){
		
	jQuery("#umg_carousel<%=ModuleId %>").CloudCarousel( { 
	    <%=Params %>
		titleBox: jQuery('#umg_carousel_title<%=ModuleId %>'),
		altBox: jQuery('#umg_carousel_alt<%=ModuleId %>'),
		buttonLeft: jQuery('#carouselLeft<%=ModuleId %>'),
		buttonRight: jQuery('#carouselRight<%=ModuleId %>')
	});	
});
</script>
