<%@ Control Language="vb" AutoEventWireup="false" Codebehind="SimpleSliderAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.SimpleSliderAppearance" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucColorPicker" Src="ucColorPicker.ascx" %>
<div class="UMGSection">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="SectionHeader Head">
            <asp:label id="Label1" runat="server" resourcekey="Preview" Suffix=":"></asp:label>
        </td>
    </tr>
    <tr>
        <td>
            <img src='<%=ResolveUrl("css/slidermaster/preview.jpg") %>' alt='preview' />
        </td>
    </tr>
    <tr>
        <td class="SectionHeader Head">
            <asp:label id="Label2" runat="server" resourcekey="AppearanceSettings" Suffix=":"></asp:label>
        </td>
    </tr>
    <tr>
        <td style="padding:5px;">
        
        


            <table width="100%" class="Normal">
                <tr>
                    <td class="header">
                        <dnn:label id="Label4" runat="server" resourcekey="Max_Slides" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboMaxSlides" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem Value="0"></asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem selected="True">20</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                        <asp:ListItem>30</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                <td class="header">
                        <dnn:label id="lblSortOrder" runat="server" resourcekey="SortOrder" Suffix=":"></dnn:label>
                    </td>
                    <td>
                    <asp:dropdownlist id="cboChooseSlides" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem Value="Predefined"></asp:ListItem>
                                        <asp:ListItem Value="Random"></asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                    </tr>
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
                        <dnn:label id="Label16" runat="server" resourcekey="DirectionNav" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:label id="Label18" runat="server" resourcekey="Style"></asp:label>
                        <asp:dropdownlist id="cboDirectionNav" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>none</asp:ListItem>
                                        <asp:ListItem>standard</asp:ListItem>
                                        <asp:ListItem>orman</asp:ListItem>
                                        <asp:ListItem>text</asp:ListItem>
                                        <asp:ListItem>wds</asp:ListItem>
                                        <asp:ListItem selected="true">darkknight</asp:ListItem>
                                    </asp:dropdownlist>
                        <asp:label id="Label19" runat="server" resourcekey="Visibility"></asp:label>
                        <asp:dropdownlist id="cboDirectionNavHide" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem value="always"></asp:ListItem>
                                        <asp:ListItem value="hide"></asp:ListItem>
                                        <asp:ListItem value="fade"></asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label17" runat="server" resourcekey="QuickNav" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:label id="Label20" runat="server" resourcekey="Style"></asp:label>
                        <asp:dropdownlist id="cboQuickNav" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>none</asp:ListItem>
                                        <asp:ListItem>standard</asp:ListItem>
                                        <asp:ListItem>squres</asp:ListItem>
                                        <asp:ListItem>pascal</asp:ListItem>
                                        <asp:ListItem selected="true">darkknight</asp:ListItem>
                                        <asp:ListItem>greenbullets</asp:ListItem>
                                        <asp:ListItem>numbers bottom</asp:ListItem>
                                        <asp:ListItem>numbers bottomoutside</asp:ListItem>
                                        <asp:ListItem>numbers bottomleft</asp:ListItem>
                                        <asp:ListItem>numbers bottomright</asp:ListItem>
                                        <asp:ListItem>numbersdark bottom</asp:ListItem>
                                        <asp:ListItem>numbersdark bottomoutside</asp:ListItem>
                                        <asp:ListItem>numbersdark bottomleft</asp:ListItem>
                                        <asp:ListItem>numbersdark bottomright</asp:ListItem>
                                    </asp:dropdownlist>
                        <asp:label id="Label21" runat="server" resourcekey="Visibility"></asp:label>
                        <asp:dropdownlist id="cboQuickNavHide" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem value="always"></asp:ListItem>
                                        <asp:ListItem value="hide"></asp:ListItem>
                                        <asp:ListItem value="fade"></asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label22" runat="server" resourcekey="CountDown" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboCountDown" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>none</asp:ListItem>
                                        <asp:ListItem>hrz-bar top</asp:ListItem>
                                        <asp:ListItem>hrz-bar bottom</asp:ListItem>
                                        <asp:ListItem>vtc-bar left</asp:ListItem>
                                        <asp:ListItem>vtc-bar right</asp:ListItem>
                                        <asp:ListItem>hrz-mini topleft</asp:ListItem>
                                        <asp:ListItem>hrz-mini topright</asp:ListItem>
                                        <asp:ListItem>hrz-mini bottomleft</asp:ListItem>
                                        <asp:ListItem>hrz-mini bottomright</asp:ListItem>
                                        <asp:ListItem>nmr-standard topleft</asp:ListItem>
                                        <asp:ListItem>nmr-standard topright</asp:ListItem>
                                        <asp:ListItem>nmr-standard bottomleft</asp:ListItem>
                                        <asp:ListItem>nmr-standard bottomright</asp:ListItem>
                                        <asp:ListItem>bgd-card topleft</asp:ListItem>
                                        <asp:ListItem>bgd-card topright</asp:ListItem>
                                        <asp:ListItem>bgd-card bottomleft</asp:ListItem>
                                        <asp:ListItem>bgd-card bottomright</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label23" runat="server" resourcekey="Frame" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboFrame" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>none</asp:ListItem>
                                        <asp:ListItem>whiteshadow</asp:ListItem>
                                        <asp:ListItem>bright</asp:ListItem>
                                        <asp:ListItem>dark</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label24" runat="server" resourcekey="Caption" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboCaption" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>none</asp:ListItem>
                                        <asp:ListItem>desconly top</asp:ListItem>
                                        <asp:ListItem>desconly bottom</asp:ListItem>
                                        <asp:ListItem>floated topleft</asp:ListItem>
                                        <asp:ListItem>floated topright</asp:ListItem>
                                        <asp:ListItem>floated bottomleft</asp:ListItem>
                                        <asp:ListItem>floated bottomright</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label25" runat="server" resourcekey="ControlBar" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboControlBar" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>none</asp:ListItem>
                                        <asp:ListItem>standard topleft</asp:ListItem>
                                        <asp:ListItem>standard topright</asp:ListItem>
                                        <asp:ListItem>standard bottomleft</asp:ListItem>
                                        <asp:ListItem>standard bottomright</asp:ListItem>
                                        <asp:ListItem>threesqures topleft</asp:ListItem>
                                        <asp:ListItem>threesqures topright</asp:ListItem>
                                        <asp:ListItem>threesqures bottomleft</asp:ListItem>
                                        <asp:ListItem>threesqures bottomright</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label26" runat="server" resourcekey="Overlay" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboOverlay" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem>none</asp:ListItem>
                                        <asp:ListItem>whatishot topleft</asp:ListItem>
                                        <asp:ListItem>whatishot topright</asp:ListItem>
                                        <asp:ListItem>featured topleft</asp:ListItem>
                                        <asp:ListItem>featured topright</asp:ListItem>
                                        <asp:ListItem>new topleft</asp:ListItem>
                                        <asp:ListItem>new topright</asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>






    <tr>
        <td class="header">
            <dnn:label id="Label10" runat="server" resourcekey="Effect"></dnn:label>
        </td>
        <td>
            <asp:dropdownlist id="cboEffect" runat="server" cssclass="NormalTextBox">
                            <asp:ListItem>random</asp:ListItem>
                            <asp:ListItem>fold</asp:ListItem>
                            <asp:ListItem>fade</asp:ListItem>
                            <asp:ListItem>sliceDownRight</asp:ListItem>
                            <asp:ListItem>sliceDownLeft</asp:ListItem>
                            <asp:ListItem>sliceUpRight</asp:ListItem>
                            <asp:ListItem>sliceUpLeft</asp:ListItem>
                            <asp:ListItem>sliceUpDown</asp:ListItem>
                            <asp:ListItem>sliceUpDownLeft</asp:ListItem>
                            <asp:ListItem>boxRandom</asp:ListItem>
                            <asp:ListItem>boxRain</asp:ListItem>
                            <asp:ListItem>boxRainReverse</asp:ListItem>
                            <asp:ListItem>boxRainGrow</asp:ListItem>
                            <asp:ListItem>boxRainGrowReverse</asp:ListItem>
                        </asp:dropdownlist>
        </td>
    </tr>
    <tr>
        <td class="header">
            <dnn:label id="Label11" runat="server" resourcekey="AnimSpeed"></dnn:label>
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
            <dnn:label id="Label27" runat="server" resourcekey="MediaControlBar" Suffix=":"></dnn:label>
        </td>
        <td>
            <asp:checkbox id="chkShowMediaControlBar" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
        </td>
    </tr>
    <tr>
        <td class="header">
            <dnn:label id="Label28" runat="server" resourcekey="VideoAutoStart" Suffix=":"></dnn:label>
        </td>
        <td>
            <asp:checkbox id="chkVideoAutoStart" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
        </td>
    </tr>
    <tr>
        <td class="header">
            <dnn:label id="Label29" runat="server" resourcekey="PauseOnHover" Suffix=":"></dnn:label>
        </td>
        <td>
            <asp:checkbox id="chkPauseOnHover" runat="server" checked="True" resourcekey="Yes"></asp:checkbox>
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
