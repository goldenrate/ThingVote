<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Htmlslide.ascx.vb" Inherits="BizModules.UltraPhotoGallery.Htmlslide" %>

<div id="umg_template<%=ModuleId %>">
    <div id="umg_container<%=ModuleId %>" style="text-align:left;display:none;">
	    <div id="umg_countdown<%=ModuleId %>"></div>
	    <div id="umg_largelist<%=ModuleId %>">
			<div id="umg_large<%=ModuleId %>"></div>
		</div>
	    <div id="umg_caption<%=ModuleId %>">
		    <div id="umg_captiontext<%=ModuleId %>">
			    <div id="umg_captiontitle<%=ModuleId %>"></div>
			    <div id="umg_captiondescription<%=ModuleId %>"></div>
			    <div id="umg_captionauthor<%=ModuleId %>"></div>
			    <div id="umg_captiontakendate<%=ModuleId %>"></div>
			    <div id="umg_captiontags<%=ModuleId %>"></div>
		    </div>
	    </div>
	    <div id="umg_buttons<%=ModuleId %>"><a id="umg_prev<%=ModuleId %>" href="javascript:void(0);"></a><a id="umg_play<%=ModuleId %>" href="javascript:void(0);"></a><a id="umg_next<%=ModuleId %>" href="javascript:void(0);"></a></div>
		<div id="umg_navilist<%=ModuleId %>">
			<div id="umg_navi<%=ModuleId %>"></div>
		</div>
	    <a id="umg_more<%=ModuleId %>" target="_blank"><%=Localize("More") %></a>
	    <div id="umg_loading<%=ModuleId %>"></div>
	    <div id="umg_thumbslist<%=ModuleId %>">
		    <div id="umg_thumbs<%=ModuleId %>"></div>
	    </div>
		<div id="umg_xofy<%=ModuleId %>"></div>
    </div>
</div>

<div id="umg_images<%=ModuleId %>">
    <%=DataHtml %>
</div>
<script type="text/javascript">
//<![CDATA[
var slide<%=ModuleId %>;
jQuery(document).ready(function(){ 
	slide<%=ModuleId %> = new umgSlide("umg_images<%=ModuleId %>", <%=ModuleId %>);
<%=Transition_Scripts %>
<%=Template_Script %>

    slide<%=ModuleId %>.play({mode:"<%=ModuleUserSetting("Htmlslide_Transition_SlideshowMode") %>", autoPlay:"<%=ModuleUserSetting("Htmlslide_Transition_DoAutoPlay") %>", slideTimeout:"<%=ModuleUserSetting("Htmlslide_Transition_AutoPlay") %>", loopPlay:"<%=ModuleUserSetting("Htmlslide_Transition_LoopPlay") %>", disabledControls:"<%=ModuleUserSetting("Htmlslide_Transition_Visibility") %>", keyboardControl:"<%=ModuleUserSetting("Htmlslide_Transition_ArrowKey") %>", mouseOver:"<%=ModuleUserSetting("Htmlslide_Transition_MouseOver") %>", easing:"<%=ModuleUserSetting("Htmlslide_Easing") %>"});
});
 //]]>
</script>



