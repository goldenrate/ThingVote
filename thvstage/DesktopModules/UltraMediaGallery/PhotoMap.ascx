<%@ Control Language="vb" AutoEventWireup="false" Codebehind="PhotoMap.ascx.vb" Inherits="BizModules.UltraPhotoGallery.PhotoMap" %>

<asp:Label ID="lblWarning" runat="server" CssClass="warning" Visible="false"></asp:Label>

		<script id="galleryTmpl" type="text/x-jquery-tmpl">
			<div class="mp-album-outer">
			<div class="mp-album">
						{{each(i, option) tmplPhotosData}}
							<a href="${tmplPhotosData[i]}"><img src="${tmplPhotosData[i]}"/></img></a>
					{{/each}}
				</div>
			</div>			
		</script>
		<script id="galleryAlbumTmpl" type="text/x-jquery-tmpl">
			<div id="mp-album-overlay" class="mp-album-overlay">
					<div class="mp-album-nav">
						<span class="mp-album-nav-prev"><%=Localize("Previous") %></span>
						<span class="mp-album-nav-next">Next</span>
					</div>
					<div class="mp-image-loading-small">Loading...</div>
					<div class="mp-album-image-wrapper">
						<div class="mp-album-image">
						<img src="${tmplPhotoData.source}"/>
							<a href="#" class="mp-album-image-zoom">Real size</a>
						</div>
					</div>
					<span class="mp-album-overlay-close">Close overlay</span>
				</div>
		</script>
		<script id="galleryFullscreenTmpl" type="text/x-jquery-tmpl">
			<div id="mp-image-overlay" class="mp-image-overlay">
				<div class="mp-loading">Loading...</div>
				<img src="${tmplPhotoData.source}" style="display:none;"/>
				<div class="mp-image-overlay-desc">
					<h2 class="mp-label">${tmplPhotoData.description}</h2>
				</div>
				<span class="mp-image-overlay-close">Close overlay</span>
			</div>
		</script>


			<div class="mp-container" id="mp-container">
				<div class="mp-map-wrapper" id="map"></div>
				<div class="mp-album-wrapper" id="mp-album-wrapper"></div>
			</div>
