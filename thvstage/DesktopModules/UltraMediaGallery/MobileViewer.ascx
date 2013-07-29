<%@ Control Language="vb" AutoEventWireup="false" Codebehind="MobileViewer.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.MobileViewer" %>

<div id="MainContent" class="swipe<%=ModuleId %>">
<%=DataHtml %>
<div class="footer">
    <asp:label id="lblMessage" runat="server" resourcekey="Message"></asp:label>
</div>
</div>


<script type="text/javascript">

		(function(window, jQuery, PhotoSwipe){
			
			jQuery(document).ready(function(){
			
			    var prefix = ".swipe<%=ModuleId %> ";
			
				var options = {captionAndToolbarAutoHideDelay:0};
			    var galleries = jQuery(prefix + ".gallery");
			    for (var i=0;i<galleries.length;i++)
			    {
			        jQuery(galleries[i]).find("a").photoSwipe(options);
			    }
				
				var albums = jQuery(prefix + ".page-content");
				if (albums.length == 1)
				{
				    albums.hide();
				    jQuery(prefix + ".gallery").show();
				}
				else
				{
		            jQuery(prefix + ".page-content:first").addClass("first");
		            jQuery(prefix + ".page-content:last").addClass("last");
            		
		            albums.click(function(){
		                jQuery(prefix + ".gallery").slideUp('fast');
            		    
		                if (jQuery(this).hasClass("currentalbum"))
		                {
		                    jQuery(prefix + ".page-content").removeClass("currentalbum");
		                    return;
		                }
            		    
		                jQuery(prefix + ".page-content").removeClass("currentalbum");
		                var gallery = jQuery(this).next();
		                gallery.slideDown('fast');//
		                jQuery(gallery.find("a")[0]).delay(500, "myQueue").queue("myQueue",function(){jQuery(this).trigger("click"); }).dequeue("myQueue");
            		    
		                jQuery(this).addClass("currentalbum");
		            });
				}
				
			
			    if(jQuery().jquery < "1.5.0")
			    {
			        alert("UMG Mobile Viewer requires jQuery 1.6, please upgrade the jQuery library(/Resources/Shared/scripts/jquery/jquery.min.js) to 1.6.x.");
			    }
			});
			
			
		}(window, window.jQuery, window.Code.PhotoSwipe));
		

</script>
