<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TripleLayerSlider.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.TripleLayerSlider" %>

<%=DataHtml %>

<script type="text/javascript">
//<![CDATA[
    jQuery(document).ready(function() {
        jQuery('#TLS<%=ModuleId.ToString %>').oSlider({
		    <%=Params %>
	    });
    });
 //]]>
</script>