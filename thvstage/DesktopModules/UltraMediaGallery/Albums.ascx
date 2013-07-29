<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Albums.ascx.vb" Inherits="BizModules.UltraPhotoGallery.Albums" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>

<UPG:Header ID="ctlHeader" runat="server" />

<script type="text/javascript" language="javascript">
    var uvgPath = '<%= GetDomain() + ModulePath %>';
</script>

<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader">
            <table class="Normal" width="100%" style="height: 30px;">
                <tr>
                    <td>
                        <asp:panel ID="pnlParentAlbum" runat="server">
                            <asp:Label ID="Label1" runat="server" resourcekey="AlbumsUnder" />
                            <asp:DropDownList ID="cboParentAlbum" runat="server" AutoPostBack="true" cssclass="NormalTextBox">
                            </asp:DropDownList>
                        </asp:panel>
                    </td>
                    <td>
                        <asp:TextBox ID="txtApplyDrag" runat="server" Style="display: none;" />
                    </td>
                    <td align="right">
                        <asp:HyperLink ID="lnkAddNew" runat="server" NavigateUrl="#" CssClass="UMGButton">
        <div class="verticalMiddle">
        <img src="<%=ResolveUrl("~/images/add.gif") %>" border="0" />
        <asp:Label ID="lblAddNew" runat="server" resourcekey="AddNew" />
        </div>
                        </asp:HyperLink>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <div id="drag">
                <asp:DataList ID="lstAlbumList" runat="server" RepeatColumns="4" cellpadding="3" Width="100%" RepeatDirection="Horizontal" CssClass="Normal">
                    <ItemStyle VerticalAlign="middle" />
                    <ItemTemplate>
                        <div class="drag_noncurrent" onmouseover="this.className='drag_current';" onmouseout="this.className='drag_noncurrent';">
                                <div class="quickmenu" style="margin-bottom:-16px;">
                                    <div class="buttons">
                                        <a href="javascript:void(0);" onclick="quickEdit(<%#Container.ItemIndex%>);" title="quick edit"><img border="0" src="<%=ResolveUrl("images/lightning.png") %>"></a>
                                        <asp:HyperLink ID="lnkEdit" runat="server" ImageUrl="~/DesktopModules/UltraMediaGallery/images/edit2.png" NavigateUrl='<%#EditUrl("AlbumId", Container.DataItem.ItemId, CType(IIf(Container.DataItem.IsRss, "EditRssAlbum", "EditStdAlbum"), String)) %>' Tooltip="edit"></asp:HyperLink>
                                        <asp:ImageButton ID="imgDelete" runat="server" ImageUrl="~/images/delete.gif" Style="cursor: hand"
                                            OnClick="imgDelete_Click" CssClass="<%#Container.DataItem.ItemId%>" Tooltip="delete"  />
                                    </div>
                                    <div align="right" style="position:relative;top:-16;margin-left:100px;">
                                        <asp:Label ID="lblSub" runat="server" />
                                    </div>
                                </div>
                                <div class="thumbnail" id="itemImage<%#Container.ItemIndex%>">
                                    <img runat="server" id="imgLogo" style="cursor:default;" />
                                </div>
                                <div id="hotspot">
                                    <div class="SubSubHead" align="center" id="itemTitle<%#Container.ItemIndex%>">
                                        <%#Container.DataItem.Title%>
                                    </div>
                                    <div class="Normal" align="center">
                                        <%# GetAlbumOwner(DataBinder.Eval(Container.DataItem,"Owner")) %>
                                        @
                                        <%#Container.DataItem.CreatedDate.ToShortDateString()%>
                                    </div>
                                    <div id="itemId<%#Container.ItemIndex%>" style="display:none;">
                                    <%#Container.DataItem.ItemId%>
                                    </div>
                                    <div id="itemDesc<%#Container.ItemIndex%>" style="display:none;">
                                    <%#Container.DataItem.Description%>
                                    </div>
                                </div>
                            <asp:Label ID="lblAlbumId" runat="server" Text="<%#Container.DataItem.ItemId%>" Visible="false" />
                            <asp:Label ID="lblSortOrder" runat="server" Text="<%#Container.DataItem.SortOrder%>" Visible="false" />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </td>
    </tr>
</table>
<p class="Script" style="text-align:center;">
	<asp:label id="lblDragNDrop" runat="server" resourcekey="DragNDrop" />
</p>
</div>
<script language="javascript">

function myhandler_dropped()
{
	if (row == row_source && cell == cell_source)
	{
		return;
	}

	var columns = tables[table].rows[0].cells.length;
	var destIndex = row * columns + cell;
	var srcIndex = row_source * columns + cell_source;

	//dnn.setVar("UMGDrag", srcIndex + "/" + destIndex);
	document.getElementById("<%=txtApplyDrag.ClientID %>").value = srcIndex + "/" + destIndex;
	__doPostBack('<%=txtApplyDrag.UniqueID %>', srcIndex + "/" + destIndex);
}

function EndRequestHandler(sender, args){
    drag_initialize();
} 

var req=Sys.WebForms.PageRequestManager.getInstance();
if (req)
	req.add_endRequest(EndRequestHandler);

function saveItem(itemId, title, desc)
{
	var eventArgs = "save|" + itemId + "|" + title + "|" + desc;
    dnn.xmlhttp.doCallBack('<%=Me.ID%> <%=Me.ClientID%>',eventArgs,saveItem_CallBack,this,saveItem_CallBackError,null,null,null,0);
}

function saveItem_CallBack(result, ctx)
{
}

function saveItem_CallBackError(result, ctx)
{
	alert(result);
}

</script>

