<%@ Control Language="vb" AutoEventWireup="false" Codebehind="MultiMediaGallery.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.MultiMediaGallery" %>
    
<div class="media_container" style="width:<%=GalleryWidth %>px; height:<%=GalleryHeight %>px;">
        <div class="medias" style="display:none;">
            <%=DataHtml %>
        </div>
        <div id="mmg_albumlist" class="albumlist">
	        <asp:repeater id="rptAlbums" runat="server">
		        <ItemTemplate>
			        <asp:linkbutton id="lnkAlbum" runat="server" Text="<%# Container.DataItem.Title %>" tooltip="<%# Container.DataItem.ItemId %>" onclick="lnkAlbum_Click"></asp:linkbutton>
		        </ItemTemplate>
	        </asp:repeater>
        </div>
        <div id="mmg_media_wrapper" class="media_wrapper">
            <ul></ul>
			<div class="more" style="display:none">
				<a id="mmg_more" href="#"><%=Localize("LoadMore") %></a>
			</div>
        </div>
		<div id="mmg_overlay" class="overlay"></div>
		<div id="mmg_preview" class="preview">
			<div id="mmg_preview_loading" class="preview_loading"></div>
            <div class="preview_wrap"></div>
			<div id="mmg_nav" class="nav_buttons">
				<a href="#" class="prev"></a>
				<a href="#" class="next"></a>
			</div>
        </div>
        <div id="mmg_description" class="description"></div>
</div>

<script type="text/javascript">
var useHtml5 = <%=UseHtml5.ToString().ToLower() %>;
var modulePath = "<%=ModulePath %>";

jQuery(document).ready(function(){
    
    
    if (typeof(Sys) != "undefined")
    {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm) prm.add_endRequest(PageLoadedEventHandler);
    }

    function PageLoadedEventHandler() {
        mmg_run();
   }
    
    mmg_run();
    
    
});

function mmg_finished()
{
    /*var images = jQuery(".media_wrapper img");
    $.each(images, function(key, value) {
        jQuery(this).tooltip({position: "bottom center"});
    });*/
}

</script>
