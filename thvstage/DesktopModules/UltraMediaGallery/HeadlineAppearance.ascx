<%@ Control Language="vb" AutoEventWireup="false" Codebehind="HeadlineAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.HeadlineAppearance" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

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
                        <dnn:label id="Label12" runat="server" resourcekey="PauseTime" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkAutoPlay" runat="server" checked="True" resourcekey="DoAutoPlay"></asp:checkbox>
                        <asp:dropdownlist id="cboPauseTime" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem selected="True">5</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                    </asp:dropdownlist>
                                    <asp:label id="Label14" runat="server" resourcekey="Seconds.Text"></asp:label>
                    </td>
                </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plTransition" runat="server" resourcekey="Easing" Suffix=":"></dnn:label></td>
		            <td class="Normal">
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
			            <dnn:label id="plTheme" runat="server" resourcekey="Theme" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboTheme" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem Text="dark"></asp:ListItem>
                                                        <asp:ListItem Text="light"></asp:ListItem>
                                                        <asp:ListItem selected="True" Text="stitch"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="plHeaderWidth" runat="server" resourcekey="HeaderWidth" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboHeaderWidth" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>30</asp:ListItem>
                                        <asp:ListItem>40</asp:ListItem>
                                        <asp:ListItem>45</asp:ListItem>
                                        <asp:ListItem selected="True">48</asp:ListItem>
                                        <asp:ListItem>50</asp:ListItem>
                                        <asp:ListItem>55</asp:ListItem>
                                        <asp:ListItem>60</asp:ListItem>
                                        <asp:ListItem>65</asp:ListItem>
                                        <asp:ListItem>70</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
		            <td class="header">
			            <dnn:label id="plActivateOn" runat="server" resourcekey="ActivateOn" Suffix=":"></dnn:label></td>
		            <td class="Normal">
		                <asp:DropDownList ID="cboActivateOn" runat="server" CssClass="NormalTextBox">
                                                        <asp:ListItem text="hover" value="mouseover"></asp:ListItem>
                                                        <asp:ListItem selected="True" value="click"></asp:ListItem>
                                                    </asp:DropDownList>
		            </td>
	            </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="plPauseOnHover" runat="server" resourcekey="PauseOnHover" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkPauseOnHover" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="plRounded" runat="server" resourcekey="Rounded" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkRounded" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="plEnumerateSlides" runat="server" resourcekey="EnumerateSlides" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkEnumerateSlides" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
                    </td>
                </tr>
            </table>


        </td>
    </tr>
</table>
</div>

<p style="text-align:center;">
    <asp:Button ID="btnSave" runat="server" resourcekey="cmdUpdate" CssClass="CommandButton" />
    <asp:Button ID="btnCancel" runat="server" resourcekey="cmdCancel" CssClass="CommandButton" />
</p>
