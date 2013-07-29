<%@ Control Language="vb" AutoEventWireup="false" Codebehind="MooFlow.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.MooFlow" %>

<link rel="stylesheet" href="<%=ModulePath %>css/mooflow/MooFlow.css" type="text/css" /> 
<link rel="stylesheet" href="<%=ModulePath %>css/mooflow/MooFlowViewer.css" type="text/css" /> 
<script src="<%=ModulePath %>scripts/mooflow/mootools-1.2-core.js" type="text/javascript"></script>
<script src="<%=ModulePath %>scripts/mooflow/mootools-1.2-more.js" type="text/javascript"></script>
<script src="<%=ModulePath %>scripts/mooflow/MooFlow.js" type="text/javascript"></script>
<script src="<%=ModulePath %>scripts/mooflow/MooFlowViewer.js" type="text/javascript"></script>

<script type="text/javascript">
	var myMooFlowPage = {
	
		start: function(){
	
			var mf = new MooFlow($('MooFlow'), {
				useSlider: true,
				useAutoPlay: true,
				useCaption: true,
				useResize: true,
				useMouseWheel: true,
				useKeyInput: true,
				useViewer: true
			});
			
			mf.attachViewer();
			
			$$('.loadremote').addEvent('click', function(){
				mf.loadHTML(this.get('href'), this.get('rel'));
				return false;
			});
		}
		
	};
	
	window.addEvent('domready', myMooFlowPage.start);
</script> 


<div id="content" style="width:<%=GalleryWidthEx.ToString %>px;text-align:left;">
  <div id="MooFlow">
    <%=DataHtml %>
  </div>
</div>
