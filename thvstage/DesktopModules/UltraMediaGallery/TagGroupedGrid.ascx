<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TagGroupedGrid.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.TagGroupedGrid" %>

<script type="text/javascript">
    // 830126e595ae5776b3745d836be3b5ba

    hs.graphicsDir = '<%=ResolveUrl("css/highslide/graphics/") %>';
    hs.showCredits = false;
    hs.align = 'center';
    hs.transitions = ['expand', 'crossfade'];
    hs.outlineType = 'rounded-white';
    hs.wrapperClassName = 'draggable-header';
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

    <asp:Table ID="Table1" runat="server" Width="100%" CssClass="Normal highslide-gallery">
    <asp:TableRow>
    <asp:TableCell ID="cellFilters" Width="240px" VerticalAlign="Top" cssclass="filters">
        <div class="Head" style="margin-bottom:10px;"><asp:Label ID="Label1" runat="server" resourcekey="Filters" CssClass="Head"></asp:Label></div>

        <asp:Panel runat="server" ID="pnlByCategory" CssClass="section categories">
            <asp:Label ID="Label2" runat="server" resourcekey="ByCategory" CssClass="smallhead block"></asp:Label>
            <asp:Label ID="lblSelectTip" runat="server" resourcekey="SelectionTip" CssClass="selectiontip"></asp:Label>
            <asp:DataList id="lstCategories" runat="server" ItemStyle-CssClass="verticalMiddle">
	        <ItemTemplate>
            <asp:CheckBox ID="chkCategory" runat="server" Checked="true" AutoPostBack="true" Text='<%# DataBinder.Eval(Container.DataItem,"Title") %>' ToolTip='<%# DataBinder.Eval(Container.DataItem,"ItemId") %>' OnCheckedChanged="lnkPage_Click" />
        
	        </ItemTemplate>
            </asp:DataList>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlByTag" CssClass="section tags">
            <asp:Label ID="Label4" runat="server" resourcekey="ByTags" CssClass="smallhead block"></asp:Label>
            <div class="verticalMiddle">
            <asp:Label ID="lblSelectTip2" runat="server" resourcekey="SelectionTip" CssClass="selectiontip"></asp:Label>
            <asp:DataList id="lstTags" runat="server" ItemStyle-CssClass="verticalMiddle">
	        <ItemTemplate>
            <asp:CheckBox ID="chkTag" runat="server" Checked="true" AutoPostBack="true" Text='<%# Container.DataItem.Tag %>' ToolTip='<%# DataBinder.Eval(Container.DataItem,"ItemId") %>' OnCheckedChanged="lnkPage_Click" />
	        </ItemTemplate>
            </asp:DataList>
            </div>
        </asp:Panel>
    </asp:TableCell>
    <asp:TableCell VerticalAlign="Top">

        <asp:Panel runat="server" ID="pnlAction" CssClass="actionpanel">
            <asp:panel ID="pnlView" runat="server">
            <asp:LinkButton ID="lnkGridView" runat="server" resourcekey="GridView" CssClass="gridview" OnClick="lnkPage_Click"></asp:LinkButton>
            <asp:LinkButton ID="lnkListView" runat="server" resourcekey="ListView" CssClass="listview" OnClick="lnkPage_Click"></asp:LinkButton>
            </asp:panel>
            <asp:panel ID="pnlSorting" runat="server" CssClass="sorting" onmouseover="jQuery('.sorting .options').show();" onmouseout="jQuery('.sorting .options').hide();">
                <asp:Label ID="lblSorting" runat="server" CssClass="" />
                <div class='options'>
                    <asp:LinkButton ID="lnkMostRecent" runat="server" resourcekey="Recent" OnClick="lnkPage_Click"></asp:LinkButton>
                    <asp:LinkButton ID="lnkContributor" runat="server" resourcekey="Contributor" OnClick="lnkPage_Click"></asp:LinkButton>
                    <asp:LinkButton ID="lnkTopRated" runat="server" resourcekey="TopRated" OnClick="lnkPage_Click"></asp:LinkButton>
                    <asp:LinkButton ID="lnkAlphabetical" runat="server" resourcekey="Alphabetical" OnClick="lnkPage_Click"></asp:LinkButton>
                </div>
            </asp:panel>
    </asp:Panel>


        <asp:DataList ID="lstPhotos" runat="server" Width="100%" CssClass="videolist" RepeatDirection="Horizontal" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top">
            <ItemTemplate>
            </ItemTemplate>
        </asp:DataList>
        <asp:Panel ID="pnlBottomPager" runat="server" HorizontalAlign="Center">
		    <asp:DataList ID="lstPages" runat="server" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="Normal"
                RepeatDirection="Horizontal" CssClass="pager">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkPage" runat="server" CssClass="page" OnClick="lnkPage_Click" Text='<%#Container.DataItem + 1%>'>
                    </asp:LinkButton>
                    <asp:Label ID="lblPage" runat="server" Visible="false" Text='<%#Container.DataItem + 1%>'
                        CssClass="PagerDisabled"></asp:Label>
                </ItemTemplate>
            </asp:DataList>
        </asp:Panel>
    
    </asp:TableCell>
    </asp:TableRow>
    </asp:Table>
