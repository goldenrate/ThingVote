<%@ Control Language="vb" AutoEventWireup="false" Codebehind="MediaLibrary.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.MediaLibrary" %>
 
<script type="text/javascript">
// 830126e595ae5776b3745d836be3b5ba

jQuery(document).ready(function(){

    hs.graphicsDir = '<%=ResolveUrl("css/highslide/graphics/") %>';
    hs.showCredits = false;
    hs.align = 'center';
    hs.transitions = ['expand', 'crossfade'];
    hs.outlineType = '<%=Theme %>';
    <%If WrapperClass<> ""%>hs.wrapperClassName = '<%=WrapperClass%>';<%End If%>
    hs.fadeInOut = true;
    //hs.dimmingOpacity = 0.75;

    // Add the controlbar
    hs.addSlideshow({
	    slideshowGroup: <%=ModuleId.ToString() %>,
	    interval: 5000,
	    repeat: false,
	    useControls: true,
	    fixedControls: 'fit',
	    overlayOptions: {
		    opacity: .75,
		    position: 'bottom center',
		    hideOnMouseOut: true
	    }
    });
    
    function initTooltips()
    {
        //jQuery(".Libmedia img").tooltip({position: "bottom center"});
    }
    
    initTooltips();
    
    if (typeof(Sys) != "undefined")
    {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(PageLoadedEventHandler);
    }

    function PageLoadedEventHandler() {
        initTooltips();
    }
    
});
</script>

<asp:TextBox ID="txtMediaPath" runat="server" Text="/images" Style="display: none;"></asp:TextBox>
<div class="Normal" style="width: <%=GalleryWidth.ToString %>px; height: <%=GalleryHeight.ToString %>px;
    position: relative;">
    <div class="Libleft" style="width:200px;height: <%=GalleryHeight.ToString %>px;">
        <%=LeftMenu %>
    </div>
    <div class="Libsplitter"></div>
    <div class="Libright" style="width:<%=(GalleryWidth-200).ToString %>px; height: <%=GalleryHeight.ToString %>px;">
        <div class="Libloading" style="display:none;"></div>
        <asp:Label ID="lblData" runat="server"></asp:Label>
    </div>
</div>

<script type="text/javascript">
jQuery(document).ready(function(){
    var root = jQuery(".Libleft").find("a[title='<%=txtMediaPath.Text %>']");
	root.parent().addClass("Libcurrent");
});

function LibOpen(sender)
{
	jQuery(".Libcurrent").removeClass("Libcurrent");

	var objSender = jQuery(sender);
	objSender.parent().addClass("Libcurrent");	
	
	jQuery(".Libloading").show();
	jQuery("#<%=lblData.ClientID %>").hide();

    var txtMediaPath = jQuery("#<%=txtMediaPath.ClientID %>");
    txtMediaPath.attr("value", objSender.attr("title"));
    __doPostBack('<%=txtMediaPath.UniqueID %>', objSender.attr("title"));

}

</script>

