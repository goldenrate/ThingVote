<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TonicGallery.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.TonicGallery" %>

<div id="portfolio<%=ModuleId %>" style="width: <%=GalleryWidthEx %>px; height: <%=GalleryHeightEx %>px;">
    <div class="loading"></div>
</div>

<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#portfolio<%=ModuleId %>').empty();
        jQuery('#portfolio<%=ModuleId %>').portfolioSetter({<%=Params %>});
    });
</script>