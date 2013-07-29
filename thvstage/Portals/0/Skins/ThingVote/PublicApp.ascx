<%@ Control Language="C#" CodeBehind="PublicApp.ascx.cs" AutoEventWireup="false" Inherits="ThingvoteSkin.PublicApp" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="JQUERY" Src="~/Admin/Skins/jQuery.ascx" %>

<%@ Register TagPrefix="ASPvia" TagName="SkinUtil" 
    Src="~/Portals/_default/Skins/Bootstrap/Controls/SkinUtilities.ascx" %>

<dnn:JQUERY ID="dnnjQuery" runat="server" />

<dnn:DnnJsInclude ID="DnnJsInclude3" runat="server" FilePath="~/Portals/_default/Skins/Bootstrap/Scripts/bootstrap.min.js" />
<dnn:DnnJsInclude ID="DnnJsInclude4" runat="server" 
    FilePath="~/DesktopModules/SocialPolls/Scripts/knockout-2.2.1.debug.js" />

<script src="/Portals/0/Skins/ThingVote/PublicPolls/durandal/amd/require.js" 
    data-main="/Portals/0/Skins/ThingVote/PublicPolls/main"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var loginBtn = $('#LoginForm .login a');
        loginBtn.addClass('btn btn-primary');
        $('#thvHeader').on('click', '#RegisterLink', register);
        $('#RightContainer').on('click', '#RegisterLink', register);

        function register() {
            var regId = '#' + '<% =dnnLogin.ClientID%>';
            $('#dnn_dnnUser_enhancedRegisterLink').trigger('click');;
            // $('.DynamicLogin_FacebookOAuthLink img').trigger('click');
        }

        //replace faceboook images and twitter 
        var imgPath = '/Portals/0/Skins/ThingVote/images/';
        var fbImg = $('.DynamicLogin_FacebookOAuthLink img')[0];
        var twImg = $('.DynamicLogin_FacebookOAuthLink img')[1];
        $(fbImg).attr('src', imgPath + 'facebookConnect.png');
        $(twImg).attr('src', imgPath + 'twitterConnect.png');

        masConfig = {
            itemSelector: '.pollItem',
            columnWidth: 244,
            isAnimated: true,
            isFitWidth: true,
            isResizable: true
        };

        function viewmodel() {
            var self = this;
            //self.test = ko.observable('test');
            self.register = function () {
                return settings.reglink;
            }
            self.viewPublicPolls = function () {
                $('#splash').toggleClass('hide');
                $('#pollsApp').toggleClass('hide');

                //run masonry
                pollsContainer = $('#pollsContainer');               
                pollsContainer.imagesLoaded(function () {
                    var images = $('div.previewImageContainer', pollsContainer);
                    pollsContainer.masonry(masConfig);                   
                });
            }
        };
        ko.applyBindings(new viewmodel());
    });
</script>


<script id="dnncontext" type="text/ecmascript">
    jQuery(document).ready(function () {
        var contextData = {
            userId: -1,
            viewerId:-1,
            groupId:-1,
            pageSize: 10,
            hostUrl: "<% = this.Page.Request.Url.Host %>",
            profileUrl: '',
            profileUrlUserToken: '',
            profilePicHandler: '<% = DotNetNuke.Common.Globals.UserProfilePicFormattedUrl() %>',
            profilePictureUrl: '', 
            displayName: 'public',
            homeDirectory: '<% =PortalSettings.HomeDirectory %>',
            userImagesPath: '',
            servicesFramework: $.ServicesFramework(416),
            membersServicesFramework: $.globalServicesFramework(417,86 ),
            notificationsServicesFramework:$.globalServicesFramework(382,60),
            moduleUrl:'/DesktopModules/SocialPolls',
          
            //settings properties            
        };

        $('#applicationHost').data('dnnContext', contextData);
     
    });
</script>
<ASPvia:SkinUtil ID="skinUtil" runat="server" />

<div id="SplashBody"></div>
<header id="thvHeader">
    <section class="splash-center">
        <div id="logo" class="pull-left">
            <dnn:LOGO runat="server" ID="dnnLOGO" />
        </div>
        <div class="pull-right">
            <span>
                <a href="#" id="viewPolls"
                    data-bind="click: viewPublicPolls">
                    view ThingVote as a guest</a></span>
            <span>
                <a id="RegisterLink" class="btn btn-primary">SIGN IN</a>
            </span>
        </div>
    </section>

</header>
<div class="clear"></div>

<div id="pollsApp">
    <div id="applicationHost"></div>
</div>




<div id="login" class="hide">
    <dnn:USER ID="dnnUser" runat="server" LegacyMode="false" />
    <dnn:LOGIN ID="dnnLogin" CssClass="LoginLink" runat="server" LegacyMode="false" />
</div>





