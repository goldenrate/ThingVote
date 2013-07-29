<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TagGroupedGridAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.TagGroupedGridAppearance" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

     <div class="UMGSection">
        <asp:Label ID="Label1" runat="server" resourcekey="GeneralOptions" CssClass="SectionHeader Head block"></asp:Label>
            <table cellpadding="3" width="100%">
                <tr>
                    <td class="SubSubHead" width="160">
                        <dnn:Label ID="Label8" runat="server" resourcekey="DefaultSort"></dnn:Label></td>
                    <td>
                        <asp:DropDownList ID="lstTypes" runat="server" CssClass="lstTypes Normal">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="SubSubHead">
                        <dnn:Label ID="plAllSortOptions" runat="server" resourcekey="AllSortOptions"></dnn:Label></td>
                    <td>
                        <asp:CheckBox ID="chkShowSortPicker" runat="server" resourcekey="Yes" Checked="true" />
                    </td>
                </tr>
                <tr>
                    <td class="SubSubHead">
                        <dnn:Label ID="plDefaultView" runat="server" resourcekey="DefaultView">
                        </dnn:Label></td>
                    <td class="Normal">
                        <asp:RadioButton GroupName="DefaultView" ID="chkDefaultGridView" runat="server" CssClass="Normal" resourcekey="GridView" Checked="true" />
                        <asp:RadioButton GroupName="DefaultView" ID="chkDefaultListView" runat="server" CssClass="Normal" resourcekey="ListView" />
                        
                    </td>
                </tr>
                <tr>
                    <td class="SubSubHead">
                        <dnn:Label ID="plViewSwitch" runat="server" resourcekey="ViewSwitch">
                        </dnn:Label></td>
                    <td class="Normal">
                        <asp:CheckBox ID="chkShowGridListView" runat="server" resourcekey="Yes" Checked="true" />
                    </td>
                </tr>
                <tr>
                    <td class="SubSubHead">
                        <dnn:Label ID="plGridViewPageSize" runat="server" resourcekey="GridViewPageSize">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="cboRows" runat="server" CssClass="Normal">
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem Selected="True">5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        </asp:DropDownList> x  
                        <asp:DropDownList ID="cboColumns" runat="server" CssClass="Normal">
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem Selected="True">4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="SubSubHead">
                        <dnn:Label ID="plListViewPageSize" runat="server" resourcekey="ListViewPageSize">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="cboPageSize" runat="server" CssClass="Normal">
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem Selected="True">10</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>40</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="SubSubHead">
                        <dnn:Label ID="plMultiSelection" runat="server" resourcekey="MultiSelection"></dnn:Label></td>
                    <td>
                        <asp:CheckBox ID="chkMultiSelection" runat="server" resourcekey="Yes" Checked="true" />
                    </td>
                </tr>
                <tr>
                    <td class="SubSubHead">
                        <dnn:Label ID="plNoOfTags" runat="server" resourcekey="NoOfTags">
                        </dnn:Label></td>
                    <td>
                        <asp:DropDownList ID="cboNoOfTags" runat="server" CssClass="Normal">
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>35</asp:ListItem>
                        <asp:ListItem>40</asp:ListItem>
                        <asp:ListItem>45</asp:ListItem>
                        <asp:ListItem Selected="True">50</asp:ListItem>
                        <asp:ListItem>60</asp:ListItem>
                        <asp:ListItem>70</asp:ListItem>
                        <asp:ListItem>80</asp:ListItem>
                        <asp:ListItem>90</asp:ListItem>
                        <asp:ListItem>100</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="SubSubHead">
                        <dnn:Label ID="plSocialOptions" runat="server" resourcekey="SocialOptions">
                        </dnn:Label></td>
                    <td>
                        <asp:CheckBox ID="chkDownload" runat="server" Text="Download" />
                        <asp:CheckBox ID="chkFacebook" runat="server" Text="Facebook" />
                        <asp:CheckBox ID="chkTwitter" runat="server" Text="Twitter" />
                        <asp:CheckBox ID="chkLinkedIn" runat="server" Text="LinkedIn" />
                        <asp:CheckBox ID="chkGooglePlus" runat="server" Text="Google +" />
                        <asp:CheckBox ID="chkEmail" runat="server" Text="Email" />
                        <asp:CheckBox ID="chkPinterest" runat="server" Text="Pinterest" />
                        <asp:CheckBox ID="chkThumbUp" runat="server" resourcekey="ThumbUp" />
                    </td>
                </tr>
            </table>
     </div>

     <div class="UMGSection">
        <asp:Label ID="Label2" runat="server" resourcekey="DisplayTemplates" CssClass="SectionHeader Head block"></asp:Label>
            <table cellpadding="3" width="100%">
                <tr>
                    <td class="SubSubHead" width="160">
                        <dnn:Label ID="Label3" runat="server" resourcekey="GridViewTemplate"></dnn:Label>
                    </td>
                    <td class="Normal">
                        <asp:TextBox ID="txtGridViewTemplate" runat="server" Rows="5" TextMode="MultiLine" Width="500"
                            CssClass="NormalTextBox expandable">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubSubHead">
                        <dnn:Label ID="Label4" runat="server" resourcekey="ListViewTemplate"></dnn:Label>
                    </td>
                    <td class="Normal">
                        <asp:TextBox ID="txtListViewTemplate" runat="server" Rows="5" TextMode="MultiLine" Width="500"
                            CssClass="NormalTextBox expandable">
                        </asp:TextBox>
                    </td>
                </tr>
            </table>
     </div>
            
<p>
    <asp:Button ID="cmdUpdate" runat="server" resourcekey="cmdUpdate" CssClass="CommandButton" />      
    <asp:Button ID="cmdCancel" runat="server" resourcekey="cmdCancel" CssClass="CommandButton" />      
</p>
