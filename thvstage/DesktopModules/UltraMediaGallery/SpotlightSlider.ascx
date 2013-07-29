<%@ Control Language="vb" AutoEventWireup="false" Codebehind="SpotlightSlider.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.SpotlightSlider" %>

<div id='SLS<%=ModuleId %>' class="SLS">
<div class="SLSbody" style='width:<%=GalleryWidth %>px; height:<%=GalleryHeight %>px; '>
<div class="SLSlist">
<div class="SLSlistinner">

<%=DataHtml %>

</div>
</div>
</div>
</div>

<script type="text/javascript">
//<![CDATA[
    jQuery(document).ready(function() {
        jQuery('#SLS<%=ModuleId.ToString %>').spotlight({
		    <%=Params %>
	    });
    });
 //]]>
</script>