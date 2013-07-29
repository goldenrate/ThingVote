<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Manage.ascx.vb" Inherits="BizModules.UltraPhotoGallery.Manage" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<%@ Register TagPrefix="UNA" TagName="NumericPagination" Src="NumericPagination.ascx" %>
<upg:header id="ctlHeader" runat="server" />

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
                        <%=Localize("Display") %>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboMediaType" runat="server" autopostback="True" cssclass="NormalTextBox">
                            <asp:ListItem Text="medias" value="0"></asp:ListItem>
                            <asp:ListItem Text="images" value="1"></asp:ListItem>
                            <asp:ListItem Text="videos" value="2"></asp:ListItem>
                            <asp:ListItem Text="audios" value="4"></asp:ListItem>
                            <asp:ListItem Text="flashs" value="8"></asp:ListItem>
                        </asp:dropdownlist>
                    </td>
                    <td>
                        <asp:label id="lblIn" runat="server" resourcekey="in"></asp:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboParentAlbum" runat="server" autopostback="true" cssclass="NormalTextBox">
                        </asp:dropdownlist>
                    </td>
                    <td>
                        <asp:textbox id="txtApplyDrag" runat="server" style="display: none;" />
                    </td>
                    <td style="width: 80%;" align="right">
                        <table cellpadding="0" cellspacing="0" class="Normal">
                            <tr>
                                <td>
                                    <asp:label id="Label1" runat="server" resourcekey="Show"></asp:label>
                                    &nbsp;</td>
                                <td>
                                    <div class="ComboWithoutBorderOuter">
                                        <asp:dropdownlist id="cboPageSize" runat="server" autopostback="true" cssclass="NormalTextBox ComboWithoutBorder">
                                            <asp:ListItem Text="20"></asp:ListItem>
                                            <asp:ListItem Text="50"></asp:ListItem>
                                            <asp:ListItem Text="100"></asp:ListItem>
                                        </asp:dropdownlist>
                                    </div>
                                </td>
                                <td>
                                    &nbsp;&nbsp;<asp:label id="Label2" runat="server" resourcekey="perpage"></asp:label></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <div id="drag">
                <asp:datalist id="lstPhotoList" runat="server" repeatcolumns="5" cellpadding="3" width="100%" repeatdirection="Horizontal"
                    cssclass="Normal">
                    <ItemStyle VerticalAlign="middle" />
                    <ItemTemplate>
                        <div class="drag_noncurrent" onmouseover="this.className='drag_current';" onmouseout="this.className='drag_noncurrent';">
                                <div class="quickmenu">
                                    <div class="buttons">
                                        <a href="javascript:void(0);" onclick="quickEdit(<%#Container.ItemIndex%>);" title="quick edit"><img border="0" src="<%=ResolveUrl("images/lightning.png") %>"></a>
                                        <asp:HyperLink ID="lnkEdit" runat="server" ImageUrl="~/DesktopModules/UltraMediaGallery/images/edit2.png" NavigateUrl='<%#EditUrl("PhotoId", Container.DataItem.ItemId, "EditPhoto") %>' Tooltip="edit"></asp:HyperLink>
                                        <asp:ImageButton ID="imgDelete" runat="server" ImageUrl="~/images/delete.gif" Style="cursor: hand"
                                            OnClick="imgDelete_Click" CssClass="<%#Container.DataItem.ItemId%>" Tooltip="delete"  />
                                    </div>
                                    <div align="right">
                                        <asp:Label ID="lblSub" runat="server" />
                                    </div>
                                </div>
                                <div class="thumbnail" id="itemImage<%#Container.ItemIndex%>">
                                    <%#GetThumb(Container.DataItem)%>
                                </div>
                                <div id="hotspot">
                                    <div class="SubSubHead" align="center" id="itemTitle<%#Container.ItemIndex%>">
                                        <%#Container.DataItem.Title%>
                                    </div>
                                    <div class="Normal" align="center">
                                        <%#GetAlbumOwner(DataBinder.Eval(Container.DataItem, "CreatedByUser"))%>
                                        @
                                        <%#Container.DataItem.CreatedDate.ToShortDateString()%>
                                    </div>
                                    <div id="itemId<%#Container.ItemIndex%>" style="display:none;">
                                    <%#Container.DataItem.ItemId%>
                                    </div>
                                    <div id="itemDesc<%#Container.ItemIndex%>" style="display:none;">
                                    <%#Container.DataItem.Description%>
                                    </div>
                                    <div id="itemTag<%#Container.ItemIndex%>" style="display:none;">
                                    <%#Container.DataItem.TagStringForEdit%>
                                    </div>
                                </div>
                            <asp:Label ID="lblPhotoId" runat="server" Text="<%#Container.DataItem.ItemId%>" Visible="false" />
                            <asp:Label ID="lblSortOrder" runat="server" Text="<%#Container.DataItem.SortOrder%>" Visible="false" />
                        </div>
                    </ItemTemplate>
                </asp:datalist>
            </div>
        </td>
    </tr>
    <tr>
        <td align="center">
            <una:numericpagination id="ucNumericPagination" runat="server">
                        </una:numericpagination>
        </td>
    </tr>
</table>
<p class="Script" style="text-align:center;>
	<asp:label id="lblDragNDrop" runat="server" resourcekey="DragNDrop" />
</p>
</div>

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

<%=SortConfirmation %>

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

function saveItem(itemId, title, desc, tag)
{
	var eventArgs = "save|" + itemId + "|" + title + "|" + desc + "|" + tag;
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

