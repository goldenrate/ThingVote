<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Galleria.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.Galleria" %>

<div id="galleria<%=ModuleId %>" style="width: <%=GalleryWidthEx %>px; height: <%=GalleryHeightEx %>px;">
<%=DataHtml %>
</div>

<script type="text/javascript">
    jQuery(document).ready(function() {
	    Galleria.loadTheme('<%=ResolveUrl("Scripts\galleria\galleria.classic.min.js") %>');
    	jQuery('#galleria<%=ModuleId %>').galleria({<%=Params %>});
    });
</script>