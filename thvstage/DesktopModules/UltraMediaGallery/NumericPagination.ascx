<%@ Control Language="vb" AutoEventWireup="false" Codebehind="NumericPagination.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.NumericPagination" %>
            <table cellspacing="2" cellpadding="2" border="0" class="Pager">
                <tr>
                    <td class="Normal">
                        <asp:LinkButton ID="lnkPreviousPage" runat="server"><%=Localize("Previous")%></asp:LinkButton>
                    </td>
                    <td class="Normal">
                        <asp:Label ID="lblIgnore1" runat="server" Visible="false" Text="..."></asp:Label></td>
                    <td>
                        <asp:DataList ID="lstPages" runat="server" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="Normal"
                            RepeatDirection="Horizontal" ItemStyle-Width="20" CssClass="Pager">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkPage" runat="server" OnClick="lnkPage_Click" Text='<%#Container.DataItem + 1%>'>
                                </asp:LinkButton>
                                <asp:Label ID="lblPage" runat="server" Visible="false" Text='<%#Container.DataItem + 1%>'
                                    CssClass="PagerDisabled"></asp:Label>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                    <td class="Normal">
                        <asp:Label ID="lblIgnore2" runat="server" Visible="false" Text="..."></asp:Label>
                    </td>
                    <td class="Normal">
                        <asp:LinkButton ID="lnkNextPage" runat="server"><%=Localize("Next")%></asp:LinkButton></td>
                </tr>
            </table>
