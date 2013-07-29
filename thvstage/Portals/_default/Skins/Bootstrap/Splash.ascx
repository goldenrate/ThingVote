<%@ Control Language="C#" CodeBehind="~/DesktopModules/Skins/skin.cs" AutoEventWireup="false" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="JQUERY" Src="~/Admin/Skins/jQuery.ascx" %>

<%@ Register TagPrefix="ASPvia" TagName="SkinUtil"
    Src="~/Portals/_default/Skins/Bootstrap/Controls/SkinUtilities.ascx" %>

<dnn:JQUERY ID="dnnjQuery" runat="server" />

<dnn:DnnJsInclude ID="DnnJsInclude3" runat="server" FilePath="~/Portals/_default/Skins/Bootstrap/Scripts/bootstrap.min.js" />
<dnn:DnnJsInclude ID="DnnJsInclude4" runat="server" FilePath="~/DesktopModules/SocialPolls/Scripts/knockout-2.2.1.debug.js" />



<script type="text/javascript">
    $(document).ready(function () {
        var loginBtn = $('#LoginForm .login a');
        loginBtn.addClass('btn btn-primary');
        $('#thvHeader').on('click', '#RegisterLink', register);
        function register() {
            $('.DynamicLogin_FacebookOAuthLink img').trigger('click');
        }

        //replace faceboook images and twitter 
        var fbImg = $('#lnkOAuthFacebook img')

        function viewmodel() {
            var self = this;
            //self.test = ko.observable('test');
            self.register = function () {
                return settings.reglink;
            }
        };
        ko.applyBindings(new viewmodel());
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
            <span>view ThingVote as a guest</span>
            <span>
                <a id="RegisterLink" class="btn btn-primary">SIGN IN</a>
            </span>
        </div>
    </section>

</header>
<div class="clear"></div>
<section class="splash-center container">
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
                <h4 style="color:black;">how thingvote works? 
                    <span style="font-weight:normal"> here is the process in 3 easy slides</span></h4>
            </div>
            <div id="Presentation" class="carousel slide">
                <div id="lIndicWrapper">
                    <ol class="carousel-indicators">
                        <li data-target="#Presentation" data-slide-to="0" class="active">1st step</li>
                        <li data-target="#Presentation" data-slide-to="1">2nd step</li>
                        <li data-target="#Presentation" data-slide-to="2">3rd step</li>
                    </ol>
                    <span style="position: relative;left: 150px;top: -40px;">
                        see what your friend choose </span>
                </div>
                <!-- Carousel items -->
                <div class="carousel-inner">
                    <div class="active item"><img src="/Portals/_default/Skins/Bootstrap/images/presentation1.png" /></div>
                    <div class="item"><img src="/Portals/_default/Skins/Bootstrap/images/presentation2.png" /></div>
                    <div class="item"><img src="/Portals/_default/Skins/Bootstrap/images/presentation3.png" /></div>
                </div>
                <!-- Carousel nav -->
                
                <div  id="CarouselNav">
                    <a class="" href="#Presentation" data-slide="prev">previous step</a>
                    <span style="color:#E2E2E2"> | </span>
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
    </div>
    <div class="clear"></div>
    </div>
</section>




<div id="login" class=" hide">
    <dnn:USER ID="dnnUser" runat="server" LegacyMode="false" />
    <dnn:LOGIN ID="dnnLogin" CssClass="LoginLink" runat="server" LegacyMode="false" />
</div>





