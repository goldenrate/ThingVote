<%@ Control Language="C#" CodeBehind="Splash.ascx.cs" AutoEventWireup="false" Inherits="ThingvoteSkin.Splash" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="JQUERY" Src="~/Admin/Skins/jQuery.ascx" %>

<%@ Register TagPrefix="ASPvia" TagName="SkinUtil" 
    Src="~/Portals/_default/Skins/Bootstrap/Controls/SkinUtilities.ascx" %>

<dnn:JQUERY ID="dnnjQuery" runat="server" />

<dnn:DnnJsInclude ID="DnnJsInclude3" runat="server" 
    FilePath="~/Portals/_default/Skins/Bootstrap/Scripts/bootstrap.min.js" />
<dnn:DnnJsInclude ID="DnnJsInclude4" runat="server" 
    FilePath="~/DesktopModules/SocialPolls/Scripts/knockout-2.2.1.debug.js" />

<script type="text/javascript">
    $(document).ready(function () {
        var loginBtn = $('#LoginForm .login a');
        loginBtn.addClass('btn btn-primary');
        $('#thvHeader').on('click', '#RegisterLink', register);
        $('#RightContainer').on('click', '#RegisterLink', register);

        function register() {
            var regId = '#' + '<% =dnnLogin.ClientID%>';
            $('#dnn_dnnUser_enhancedRegisterLink').trigger('click');
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
                //$('#splash').toggleClass('hide');
                //$('#pollsApp').toggleClass('hide');

                ////run masonry
                //pollsContainer = $('#pollsContainer');               
                //pollsContainer.imagesLoaded(function () {
                //    var images = $('div.previewImageContainer', pollsContainer);
                //    pollsContainer.masonry(masConfig);                   
                //});
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
                <a href="<%=Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery,"") + "/App.aspx#/"%>" 
                    id="viewPolls">
                    view ThingVote as a guest</a></span>
            <span>
                <a id="RegisterLink" class="btn btn-primary">SIGN IN</a>
            </span>
        </div>
    </section>

</header>
<div class="clear"></div>

<section id="splash" class="splash-center container">
    <div class="row">
        <div id="LeftContainer" class="span">
            <div id="TopBannerPane" class="banner-pane">
                <div id="BannerText">
                    <h1>ThingVote</h1>
                    <div class="title">makes it easy for you to pick</div>
                </div>
            </div>
            <div id="PresentationPane">
                <div id="PresentationHeader" class="login-Header">
                    <h4 style="color: black;">how thingvote works? 
                    <span style="font-weight: normal">here is the process in 3 easy slides</span></h4>
                </div>
                <div id="Presentation" class="carousel slide">
                    <div id="lIndicWrapper">
                        <ol class="carousel-indicators">
                            <li data-target="#Presentation" data-slide-to="0" class="active">1st step</li>
                            <li data-target="#Presentation" data-slide-to="1">2nd step</li>
                            <li data-target="#Presentation" data-slide-to="2">3rd step</li>
                        </ol>
                        <span style="position: relative; left: 150px; top: -40px;">see what your friend choose </span>
                    </div>
                    <!-- Carousel items -->
                    <div class="carousel-inner">
                        <div class="active item">
                            <img src="/Portals/0/Skins/ThingVote/images/presentation1.png" /></div>
                        <div class="item">
                            <img src="/Portals/0/Skins/ThingVote/images/presentation2.png" /></div>
                        <div class="item">
                            <img src="/Portals/0/Skins/ThingVote/images/presentation3.png" /></div>
                    </div>
                    <!-- Carousel nav -->

                    <div id="CarouselNav">
                        <a class="" href="#Presentation" data-slide="prev">previous step</a>
                        <span style="color: #E2E2E2">| </span>
                        <a class="" href="#Presentation" data-slide="next">next step</a>
                    </div>
                </div>
            </div>
            <div id="ContentPane" runat="server"></div>
            <div id="footer"></div>
        </div>

        <div id="RightContainer" class="span">
            <div id="LoginPane" runat="server">
            </div>
            <div style="padding:10px; margin-top:15px; max-width:240px;">
                <em style="font-weight:bold">find friends, invite friends & start making 
                the right decisions with thingvote. <br /></em>
                <a id="RegisterLink" style="cursor:pointer">Start here, it's free & easy</a>
            </div>
        </div>
        <div class="clear"></div>
    </div>

</section>

<div id="pollsApp" class="hide">
    <div id="applicationHost"></div>
</div>




<div id="login" class="hide">
    <dnn:USER ID="dnnUser" runat="server" LegacyMode="false" />
    <dnn:LOGIN ID="dnnLogin" CssClass="LoginLink" runat="server" LegacyMode="false" />
</div>





