<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Headline.ascx.vb" Inherits="BizModules.UltraPhotoGallery.Headline" %>

<div id="accordion<%=ModuleId %>">
<%=DataHtml %>
</div>

<script type="text/javascript">
    jQuery(document).ready(function() {
    	jQuery('#accordion<%=ModuleId %>').liteAccordion({<%=Params %>});
    });
</script>