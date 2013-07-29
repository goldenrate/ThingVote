<%@ Control Language="vb" AutoEventWireup="false" Codebehind="ModuleSettings.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.ModuleSettings" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="uc1" TagName="RolePicker" Src="ucRolePicker.ascx" %>
<%@ Register TagPrefix="UPG" TagName="Header" Src="ucHeader.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<upg:header id="ctlHeader" runat="server" />
<div id="tabs" style="width: 825px;">
    <ul>
        <li>
            <a href="#tab1">
                <asp:label id="lblBasic" runat="server" resourcekey="Basic"></asp:label>
            </a>
        </li>
        <li>
            <a href="#tab2">
                <asp:label id="lblPresentation" runat="server" resourcekey="Presentation"></asp:label>
            </a>
        </li>
        <li>
            <a href="#tab3">
                <asp:label id="lblIntegration" runat="server" resourcekey="Integration"></asp:label>
            </a>
        </li>
        <li>
            <a href="#tab4">
                <asp:label id="lblAdvanced" runat="server" resourcekey="Advanced"></asp:label>
            </a>
        </li>
    </ul>
        <div class="container">
                <table cellpadding="0" cellspacing="0" width="100%" class="Normal">
		        <tr>
                    <td class="header">
                        <dnn:label id="Label42" runat="server" resourcekey="DefaultUpload" suffix=":">
                                        </dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboDefaultUpload" runat="server" cssclass="NormalTextBox">
                                    <asp:ListItem Value="FlashUpload"></asp:ListItem>
                                    <asp:ListItem Value="HtmlUpload"></asp:ListItem>
                                    <asp:ListItem Value="Import"></asp:ListItem>
                                    <asp:ListItem Value="FromUrl"></asp:ListItem>
                                    <asp:ListItem Value="FromHtml"></asp:ListItem>
                                    <asp:ListItem Value="Copy"></asp:ListItem>
                                    <asp:ListItem Value="Html5Upload"></asp:ListItem>
                                </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label3" runat="server" resourcekey="AlbumLogoSize" suffix=":">
                                        </dnn:label>
                    </td>
                    <td class="Normal">
                        <asp:textbox id="txtAlbumLogoWidth" runat="server" width="35px" cssclass="NormalTextBox"></asp:textbox>
                        px<asp:regularexpressionvalidator id="Regularexpressionvalidator4" runat="server"
                            controltovalidate="txtAlbumLogoWidth" errormessage="*" validationexpression="\d*"></asp:regularexpressionvalidator>
                        X&nbsp;
                        <asp:textbox id="txtAlbumLogoHeight" runat="server" width="35px" cssclass="NormalTextBox"></asp:textbox>
                        px<asp:regularexpressionvalidator id="Regularexpressionvalidator5" runat="server"
                            controltovalidate="txtAlbumLogoHeight" errormessage="*" validationexpression="\d*"></asp:regularexpressionvalidator>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label4" runat="server" resourcekey="SortingMethod" suffix=":">
                                        </dnn:label>
                    </td>
                    <td class="Normal">
                        <asp:dropdownlist id="cboFirstSortingField" runat="server" cssclass="NormalTextBox">
                            <asp:ListItem Value="FileName"></asp:ListItem>
                            <asp:ListItem Value="Numeric"></asp:ListItem>
                            <asp:ListItem Value="CreatedDate"></asp:ListItem>
                            <asp:ListItem Value="TakenDate"></asp:ListItem>
                            <asp:ListItem Value="Title"></asp:ListItem>
                            <asp:ListItem Value="Description"></asp:ListItem>
                        </asp:dropdownlist>
                        +
                        <asp:dropdownlist id="cboSecondSortingField" runat="server" cssclass="NormalTextBox">
                            <asp:ListItem Value="Disabled"></asp:ListItem>
                            <asp:ListItem Value="FileName"></asp:ListItem>
                            <asp:ListItem Value="Numeric"></asp:ListItem>
                            <asp:ListItem Value="CreatedDate"></asp:ListItem>
                            <asp:ListItem Value="TakenDate"></asp:ListItem>
                            <asp:ListItem Value="Title"></asp:ListItem>
                            <asp:ListItem Value="Description"></asp:ListItem>
                        </asp:dropdownlist>
                        at
                        <asp:dropdownlist id="cboOrder" runat="server" cssclass="NormalTextBox">
                            <asp:ListItem Value="DescendingOrder">Descending order</asp:ListItem>
                            <asp:ListItem Value="AscendingOrder">Ascending order</asp:ListItem>
                        </asp:dropdownlist>
                        <asp:button id="btnResortAll" runat="server" resourcekey="ResortAll" cssclass="CommandButton" />
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label5" runat="server" resourcekey="Watermark" suffix=":">
                                        </dnn:label>
                    </td>
                    <td>
                        <asp:panel id="pnlNoWatermark" runat="server">
                        <asp:Label ID="Label16" runat="server" resourcekey="NoWatermark"></asp:Label>
                            , <a href="javascript:void(0);" onclick="var e = document.getElementById('uploadWatermark'); e.style.display = e.style.display == 'none'?'block':'none';">
                               <asp:Label ID="Label17" runat="server" resourcekey="ClickToUpload"></asp:Label>.</a>
                        </asp:panel>
                        <asp:panel id="pnlHasWatermark" runat="server">
                            <asp:Label ID="lblWatermark" runat="server"></asp:Label>
                            <asp:Label ID="Label18" runat="server" resourcekey="WillBeApplied"></asp:Label>
                            <asp:LinkButton ID="cmdRemoveWatermark" runat="server" resourcekey="Remove" CausesValidation="False"></asp:LinkButton>
                            <asp:Label ID="Label19" runat="server" resourcekey="ItOr"></asp:Label>
                            <a href="javascript:void(0);" onclick="var e = document.getElementById('uploadWatermark'); e.style.display = e.style.display == 'none'?'block':'none';">
                                <asp:Label ID="Label20" runat="server" resourcekey="UploadNewOne"></asp:Label></a>.
                        </asp:panel>
                        <div id="uploadWatermark" class="UMGMenuBody" style="display: none;">
                            <input id="fileWatermark" style="width: 300px" type="file" size="30" name="File2"
                                runat="server" class="NormalTextBox" />
                                <br />
                            <asp:button id="btnUploadWatermark" runat="server" resourcekey="Upload" cssclass="CommandButton" />
                        </div>
                        
                        </td></tr>
                        <tr><td class="header">
                        <dnn:label id="Label21" runat="server" resourcekey="AttachTo" Suffix=":"></dnn:label></td><td>
                        
                        <asp:dropdownlist id="cboWatermarkPosition" runat="server" cssclass="NormalTextBox">
                            <asp:ListItem Value="UpperLeft"></asp:ListItem>
                            <asp:ListItem Value="UpperRight"></asp:ListItem>
                            <asp:ListItem Value="Center"></asp:ListItem>
                            <asp:ListItem Value="LowerLeft"></asp:ListItem>
                            <asp:ListItem Value="LowerRight"></asp:ListItem>
                        </asp:dropdownlist>
                        <asp:label id="Label22" runat="server" resourcekey="OfThePhoto"></asp:label>
                    </td>
                </tr>
                <tr><td class="header"><dnn:label id="lblCropThumbnails" runat="server" resourcekey="CropThumbnails" Suffix=":"></dnn:label></td>
                <td><asp:checkbox id="chkFixedThumbnailSize" runat="server" resourcekey="Enabled">
                        </asp:checkbox></td>
                </tr>
                <tr><td class="header"><dnn:label id="lblCropImages" runat="server" resourcekey="CropImages" Suffix=":"></dnn:label></td>
                <td><asp:checkbox id="chkCropImages" runat="server" resourcekey="Enabled">
                        </asp:checkbox></td>
                </tr>
                <tr><td class="header">
                    <dnn:label id="lblOthers" runat="server" resourcekey="ShowCopyright" Suffix=":"></dnn:label>
                </td><td>
                        
                        <asp:checkbox id="chkShowCopyright" runat="server" resourcekey="Enabled"></asp:checkbox>
                        
                </td></tr>
                <tr><td class="header"><dnn:label id="lblShowLicenseScreen" runat="server" resourcekey="ShowLicenseScreen" Suffix=":"></dnn:label></td>
                <td><asp:checkbox id="chkShowLicenseScreen" runat="server" resourcekey="Enabled">
                        </asp:checkbox></td>
                </tr>
                <tr><td class="header"><dnn:label id="lblBulkUpload" runat="server" resourcekey="BulkUpload" Suffix=":"></dnn:label></td>
                <td><asp:checkbox id="chkBulkUpload" runat="server" resourcekey="Enabled">
                        </asp:checkbox></td>
                </tr>
		        </table>
		    </div>
        <div class="container">
            <table cellpadding="0" cellspacing="0" width="100%" class="Normal">
            <tr><td class="header"><dnn:label id="lblPresentationCategory" runat="server" resourcekey="PresentationCategory" suffix=":">
                                        </dnn:label></td>
            <td><asp:dropdownlist id="cboPresentationTypes" runat="server" autopostback="True" repeatdirection="Horizontal" repeatcolumns="4" cssclass="NormalTextBox">
                                    <asp:listitem value="SmallGallery"></asp:listitem>
                                    <asp:listitem value="LargeGallery"></asp:listitem>
                                    <asp:listitem value="SlidersAndRotators"></asp:listitem>
                                    </asp:dropdownlist>
                                    <asp:checkbox id="chkFeaturedPresentations" runat="server" autopostback="True" resourcekey="FeaturedPresentations" checked="true"></asp:checkbox>
                </td>
            </tr>
            
		        <tr><td class="header"><dnn:label id="Label2" runat="server" resourcekey="Presentation" suffix=":">
                                        </dnn:label></td>
		        <td>                                        
                                        <asp:dropdownlist id="rdoPresentations" runat="server" autopostback="True" datavaluefield="ItemId"
                                        datatextfield="Name" repeatdirection="Horizontal" repeatcolumns="4" cssclass="NormalTextBox">
                                    </asp:dropdownlist>
                                    <a href="<%=ResolveUrl("suggestion.html") %>"  onclick="return hs.htmlExpand(this, { objectType: 'iframe', width: 600, height:480})" class="highslide"><%=Localize("NeedSuggestion") %></a>
                                    <asp:label id="lblOr" runat="server" resourcekey="Or"></asp:label>
                                    <a href="<%=ResolveUrl("presentation.html") %>"  onclick="return hs.htmlExpand(this, { objectType: 'iframe', width: 980, height:600})" class="highslide"><%=Localize("SeeDifference") %></a>
                                    </td>
		        </tr>
		        <tr>
                    <td class="header">
                        <dnn:label id="Label38" runat="server" resourcekey="FallbackChoice" suffix=":">
                                        </dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="rdoHtmlPresentations" runat="server" autopostback="True"
                            datavaluefield="Name" datatextfield="Name" repeatdirection="Horizontal" repeatcolumns="5"
                            cssclass="NormalTextBox">
                                    </asp:dropdownlist>
                    </td>
                </tr>
		        <tr>
                    <td class="header">
                        <dnn:label id="lblMobileViewer" runat="server" resourcekey="MobileViewer" suffix=":">
                                        </dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkUseMobileViewer" runat="server" resourcekey="UseMobileViewer">
                                    </asp:checkbox>
                    </td>
                </tr>
                <tr><td class="header"><dnn:label id="lblGallerySize" runat="server" resourcekey="GallerySize" suffix=":">
                                        </dnn:label></td><td>
                                    <asp:textbox id="txtGalleryWidth" runat="server" width="35px" cssclass="NormalTextBox"></asp:textbox>
                                    px &nbsp;X&nbsp;
                                    <asp:textbox id="txtGalleryHeight" runat="server" width="35px" cssclass="NormalTextBox"></asp:textbox>
                                    px
                                    <asp:rangevalidator id="RangeValidator19" runat="server" resourcekey="20to2000" controltovalidate="txtGalleryWidth"
                                        maximumvalue="2000" minimumvalue="20" type="Integer"></asp:rangevalidator>
                                    <asp:regularexpressionvalidator id="Regularexpressionvalidator6" runat="server" controltovalidate="txtGalleryWidth"
                                        errormessage="*" validationexpression="\d*"></asp:regularexpressionvalidator>
                                    <asp:rangevalidator id="RangeValidator20" runat="server" resourcekey="20to2000" controltovalidate="txtGalleryHeight"
                                        maximumvalue="2000" minimumvalue="20" type="Integer"></asp:rangevalidator>
                                    <asp:regularexpressionvalidator id="Regularexpressionvalidator7" runat="server" controltovalidate="txtGalleryHeight"
                                        errormessage="*" validationexpression="\d*"></asp:regularexpressionvalidator>
                                </td></tr>
                    <tr>
                    <td class="header">
                        <dnn:label id="Label41" runat="server" resourcekey="SupportedMedias" suffix=":">
                                        </dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkSupportImages" runat="server" cssclass="NormalTextBox" resourcekey="Images"></asp:checkbox>
                        <asp:checkbox id="chkSupportVideos" runat="server" cssclass="NormalTextBox" resourcekey="Videos"></asp:checkbox>
                        <asp:checkbox id="chkSupportAudios" runat="server" cssclass="NormalTextBox" resourcekey="Audios"></asp:checkbox>
                        <asp:checkbox id="chkSupportFlashs" runat="server" cssclass="NormalTextBox" resourcekey="Flashs"></asp:checkbox>
                    </td>
                </tr>
                </table>
        </div>
        <div class="container">
            <table cellpadding="0" cellspacing="0" width="100%" class="Normal">
                <tr>
                    <td class="header">
                        <dnn:label id="Label32" runat="server" resourcekey="GoogleMapsAPIKey" suffix=":">
                                        </dnn:label>
                    </td>
                    <td>
                        <asp:label id="Label33" runat="server" resourcekey="MyGoogleMapsAPIKey"></asp:label>:
                        <asp:textbox id="txtGoogleMapsAPIKey" runat="server" width="250px" cssclass="NormalTextBox"></asp:textbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label40" runat="server" resourcekey="ActiveSocialAPIKey" suffix=":">
                                        </dnn:label>
                    </td>
                    <td>
                        <asp:label id="lblActiveSocialIntegration" runat="server" resourcekey="ActiveSocialIntegration">
                                        </asp:label>:
                        <asp:textbox id="txtActiveSocialAPIKey" runat="server" width="250px" cssclass="NormalTextBox"></asp:textbox>
                        <asp:label id="lblIntegrationMethod" runat="server" resourcekey="IntegrationMethod">
                                        </asp:label>
                        <asp:dropdownlist id="cboActiveSocialMethod" runat="server" cssclass="NormalTextBox">
                                    <asp:ListItem Value="AddPhoto"></asp:ListItem>
                                    <asp:ListItem Value="AddProfileItem"></asp:ListItem>
                                </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label49" runat="server" resourcekey="DNNJournalIntegration" suffix=":">
                                        </dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkDNNJournalIntegration" runat="server" resourcekey="Enabled">
                                        </asp:checkbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label39" runat="server" resourcekey="UVGIntegration" suffix=":">
                                        </dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkUVGIntegration" runat="server" resourcekey="Enabled">
                                        </asp:checkbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label9" runat="server" resourcekey="RssFeed" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <div style="cursor: pointer;" onclick="var divRssFeed=document.getElementById('divRssFeed');divRssFeed.style.display=divRssFeed.style.display=='none'?'block':'none';">
                            <asp:label id="Label10" runat="server" resourcekey="ClickToGrab"></asp:label>
                        </div>
                        <div id="divRssFeed" class="UMGMenuBody" style="display: none;">
                            <asp:label id="lblRssFeed" runat="server"></asp:label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label34" runat="server" resourcekey="EmbedCode" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <div style="cursor: pointer;" onclick="var divEmbedCode=document.getElementById('divEmbedCode');divEmbedCode.style.display=divEmbedCode.style.display=='none'?'block':'none';">
                            <asp:label id="Label35" runat="server" resourcekey="ClickToGrab"></asp:label>
                        </div>
                        <div id="divEmbedCode" class="UMGMenuBody" style="display: none;">
                            <asp:label id="lblEmbedCode" runat="server"></asp:label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label43" runat="server" resourcekey="PopupWindow" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <div style="cursor: pointer;" onclick="var divPopupWindow=document.getElementById('divPopupWindow');divPopupWindow.style.display=divPopupWindow.style.display=='none'?'block':'none';">
                            <asp:label id="Label44" runat="server" resourcekey="ClickToGrab"></asp:label>
                        </div>
                        <div id="divPopupWindow" class="UMGMenuBody" style="display: none;">
                            <asp:label id="lblPopupWindow" runat="server"></asp:label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblAmazonS3" runat="server" resourcekey="AmazonS3" Suffix=":"></dnn:label>
                    </td>
                    <td>
                        <asp:hyperlink id="lnkAmazonS3" runat="server" resourcekey="ConfigAmazonS3" cssclass="CommandButton"></asp:hyperlink>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="lblMobileDeviceUploader" runat="server" resourcekey="MobileDeviceUploader" suffix=":">
                                        </dnn:label>
                    </td>
                    <td>
                        <asp:label id="Label45" runat="server" resourcekey="SiteDomain"></asp:label>
                        <asp:label id="lblSiteDomain" runat="server" cssclass="SubSubHead"></asp:label>
                        <asp:label id="Label46" runat="server" resourcekey="GalleryID"></asp:label>
                        <asp:label id="lblGalleryID" runat="server" cssclass="SubSubHead"></asp:label>
                    </td>
                </tr>
             </table>
        </div>
        <div class="container">
            <table cellpadding="0" cellspacing="0" width="100%" class="Normal">
                <tr>
                    <td class="header">
                        <dnn:label id="Label8" runat="server" resourcekey="RootFolder" suffix=":">
                                        </dnn:label>
                    </td>
                    <td>
                        <asp:label id="lblPortalRoot" runat="server"><%=PortalSettings.HomeDirectory %></asp:label>
                        <asp:textbox id="txtRootFolder" runat="server" width="150px" cssclass="NormalTextBox"></asp:textbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label37" runat="server" resourcekey="PermissionSet" suffix=":">
                                        </dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkSetPermissionByUser" runat="server" resourcekey="Enabled"></asp:checkbox>
                    </td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label7" runat="server" resourcekey="DiskQuota" suffix=":">
                                        </dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboModuleUserQuota" runat="server" cssclass="NormalTextBox">
                                    <asp:ListItem Text="1"></asp:ListItem>
                                    <asp:ListItem Text="2"></asp:ListItem>
                                    <asp:ListItem Text="3"></asp:ListItem>
                                    <asp:ListItem Text="4"></asp:ListItem>
                                    <asp:ListItem Text="5"></asp:ListItem>
                                    <asp:ListItem Text="7"></asp:ListItem>
                                    <asp:ListItem Text="10"></asp:ListItem>
                                    <asp:ListItem Text="15"></asp:ListItem>
                                    <asp:ListItem Text="30"></asp:ListItem>
                                    <asp:ListItem Text="50"></asp:ListItem>
                                    <asp:ListItem Text="100"></asp:ListItem>
                                    <asp:ListItem Text="Unlimited" Selected="true"></asp:ListItem>
                                </asp:dropdownlist>
                        
                    </td>
                </tr>
                <tr>
                    <td class="header">
                    <dnn:label id="lblDiskQuotaWaiver" runat="server" resourcekey="DiskQuotaWaiver" suffix=":">
                                        </dnn:label></td>
                    <td><span style="cursor: pointer;" onclick="var divQuotaApplyTo=document.getElementById('divQuotaApplyTo');divQuotaApplyTo.style.display=divQuotaApplyTo.style.display=='none'?'block':'none';">
                            <asp:label id="lblQuotaApplyTo" runat="server" cssclass="SubSubHead"></asp:label>
                        </span>
                        <div id="divQuotaApplyTo" class="UMGMenuBody" style="display: none;">
                            <uc1:rolepicker id="ucQuotaExclude" runat="server">
                                    </uc1:rolepicker>
                        </div></td>
                </tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label6" runat="server" resourcekey="SellPhotos" suffix=":">
                                        </dnn:label>
                    </td>
                    <td>
                        <asp:checkbox id="chkSellSinglePhoto" runat="server" resourcekey="Enabled"></asp:checkbox>
                        <div class="UMGMenuBody" id="divSell">
                        <asp:label id="Label23" runat="server" resourcekey="PriceIs"></asp:label>:
                        <asp:textbox id="txtPrice" runat="server" width="35px" cssclass="NormalTextBox"></asp:textbox>
                        <asp:regularexpressionvalidator id="revPrice" runat="server" controltovalidate="txtPrice"
                            errormessage="*" validationexpression="[\.\d]*"></asp:regularexpressionvalidator>
                        <asp:dropdownlist id="cboCurrency" runat="server" cssclass="NormalTextBox">
                            <asp:ListItem Value="USD">US Dollars</asp:ListItem>
                            <asp:ListItem Value="EUR">Euros</asp:ListItem>
                            <asp:ListItem Value="CAD">Canadian Dollars</asp:ListItem>
                            <asp:ListItem Value="GBP">Pounds Sterling</asp:ListItem>
                            <asp:ListItem Value="JPY">Japanese Yen</asp:ListItem>
                            <asp:ListItem Value="AUD">Australian Dollars</asp:ListItem>
                            <asp:ListItem Value="RMB">Chinese Yuan</asp:ListItem>
                        </asp:dropdownlist>
                        <br />
                        <asp:label id="Label24" runat="server" resourcekey="PayBy"></asp:label>
                        <asp:dropdownlist id="cboPaymentProcessers" runat="server" cssclass="NormalTextBox">
                            <asp:ListItem Value="Paypal">Paypal</asp:ListItem>
                        </asp:dropdownlist>
                        ,
                        <asp:label id="Label25" runat="server" resourcekey="MyAccountIs"></asp:label>:
                        <asp:textbox id="txtProcesserId" runat="server" width="150px" cssclass="NormalTextBox"></asp:textbox>
                        <br />
                        <asp:label id="Label26" runat="server" resourcekey="Notify"></asp:label>:
                        <asp:textbox id="txtOrderNotification" runat="server" width="300px" cssclass="NormalTextBox"></asp:textbox>
                        </div>
                    </td>
                </tr>
                <tr><td class="header"><dnn:label id="lblRawFile" runat="server" resourcekey="RawFile" suffix=":">
                                        </dnn:label></td>
                <td><asp:checkbox id="chkShowLinkedDownload" runat="server" resourcekey="Enabled">
                        </asp:checkbox>
                        </td>
                </tr>
                <tr><td class="header"><dnn:label id="lblSaveAsRawFile" runat="server" resourcekey="SaveAsRawFile" suffix=":">
                                        </dnn:label></td><td><asp:checkbox id="chkLinkOriginalFile" runat="server" resourcekey="Enabled">
                        </asp:checkbox></td></tr>
                <tr><td class="header"><dnn:label id="lblCheckBackDoors" runat="server" resourcekey="CheckBackDoors" suffix=":">
                                        </dnn:label></td><td><asp:checkbox id="chkCheckBackDoors" runat="server" resourcekey="Enabled">
                        </asp:checkbox></td></tr>
                <tr>
                    <td class="header">
                        <dnn:label id="Label0" runat="server" resourcekey="GalleryMode" suffix=":">
                                        </dnn:label>
                    </td>
                    <td>
                        <asp:dropdownlist id="cboGalleryMode" runat="server" cssclass="NormalTextBox TT"
                            autopostback="True">
                                            <asp:ListItem Value="Normal"></asp:ListItem>
                                            <asp:ListItem Value="PersonalGallery"></asp:ListItem>
                                            <asp:ListItem Value="ProfileIntegration" Selected="true"></asp:ListItem>
                                            <asp:ListItem Value="Community"></asp:ListItem>
                                        </asp:dropdownlist>
                        </td>
                </tr>
            </table>
            <asp:panel id="pnlNormalSettings" runat="server">
		        <table cellpadding="0" cellspacing="0" width="100%" class="Normal">
		        <tr><td class="header">
			        <dnn:Label ID="lblViewPermission" runat="server" resourcekey="ViewPermission" Suffix=":">
                                                </dnn:Label>
		        </td>
		        <td><asp:CheckBox ID="chkViewPermission" cssclass="TT" runat="server" resourcekey="Enabled">
                                                </asp:CheckBox></td></tr>
		        <tr><td class="header">
		        <dnn:Label ID="lblManageRights" runat="server" resourcekey="ManageRights" Suffix=":">
                                                </dnn:Label>
				</td>
		        <td>
                    <uc1:RolePicker ID="RolePicker1" runat="server" DefaultRoles=""></uc1:RolePicker>
                </td></tr>                
		        <tr><td class="header">
		            <dnn:Label ID="lblAutoSync" runat="server" resourcekey="AutoSync" Suffix=":"></dnn:Label>
		        </td><td><asp:CheckBox ID="chkAutoSync" runat="server" resourcekey="RunSync"></asp:CheckBox>
                                        <asp:DropDownList ID="cboAutoSync" runat="server" CssClass="NormalTextBox">
                                            <asp:ListItem Text="minute" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="quarter" Value="15"></asp:ListItem>
                                            <asp:ListItem Text="hour" Value="60"></asp:ListItem>
                                            <asp:ListItem Text="3 hours" Value="180"></asp:ListItem>
                                            <asp:ListItem Text="12 hours" Value="720"></asp:ListItem>
                                            <asp:ListItem Text="24 hours" Value="1440" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="2 days" Value="2880"></asp:ListItem>
                                        </asp:DropDownList></td>
                 </tr>
		        </table>
            </asp:panel>
            
            <asp:panel id="pnlPersonalGallerySettings" runat="server">
                <table cellpadding="0" cellspacing="0" width="100%" class="Normal">
		        <tr><td class="header"><dnn:Label ID="lblUserIdInURL" runat="server" resourcekey="UserIdInURL" Suffix=":">
                                                </dnn:Label></td>
		        <td>
                                        <asp:CheckBox ID="chkEncryptUserID" runat="server" resourcekey="Enabled"></asp:CheckBox>
                </td></tr>
                <tr><td class="header"><dnn:Label ID="lblPGUsers" runat="server" resourcekey="PGUsers" Suffix=":"></dnn:Label>
                </td>
                <td>
                     <uc1:RolePicker ID="RolePicker2" runat="server" DefaultRoles=""></uc1:RolePicker>
                </td></tr>
                </table>
            </asp:panel>
            <asp:panel id="pnlProfileSettings" runat="server">
                <table cellpadding="0" cellspacing="0" width="100%" class="Normal">
		        <tr><td class="header"><dnn:Label ID="lblDataSource" resourcekey="DataSource" runat="server">
                                        </dnn:Label>
		        </td><td>
                    <asp:DropDownList ID="cboDataSource" runat="server" AutoPostBack="False" DataValueField="ModuleId"
                                            DataTextField="ModuleTitle" CssClass="NormalTextBox">
                                        </asp:DropDownList>
                </td></tr>
                <tr><td class="header"><dnn:Label ID="lblUserKey" runat="server" resourcekey="UserKey"></dnn:Label></td>
                <td><asp:TextBox ID="txtUserKey" runat="server" Width="70px" CssClass="NormalTextBox"></asp:TextBox></td></tr>
                </table>
            </asp:panel>
            <asp:panel id="pnlCommunity" runat="server">
                <table cellpadding="0" cellspacing="0" width="100%" class="Normal">
		        <tr><td class="header"><dnn:Label ID="Label13" runat="server" resourcekey="MaxAlbums"></dnn:Label>
		        </td><td>
		        <asp:DropDownList ID="cboMaxAlbums" runat="server" CssClass="NormalTextBox">
                                            <asp:ListItem Text="1"></asp:ListItem>
                                            <asp:ListItem Text="2"></asp:ListItem>
                                            <asp:ListItem Text="5"></asp:ListItem>
                                            <asp:ListItem Text="10"></asp:ListItem>
                                            <asp:ListItem Text="Unlimited" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
		        </td></tr>
		        <tr><td class="header"><dnn:Label ID="Label14" runat="server" resourcekey="CommunityUsers"></dnn:Label>
		        </td><td><uc1:RolePicker ID="RolePicker3" runat="server" DefaultRoles="">
                                        </uc1:RolePicker></td></tr>
		        </table>
            </asp:panel>
        </div>
</div>

<script type="text/javascript">
// perform JavaScript after the document is scriptable.
jQuery(document).ready(function(){
	// setup ul.tabs to work as tabs for each div directly under div.panes
	var initialIndex = dnn.getVar("UMGSTSTAB") * 1;
	if (!initialIndex)
	    initialIndex = 0;
	    
	var host = jQuery("#tabs ul").tabs("#tabs > div", {'initialIndex':initialIndex, onClick:function(e, index){dnn.setVar("UMGSTSTAB", index);}});	
	
	var chkSellSinglePhoto = jQuery("#<%=chkSellSinglePhoto.ClientID %>");
    chkSellSinglePhoto.change(function(){
        var divSell=document.getElementById('divSell');
        divSell.style.display = this.checked?'block':'none';
    });
    chkSellSinglePhoto.change();
        
    hs.graphicsDir = '<%=ResolveUrl("css/highslide/graphics/") %>';
    hs.showCredits = false;
    
    jQuery("#<% =txtGoogleMapsAPIKey.ClientID %>").watermark("<%=Localize("LeaveItBlank") %>");
    jQuery("#<% =txtActiveSocialAPIKey.ClientID %>").watermark("<%=Localize("LeaveItBlank") %>");

});
</script>

<p><asp:button class="CommandButton" id="btnUpdate" runat="server" resourcekey="cmdUpdate"></asp:button>
            &nbsp;
            <asp:button class="CommandButton" id="btnCancel" runat="server" resourcekey="cmdCancel"
                causesvalidation="False" text="Cancel"></asp:button></p>