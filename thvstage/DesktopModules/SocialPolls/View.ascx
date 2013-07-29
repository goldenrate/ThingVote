<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="DotNetNuke.Modules.SocialPolls.View" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>



<script id="dnncontext" type="text/ecmascript">
    jQuery(document).ready(function () {
        var contextData = {
            userId: <% = (ProfileUserId == -1) ? ModuleContext.PortalSettings.UserId: ProfileUserId %>,
            viewerId: <% = ModuleContext.PortalSettings.UserId %>,
            groupId:<% = GroupId %>,
            pageSize: 10,
            hostUrl: "<% = this.Page.Request.Url.Host %>",
            appUrl: "<%=Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery,"") + "/App.aspx#/"%>" ,
            profileUrl: "<% = ViewProfileUrl %>",
            profileUrlUserToken: "<% = ProfileUrlUserToken %>",
            profilePicHandler: '<% = DotNetNuke.Common.Globals.UserProfilePicFormattedUrl() %>',
            profilePictureUrl: '<% = UserProfilePhotUrl %>', 
            displayName: '<% = DisplayName %>',
            homeDirectory: '<% =PortalSettings.HomeDirectory %>',
            userImagesPath: '<% =PortalSettings.HomeDirectoryMapPath + "Users\\SocialPolls\\" + ProfileUserId  %>',
            servicesFramework: $.ServicesFramework(<%=ModuleContext.ModuleId %>),
            membersServicesFramework: $.globalServicesFramework(<%= MembersModuleId %>, <% = MembersTabId %>  ),
            notificationsServicesFramework:$.globalServicesFramework(382,60),
            moduleUrl:'/DesktopModules/SocialPolls',
            userControl: '#<%= dnnUser.ClientID  + "_registerGroup" %>',
            userLogin: '#<%= dnnLogin.ClientID + "_loginGroup" %>' ,
            isAuthenticated: '<% = Request.IsAuthenticated%>'
            //settings properties            
        };

        $('#applicationHost').data('dnnContext', contextData);
     
    });
</script>
<script type="text/javascript">
    var IsAuthenticated = '<% = Request.IsAuthenticated%>'.toLowerCase() == 'false' ? false : true;
    var Signup =  function myfunction() {
        $('a', '#<%= dnnUser.ClientID  + "_registerGroup" %>').trigger('click');
    };
</script>
       
<div id="applicationHost"></div>

<div id="login" style="display:none">
    <dnn:USER ID="dnnUser" runat="server" LegacyMode="false" /> 
    <dnn:LOGIN ID="dnnLogin" CssClass="LoginLink" runat="server" LegacyMode="false" />
    <div runat="server" id="wizardData"></div>
</div>

<div id="globalParams"></div>



