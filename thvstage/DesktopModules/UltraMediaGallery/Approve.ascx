<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Approve.ascx.vb" Inherits="BizModules.UltraPhotoGallery.Approve" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<%@ Register TagPrefix="UNA" TagName="NumericPagination" Src="NumericPagination.ascx" %>

<UPG:Header ID="ctlHeader" runat="server" />

<link rel="stylesheet" type="text/css" href="<%=ResolveUrl("css/DragStyle.css") %>" media="screen" />
<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader">
            <table class="Normal" width="100%" style="height: 30px;">
                <tr>
                    <td>
                    <asp:Button ID="btnApprove" runat="server" resourcekey="Approve" CssClass="CommandButton" />
                    <asp:Button ID="btnReject" runat="server" resourcekey="Reject" CssClass="CommandButton" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtApplyDrag" runat="server" Style="display: none;" />
                    </td>
                    <td align="right">
                        <table cellpadding="0" cellspacing="0" class="Normal">
                            <tr>
                                <td>
                                    Show&nbsp;</td>
                                <td>
                                    <div class="ComboWithoutBorderOuter">
                                        <asp:DropDownList ID="cboPageSize" runat="server" AutoPostBack="true" CssClass="NormalTextBox ComboWithoutBorder">
                                            <asp:ListItem Text="20"></asp:ListItem>
                                            <asp:ListItem Text="50"></asp:ListItem>
                                            <asp:ListItem Text="100"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </td>
                                <td>
                                    &nbsp;per page</td>
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
                <asp:DataList ID="lstPhotoList" runat="server" RepeatColumns="5" cellpadding="3" Width="100%" RepeatDirection="Horizontal" CssClass="Normal">
                    <ItemStyle VerticalAlign="middle" />
                    <ItemTemplate>
                        <div class="drag_noncurrent" onmouseover="this.className='drag_current';" onmouseout="this.className='drag_noncurrent';">
                                <div class="quickmenu">
                                    <div class="buttons" style="float:left;">
                                        <asp:ImageButton ID="imgApprove" runat="server" ImageUrl="images/correct.png" Style="cursor: hand"
                                            OnClick="imgDelete_Click" CssClass="<%#Container.DataItem.ItemId%>" Tooltip="approve" />
                                        <asp:ImageButton ID="imgDelete" runat="server" ImageUrl="~/images/delete.gif" Style="cursor: hand"
                                            OnClick="imgDelete_Click" CssClass="<%#Container.DataItem.ItemId%>" Tooltip="delete" />
                                    </div>
                                    <div align="right">
                                        <asp:CheckBox ID="chkSelection" runat="server" />
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
                                        <br />
                                        <%#Container.DataItem.TakenDate.ToShortDateString()%> / <%#Container.DataItem.CreatedDate.ToShortDateString()%>
                                    </div>
                                </div>
                            <asp:Label ID="lblPhotoId" runat="server" Text="<%#Container.DataItem.ItemId%>" Visible="false" />
                            <asp:Label ID="lblSortOrder" runat="server" Text="<%#Container.DataItem.SortOrder%>" Visible="false" />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </td>
    </tr>
    <tr><td align="center">
    <UNA:NumericPagination ID="ucNumericPagination" runat="server">
                        </UNA:NumericPagination>
    </td></tr>
</table>
</div>
