<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Exif.aspx.vb" Inherits="BizModules.UltraPhotoGallery.Exif" %>

<html>
<head>
    <title>Exif Information </title>
    <link href='<% =ResolveUrl("~/Portals/_default/default.css")%>' type="text/css" rel="stylesheet">
    <link href='<% =PortalSettings.HomeDirectory + "portal.css"%>' type="text/css" rel="stylesheet">
</head>
<body>
    <form id="Form1" runat="server">
        <table id="Table1" cellspacing="0" cellpadding="2" border="0" align="center">
            <tr>
                <td valign="top" width="300">
                    <table id="tblBasic" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                        <tr>
                            <td class="Head" colspan="2">
                                Basic Information
                                <hr size="1">
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label1" runat="server" resourcekey='Creator'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblCreator" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label2" runat="server" resourcekey='CreatedDate'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblCreatedDate" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label3" runat="server" resourcekey='Title'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblTitle" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead" valign="top">
                                <asp:label id="Label4" runat="server" resourcekey='Description'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblDescription" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                    </table>
                    <table id="tblExif" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                        <tr>
                            <td class="Head" colspan="2">
                                Exif Meta Data
                                <hr size="1">
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label5" runat="server" resourcekey='Make'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifMake" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label6" runat="server" resourcekey='Model'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifModel" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label7" runat="server" resourcekey='Orientation'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifOrientation" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label8" runat="server" resourcekey='XResolution'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifXResolution" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label9" runat="server" resourcekey='YResolution'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifYResolution" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label10" runat="server" resourcekey='ResolutionUnit'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifResolutionUnit" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label12" runat="server" resourcekey='ExposureTime'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifExposureTime" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label13" runat="server" resourcekey='FNumber'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifFNumber" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label14" runat="server" resourcekey='ExposureProgram'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifExposureProgram" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label15" runat="server" resourcekey='ExifVersion'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifExifVersion" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label17" runat="server" resourcekey='DateTimeDigitized'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifDateTimeDigitized" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label19" runat="server" resourcekey='ShutterSpeedValue'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifShutterSpeedValue" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label20" runat="server" resourcekey='ApertureValue'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifApertureValue" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label22" runat="server" resourcekey='MaxApertureValue'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifMaxApertureValue" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label24" runat="server" resourcekey='Flash'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifFlash" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label25" runat="server" resourcekey='FocalLength'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifFocalLength" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label28" runat="server" resourcekey='ExifImageWidth'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifExifImageWidth" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label29" runat="server" resourcekey='ExifImageHeight'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifExifImageHeight" runat="server"></asp:label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SubHead">
                                <asp:label id="Label35" runat="server" resourcekey='ExposureMode'></asp:label>
                                :</td>
                            <td class="Normal">
                                <asp:label id="lblExifExposureMode" runat="server"></asp:label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td align="center" valign="top">
                    <asp:image id="imgLarge" runat="server" borderwidth="1px" bordercolor="Black"></asp:image>
                    <p>
                        <input type="button" onclick="window.close();" value='Close'>
                    </p>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
