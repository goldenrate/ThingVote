<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Translucent.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.Translucent" %>
    
    <asp:Panel ID="pnlTBWrapper" runat="server" CssClass="lowest TB_Wrapper">
    <div class="Slides">
<%=DataHtml %>
    </div>
    </asp:Panel>


<script type="text/javascript">

jQuery(document).ready(function(){
		
	jQuery("#<%=pnlTBWrapper.ClientID %>").TransBanner( { 
	    <%=Params %>
	});	
	
});

</script>
