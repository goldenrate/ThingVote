<%@ Control Language="vb" AutoEventWireup="false" Codebehind="WidescreenTour1.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.WidescreenTour1" %>

<div class="wst" id="wst<%=ModuleId %>" style="width: <%=GalleryWidthEx %>px; height: <%=GalleryHeightEx %>px;">
<%=DataHtml %>
</div>

<div style="display:none;">
<asp:textbox id="txtCoordinates" runat="server" cssclass="coordinates" />
<asp:button id="btnSaveLayout" runat="server" cssclass="savelayout" text="Save" />
</div>

<script type="text/javascript">			
jQuery(document).ready(function() {
    launchwst<%=ModuleId %>();
    if (typeof(Sys) != "undefined")
    {
        var req=Sys.WebForms.PageRequestManager.getInstance();
        if (req)
	        req.add_endRequest(EndRequestHandler<%=ModuleId %>);
	}
});
function launchwst<%=ModuleId %>()
{
    jQuery("#wst<%=ModuleId %>").wst({<%=Params %>});
}
function EndRequestHandler<%=ModuleId %>(sender, args){
    launchwst<%=ModuleId %>();
} 
function WST_SaveLayout(coordinates)
{
    jQuery(".coordinates").attr("value",  coordinates);
    jQuery(".savelayout").trigger("click");
}
</script>