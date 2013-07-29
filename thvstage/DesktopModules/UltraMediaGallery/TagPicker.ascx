<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TagPicker.ascx.vb" Inherits="BizModules.UltraPhotoGallery.TagPicker" %>
<%=TagInput %>
<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery(".<%=Me.ClientID %>tag").tagedit({
            autocompleteOptions: { source: completeTags }
        });
    });
</script>