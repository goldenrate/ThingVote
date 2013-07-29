<%@ Control Language="vb" AutoEventWireup="false" Codebehind="WizardStep1.ascx.vb" Inherits="BizModules.UltraPhotoGallery.WizardStep1" %>

<div style="text-align:left;">
    <p class="Head">
    <asp:label id="lblWizard" resourcekey="Wizard" runat="server"></asp:label>
    </p>
    <p class="Normal">
    <asp:label id="lblWizard2" resourcekey="Wizard.Help" runat="server"></asp:label>
    </p>
</div>

<div class="wall_container" style="width:100%; height:395px;">
		<div class="header">
			<h1><asp:label id="lblUMGPresentations" resourcekey="UMGPresentations" runat="server"></asp:label></h1>
			<div id="pg_scrollWrapper" class="pg_scrollWrapper">
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
		<div class="footer">
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
    var thumbWidth = 96;
    var thumbHeight = 54;
</script>


<p>
    <asp:textbox id="txtPresentationId" runat="server" cssclass="presentationid" style="display:none;"></asp:textbox>
    <asp:button id="btnNextStep" resourcekey="NextStep" runat="server"></asp:button>
    <asp:button id="btnSkip" resourcekey="Skip" runat="server"></asp:button>
</p>