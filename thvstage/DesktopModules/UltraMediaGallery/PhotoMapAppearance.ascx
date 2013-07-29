<%@ Control Language="vb" AutoEventWireup="false" Codebehind="PhotoMapAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.PhotoMapAppearance" %>
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
                        <dnn:label id="lblMapType" runat="server" resourcekey="MapType" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboMapType" runat="server" cssclass="NormalTextBox">
                                        <asp:ListItem selected="True" value="roadmap"></asp:ListItem>
                                        <asp:ListItem value="satellite"></asp:ListItem>
                                        <asp:ListItem value="hybrid"></asp:ListItem>
                                        <asp:ListItem value="terrain"></asp:ListItem>
                                    </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblGalleryName" runat="server" resourcekey="GalleryName" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:textbox id="txtGalleryName" runat="server" cssclass="NormalTextBox" Width="300px"></asp:textbox>
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
