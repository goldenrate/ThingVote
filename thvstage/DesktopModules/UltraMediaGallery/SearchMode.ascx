<%@ Control Language="vb" AutoEventWireup="false" Codebehind="SearchMode.ascx.vb" Inherits="BizModules.UltraPhotoGallery.SearchMode" %>

<script type="text/javascript">
// 830126e595ae5776b3745d836be3b5ba

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
</script>

<table width="100%">
    <tr id="trHeader" runat="server">
        <td class="UMGButtonBar">
            <table class="Normal" width="100%">
                <tr>
                    <td>
                        <asp:label ID="lblSearchBy" runat="server"></asp:label>
                    </td>
                    <td align="right">
                    <asp:HyperLink ID="lnkGallery" runat="server" resourcekey="BackToGallery"></asp:HyperLink>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <div class="highslide-gallery">
                <asp:DataList ID="lstPhotoList" runat="server" CellPadding="3" RepeatColumns="5" Width="100%" RepeatDirection="Horizontal"
                    CssClass="Normal highslide">
                </asp:DataList>
            </div>
        </td>
    </tr>
</table>

