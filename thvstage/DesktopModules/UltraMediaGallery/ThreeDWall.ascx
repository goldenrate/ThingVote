<%@ Control Language="vb" AutoEventWireup="false" Codebehind="ThreeDWall.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.ThreeDWall" %>
    
<div class="wall_container" style="width:<%=GalleryWidth %>px; height:<%=GalleryHeight %>px;<%=BgColor %>">
		<div class="header">
			<h1><%=AlbumTitle %></h1>
			<div id="pg_scrollWrapper" class="pg_scrollWrapper" style="display:<%=TopNavigationVisible %>;">
				<div id="slider" class="slider"></div>
			</div>
		</div>
		<div class="wall">
			<div id="pg_container" class="pg_container">
				<ul id="pg_photos" class="pg_photos">
                    <%=DataHtml %>
				</ul>
			</div>
		</div>
		<div class="footer" style="display:<%=BottomNavigationVisible %>;">
			<div class="thumbnailSlider" id="thumbnailSlider">
				<ul class="ts_container">
                    <%=TitleHtml %>
					<li class="ts_thumbnails">
						<div class="ts_preview_wrapper">
							<ul class="ts_preview">
                                <%=ThumbHtml %>
							</ul>
						</div>
						<span></span>
					</li>
				</ul>
			</div>
		</div>
</div>

<script type="text/javascript">
    var thumbWidth = <%=ThumbnailSize.Width %>;
    var thumbHeight = <%=ThumbnailSize.Height %>;
</script>