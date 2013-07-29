<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TonicGalleryAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.TonicGalleryAppearance" %>
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
                    <td>
                        <dnn:Label ID="Label1" runat="server" resourcekey="ItemsPerPage" Suffix=":"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtItemsPerPage" runat="server" CssClass="Normal" width="50"></asp:TextBox>
		                <asp:RegularExpressionValidator ID="rev3" runat="server" ErrorMessage="*" ControlToValidate="txtItemsPerPage"
                                                ValidationExpression="\d*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:Label ID="Label3" runat="server" resourcekey="Easing" Suffix=":"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="cboEasing" runat="server" CssClass="Normal">
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
                    <td class="header">
                        <dnn:label id="Label4" runat="server" resourcekey="AnimSpeed" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboAnimSpeed" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>100</asp:ListItem>
                                        <asp:ListItem>200</asp:ListItem>
                                        <asp:ListItem>300</asp:ListItem>
                                        <asp:ListItem selected="True">500</asp:ListItem>
                                        <asp:ListItem>750</asp:ListItem>
                                        <asp:ListItem>1000</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label5" runat="server" resourcekey="WavyAnimation" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkWavyAnimation" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label6" runat="server" resourcekey="SocialTools" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkSocialTools" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label7" runat="server" resourcekey="prettyPhotoTheme" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboprettyPhotoTheme" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem value="pp_default">default</asp:ListItem>
                                        <asp:ListItem>light_rounded</asp:ListItem>
                                        <asp:ListItem>dark_rounded</asp:ListItem>
                                        <asp:ListItem>light_square</asp:ListItem>
                                        <asp:ListItem>dark_square</asp:ListItem>
                                        <asp:ListItem>facebook</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label8" runat="server" resourcekey="prettyPhotoWmode" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboprettyPhotoWmode" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem selected="true">window</asp:ListItem>
                                        <asp:ListItem>opaque</asp:ListItem>
                                        <asp:ListItem>transparent</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
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

<script type="text/javascript">
jQuery(document).ready(function(){
});
</script>