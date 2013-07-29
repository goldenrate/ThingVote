<%@ Control Language="vb" AutoEventWireup="false" Codebehind="UMGClassic.ascx.vb" Inherits="BizModules.UltraPhotoGallery.UMGClassic" %>

<asp:Panel ID="pnlUMGClassic" runat="server" CssClass="umgclassic">
<div class="datahtml">
<%=DataHtml %>
</div>
</asp:Panel>

<script type="text/javascript">			
jQuery(document).ready(function() {
    launchclassic<%=ModuleId %>();
    if (typeof(Sys) != "undefined")
    {
        var req=Sys.WebForms.PageRequestManager.getInstance();
        if (req)
	        req.add_endRequest(EndRequestHandler<%=ModuleId %>);
	}
});
function launchclassic<%=ModuleId %>()
{
    jQuery("#<%=pnlUMGClassic.ClientID %>").umgclassic({<%=Params %>});
}
function EndRequestHandler<%=ModuleId %>(sender, args){
    launchclassic<%=ModuleId %>();
} 
</script>