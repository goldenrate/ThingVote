<%@ Control Language="C#" CodeBehind="~/DesktopModules/Skins/skin.cs" AutoEventWireup="false" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" TagName="JQUERY" Src="~/Admin/Skins/jQuery.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="ASPvia" TagName="SkinUtil"
    Src="~/Portals/_default/Skins/Bootstrap/Controls/SkinUtilities.ascx" %>
<dnn:JQUERY ID="dnnjQuery" runat="server" />
<dnn:DnnJsInclude ID="DnnJsInclude1" runat="server" FilePath="~/Resources/Shared/Scripts/slides.min.jquery.js" />
<dnn:DnnJsInclude ID="DnnJsInclude3" runat="server" FilePath="~/Portals/_default/Skins/Bootstrap/Scripts/bootstrap.min.js" />

<script src="DesktopModules/SocialPolls/App/durandal/amd/require.js" data-main="DesktopModules/SocialPolls/App/main"></script>

<ASPvia:SkinUtil ID="skinUtil" runat="server" />
<div id="fb-root"></div>
<script id="facebookSdk">
    window.fbAsyncInit = function () {
        // init the FB JS SDK
        var fbObj = {};
        FB.init({
            appId: '<%=skinUtil.FacebookAppId%>',                        // App ID from the app dashboard
            channelUrl: '//WWW.YOUR_DOMAIN.COM/channel.html', // Channel file for x-domain comms
            status: true,                                 // Check Facebook Login status
            xfbml: true                                  // Look for social plugins on the page
        });

        // Additional initialization code such as adding Event Listeners goes here
        var isFbAuthenticated = FB.getLoginStatus(function (response) {
            if (response.status === 'connected') {
                // the user is logged in and has authenticated your
                // app, and response.authResponse supplies
                // the user's ID, a valid access token, a signed
                // request, and the time the access token 
                // and signed request each expire
                var uid = response.authResponse.userID;
                var accessToken = response.authResponse.accessToken;
                fbObj.uid = uid;
                fbObj.accesToken = accessToken;
                fbObj.FB = FB;
                $('#fb-root').data('facebookObj', fbObj);
            } else if (response.status === 'not_authorized') {
                // the user is logged in to Facebook, 
                // but has not authenticated your app
            } else {
                // the user isn't logged in to Facebook.
            }
        });        
    };

    // Load the SDK asynchronously
    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) { return; }
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/all.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>

<div id="ContentPane" runat="server" />
<script>
    $(function () {
        $('#slides').slides({
            preload: true,
            preloadImage: '<%= Page.ResolveClientUrl("~/images/loading.gif") %>',
            play: 0,
            next: 'next',
            prev: 'prev',
            pagination: true,
            generatePagination: false,
            hoverPause: true     
        });

        
    });

</script>

<!--/login-->
