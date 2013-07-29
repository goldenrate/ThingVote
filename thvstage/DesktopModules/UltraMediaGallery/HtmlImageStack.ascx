<%@ Control Language="vb" AutoEventWireup="false" Codebehind="HtmlImageStack.ascx.vb" Inherits="BizModules.UltraPhotoGallery.HtmlImageStack" %>

<div class="umg_stack" id="umg_stack<%=ModuleId %>" style="width:<%=GalleryWidth %>px; height:<%=GalleryHeight %>px; ">
    <div class="datahtml">
        <%=DataHtml %>
    </div>
    <div class="stack"></div>
    <div class="caption"></div>
    <div class="loading"></div>
    <div class="buttons"><a class="prev" href="javascript:void(0);"></a><a class="next" href="javascript:void(0);"></a></div>
</div>

<script type="text/javascript">
//<![CDATA[
var umgStack<%=ModuleId %>;
jQuery(document).ready(function(){ 
	umgStack<%=ModuleId %> = new umgStack(<%=ModuleId %>);

	umgStack<%=ModuleId %>.play({<%=Params %>});
});
 //]]>
</script>



