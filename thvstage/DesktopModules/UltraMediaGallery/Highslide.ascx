<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Highslide.ascx.vb" Inherits="BizModules.UltraPhotoGallery.Highslide" %>
<%@ Register TagPrefix="UNA" TagName="NumericPagination" Src="NumericPagination.ascx" %>

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
        //jQuery(".UMGhighslide img").tooltip({position: "bottom center"});
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

<table width="100%">
    <tr id="trHeader" runat="server">
        <td class="UMGButtonBar Normal">
		<div style="float:left;">
			<asp:DropDownList ID="cboParentAlbum" runat="server" AutoPostBack="true" CssClass="NormalTextBox">
				</asp:DropDownList>
		</div>
		<div style="text-align:right;" class="verticalMiddle">
			<asp:Panel ID="pnlPageSize" runat="server">
			    <div style="display:inline;">
				<asp:Label ID="Label1" runat="server" resourcekey="Show"></asp:Label>&nbsp;
			    </div>
			    <div class="ComboWithoutBorderOuter" style="display:inline;">
				<asp:DropDownList ID="cboPageSize" runat="server" AutoPostBack="true" CssClass="NormalTextBox ComboWithoutBorder">
						</asp:DropDownList>
			    </div>
			    <div style="display:inline;">
				&nbsp;<asp:Label ID="Label2" runat="server" resourcekey="perpage"></asp:Label>
			    </div>
			</asp:Panel>
		</div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="highslide-gallery">
                <asp:DataList ID="lstPhotoList" runat="server" CellPadding="3" RepeatColumns="5" RepeatDirection="Horizontal"
                    CssClass="Normal">
                    <ItemStyle CssClass="UMGHighslideOuter" />
                </asp:DataList>
            </div>
        </td>
    </tr>
    <tr>
        <td align="center">
            <UNA:NumericPagination ID="ucNumericPagination" runat="server">
            </UNA:NumericPagination>
        </td>
    </tr>
</table>

<script language="javascript">

function isclickable(option)
{
    var cboParentAlbum = document.getElementById("<%=cboParentAlbum.ClientID %>");
    var level = cboParentAlbum.options[cboParentAlbum.selectedIndex].text.lastIndexOf("--");
    
    var belowLevel;
    
    if (cboParentAlbum.selectedIndex < cboParentAlbum.length - 1)
        belowLevel = cboParentAlbum.options[cboParentAlbum.selectedIndex + 1].text.lastIndexOf("--");
    
    if (belowLevel > level)
    {
        alert("<%=Localize("AlbumNotSelectable") %>");
        return false;
    }
    return true;
}
</script>

