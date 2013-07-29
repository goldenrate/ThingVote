<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TimelineSlider.ascx.vb" Inherits="BizModules.UltraPhotoGallery.TimelineSlider" %>

<div id="timelineslider<%=ModuleId %>" class='timelineslider' style="width:<%=GalleryWidthEx %>px;">
    <div class='timelineouter'>
	<div class='timeline'>
		<div class='left'></div>
		<div class='center'>
			<div class='markers'></div>
			<div class='slider draggable'></div>
		</div>
		<div class='right'></div>
	</div>
	</div>

	<div class='slidesouter' style="height:<%=GalleryHeightEx %>px;">
		<div class='slides'>
		
<%=DataHtml %>
		</div>
		
		<div class='xofyouter'><div class='xofy'><div class='x'></div><div class='y'></div></div></div>
		<div><div class='previtem'></div><div class='nextitem'></div></div>

		<div class='descouter'><div class='desc'></div></div>
	</div>
</div>

<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery("#timelineslider<%=ModuleId %>").timelineslider({<%=Params %>});
});
</script>