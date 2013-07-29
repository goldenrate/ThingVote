<%@ Control Language="vb" AutoEventWireup="false" Codebehind="WidescreenTour2.ascx.vb" Inherits="BizModules.UltraPhotoGallery.WidescreenTour2" %>

<div class="umg_wst" id="umg_wst<%=ModuleId %>" style="width:<%=GalleryWidth %>px; height:<%=GalleryHeight %>px; <%=BackgroundColor %>">
    <div class="datahtml">
        <%=DataHtml %>
    </div>
    <div class="preview">
        <%=Preview %>
    </div>
</div>

<script type="text/javascript">
//<![CDATA[
jQuery(document).ready(function(){ 
	    var jfq = jQuery("#umg_wst<%=ModuleId %>").foldinggallery({
		    <%=Params %>
	    });
});
 //]]>
</script>



