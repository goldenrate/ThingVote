<%@ Control Language="vb" AutoEventWireup="false" Codebehind="WidescreenTour1Appearance.ascx.vb" Inherits="BizModules.UltraPhotoGallery.WidescreenTour1Appearance" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucColorPicker" Src="ucColorPicker.ascx" %>
<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            <%=PreferedPresentation(UserId).Name %>
        </td>
    </tr>
    <tr>
        <td style="padding:5px;">


            <table width="100%" class="Normal">
                <tr>
                    <td class="header">
                        <dnn:Label ID="plbackgroundColor" runat="server" resourcekey="backgroundColor" Suffix=":"></dnn:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="backgroundColor" runat="server">
                        </uc1:uccolorpicker></td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="Label1" runat="server" resourcekey="lightboxBackground" Suffix=":"></dnn:Label></td>
                    <td class="Normal">
                        <uc1:uccolorpicker id="lightboxBackground" runat="server">
                        </uc1:uccolorpicker></td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="Label20" runat="server" resourcekey="easing" Suffix=":"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="easing" runat="server" CssClass="Normal">
                            <asp:ListItem Text="Default(swing)" Value="swing"></asp:ListItem>
                            <asp:ListItem Value="linear"></asp:ListItem>
                            <asp:ListItem Text="InQuad" Value="easeInQuad"></asp:ListItem>
                            <asp:ListItem Text="OutQuad" Value="easeOutQuad"></asp:ListItem>
                            <asp:ListItem Text="InOutQuad" Value="easeInOutQuad"></asp:ListItem>
                            <asp:ListItem Text="InCubic" Value="easeInCubic"></asp:ListItem>
                            <asp:ListItem Text="OutCubic" Value="easeOutCubic"></asp:ListItem>
                            <asp:ListItem Text="InOutCubic" Value="easeInOutCubic"></asp:ListItem>
                            <asp:ListItem Text="InQuart" Value="easeInQuart"></asp:ListItem>
                            <asp:ListItem Text="OutQuart" Value="easeOutQuart"></asp:ListItem>
                            <asp:ListItem Text="InOutQuart" Value="easeInOutQuart"></asp:ListItem>
                            <asp:ListItem Text="InQuint" Value="easeInQuint"></asp:ListItem>
                            <asp:ListItem Text="OutQuint" Value="easeOutQuint"></asp:ListItem>
                            <asp:ListItem Text="InOutQuint" Value="easeInOutQuint"></asp:ListItem>
                            <asp:ListItem Text="InSine" Value="easeInSine"></asp:ListItem>
                            <asp:ListItem Text="OutSine" Value="easeOutSine"></asp:ListItem>
                            <asp:ListItem Text="InOutSine" Value="easeInOutSine"></asp:ListItem>
                            <asp:ListItem Text="InExpo" Value="easeInExpo"></asp:ListItem>
                            <asp:ListItem Text="OutExpo" Value="easeOutExpo"></asp:ListItem>
                            <asp:ListItem Text="InOutExpo" Value="easeInOutExpo"></asp:ListItem>
                            <asp:ListItem Text="InCirc" Value="easeInCirc"></asp:ListItem>
                            <asp:ListItem Text="OutCirc" Value="easeOutCirc"></asp:ListItem>
                            <asp:ListItem Text="InOutCirc" Value="easeInOutCirc"></asp:ListItem>
                            <asp:ListItem Text="InElastic" Value="easeInElastic"></asp:ListItem>
                            <asp:ListItem Text="OutElastic" Value="easeOutElastic"></asp:ListItem>
                            <asp:ListItem Text="InOutElastic" Value="easeInOutElastic"></asp:ListItem>
                            <asp:ListItem Text="InBack" Value="easeInBack"></asp:ListItem>
                            <asp:ListItem Text="OutBack" Value="easeOutBack"></asp:ListItem>
                            <asp:ListItem Text="InOutBack" Value="easeInOutBack"></asp:ListItem>
                            <asp:ListItem Text="InBounce" Value="easeInBounce"></asp:ListItem>
                            <asp:ListItem Text="OutBounce" Value="easeOutBounce"></asp:ListItem>
                            <asp:ListItem Text="InOutBounce" Value="easeInOutBounce"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plAnimSpeed" runat="server" resourcekey="animSpeed" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="animSpeed" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>100</asp:ListItem>
                                        <asp:ListItem>200</asp:ListItem>
                                        <asp:ListItem>300</asp:ListItem>
                                        <asp:ListItem>400</asp:ListItem>
                                        <asp:ListItem>500</asp:ListItem>
                                        <asp:ListItem selected="True">600</asp:ListItem>
                                        <asp:ListItem>700</asp:ListItem>
                                        <asp:ListItem>800</asp:ListItem>
                                        <asp:ListItem>1000</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label id="plGridSize" runat="server" resourcekey="gridSize" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="rows" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem selected="True">1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                    </asp:dropdownlist> *
                        <asp:dropdownlist id="columns" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem selected="True">5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="Label4" runat="server" resourcekey="randomicity" Suffix=":"></dnn:Label></td>
                    <td class="Normal">
                        <asp:DropDownList ID="randomicity" runat="server" CssClass="Normal">
                            <asp:ListItem Value="0"></asp:ListItem>
                            <asp:ListItem Value="10"></asp:ListItem>
                            <asp:ListItem Value="20"></asp:ListItem>
                            <asp:ListItem Value="30"></asp:ListItem>
                            <asp:ListItem Value="40"></asp:ListItem>
                            <asp:ListItem Value="50"></asp:ListItem>
                            <asp:ListItem Value="60"></asp:ListItem>
                            <asp:ListItem Value="70"></asp:ListItem>
                            <asp:ListItem Value="80"></asp:ListItem>
                            <asp:ListItem Value="90"></asp:ListItem>
                            <asp:ListItem Value="100"></asp:ListItem>
                            <asp:ListItem Value="120"></asp:ListItem>
                            <asp:ListItem Value="150"></asp:ListItem>
                            <asp:ListItem Value="200"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="Label5" runat="server" resourcekey="videoPlayerSize" Suffix=":"></dnn:Label></td>
                    <td class="Normal">
                        <asp:DropDownList ID="videoPlayerWidth" runat="server" CssClass="Normal">
                            <asp:ListItem Value="120"></asp:ListItem>
                            <asp:ListItem Value="140"></asp:ListItem>
                            <asp:ListItem Value="160" selected="True"></asp:ListItem>
                            <asp:ListItem Value="180"></asp:ListItem>
                            <asp:ListItem Value="220"></asp:ListItem>
                            <asp:ListItem Value="240"></asp:ListItem>
                            <asp:ListItem Value="260"></asp:ListItem>
                            <asp:ListItem Value="280"></asp:ListItem>
                            <asp:ListItem Value="300"></asp:ListItem>
                            <asp:ListItem Value="320"></asp:ListItem>
                            <asp:ListItem Value="340"></asp:ListItem>
                            <asp:ListItem Value="360"></asp:ListItem>
                            <asp:ListItem Value="380"></asp:ListItem>
                            <asp:ListItem Value="400"></asp:ListItem>
                        </asp:DropDownList> *
                        <asp:DropDownList ID="videoPlayerHeight" runat="server" CssClass="Normal">
                            <asp:ListItem Value="100"></asp:ListItem>
                            <asp:ListItem Value="120" selected="True"></asp:ListItem>
                            <asp:ListItem Value="140"></asp:ListItem>
                            <asp:ListItem Value="160"></asp:ListItem>
                            <asp:ListItem Value="180"></asp:ListItem>
                            <asp:ListItem Value="220"></asp:ListItem>
                            <asp:ListItem Value="240"></asp:ListItem>
                            <asp:ListItem Value="260"></asp:ListItem>
                            <asp:ListItem Value="280"></asp:ListItem>
                            <asp:ListItem Value="300"></asp:ListItem>
                        </asp:DropDownList>
                        </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="Label2" runat="server" resourcekey="infoWidth" Suffix=":"></dnn:Label></td>
                    <td class="Normal">
                        <asp:DropDownList ID="infoWidth" runat="server" CssClass="Normal">
                            <asp:ListItem Value="100"></asp:ListItem>
                            <asp:ListItem Value="120"></asp:ListItem>
                            <asp:ListItem Value="150"></asp:ListItem>
                            <asp:ListItem Value="160"></asp:ListItem>
                            <asp:ListItem Value="170"></asp:ListItem>
                            <asp:ListItem Value="180" selected="True"></asp:ListItem>
                            <asp:ListItem Value="190"></asp:ListItem>
                            <asp:ListItem Value="200"></asp:ListItem>
                            <asp:ListItem Value="210"></asp:ListItem>
                            <asp:ListItem Value="220"></asp:ListItem>
                            <asp:ListItem Value="250"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                <td></td>
                    <td class="Normal">
                        <asp:CheckBox ID="autoPlayVideo" runat="server" resourcekey="autoPlayVideo">
                        </asp:CheckBox></td>
                </tr>
                <tr>
                <td></td>
                    <td class="Normal">
                        <asp:CheckBox ID="showVideoControls" runat="server" resourcekey="showVideoControls">
                        </asp:CheckBox></td>
                </tr>
                <tr>
                <td></td>
                    <td class="Normal">
                        <asp:CheckBox ID="openLinkInNewWindow" runat="server" resourcekey="openLinkInNewWindow">
                        </asp:CheckBox></td>
                </tr>
            </table>
            
            
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:Button ID="btnSave" runat="server" resourcekey="cmdUpdate" CssClass="CommandButton" />
            <asp:Button ID="btnCancel" runat="server" resourcekey="cmdCancel" CssClass="CommandButton" /></td>
    </tr>
</table>
</div>

