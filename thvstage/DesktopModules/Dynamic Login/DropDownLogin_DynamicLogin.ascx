<%@ Control language="vb" Inherits="DataSprings.DNN.Modules.DynamicLogin.DynamicLogin" CodeBehind="DynamicLogin.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<asp:UpdatePanel ID="UpdatePanelDynamic" runat="server">
 <ContentTemplate>
 <asp:UpdateProgress ID="UpdateProgress1" runat="server"> 
            <ProgressTemplate> 
                <asp:Image ID="imgProgress" runat="server" ImageUrl="~/desktopmodules/Dynamic Login/Progress.gif" ></asp:Image>
                <asp:Label ID="lblWait" runat="server" Text=" Please wait..."></asp:Label>
                     </ProgressTemplate> 
        </asp:UpdateProgress> 

<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
  <% if CStr(MySettings("FaceBookAppID")) <> "" then %>
<div id="fb-root"></div>
<script>
var DEBUG=false;
window.fbAsyncInit = function()
{
    FB.Event.subscribe('auth.statusChange', onFacebookStatusChange);
    FB.init({
      appId  : '<% = CStr(MySettings("FaceBookAppID")) %>',
      status : true, // check login status
      cookie : true, // enable cookies to allow the server to access the session
      xfbml  : true  // parse XFBML
    });

	FB.getLoginStatus(onFacebookInitialLoginStatus);

};


(function() {
var e = document.createElement('script');
e.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
e.async = true;
document.getElementById('fb-root').appendChild(e);
}());

function facebookLogin()
{
    FB.login(onFacebookLoginStatus, {perms:'<% = CStr(GetFacebookPerms()) %>'});
}

/*
* Callback function for FB.getLoginStatus
*/
function onFacebookInitialLoginStatus(response)
{
    if (DEBUG)
	{
		alert("onFacebookLoginStatus(), "
		  + "\nresponse.status="+response.status
		  +" \nresponse.session="+response.session
		  +" \nresponse.perms="+response.perms);
	}
    if (response.status=="connected" && response.session)
    {
		// At this stage, user is logged in.
		// For this example, I am logging out the user if the user is already logged in.
		//FB.logout();
                // alert('Does this fire first or 2nd');
    }
    else
    {
		// User if not logged in.
    }
}

/*
* Callback function for 'auth.statusChange' event.
*/
function onFacebookStatusChange(response)
{
    if (DEBUG)
	{
		alert("onFacebookStatusChange(), "
		  + "\nresponse.status="+response.status
		  +" \nresponse.session="+response.session
		  +" \nresponse.perms="+response.perms);
	}
}

/*
* Callback function for FB.login
*/
function onFacebookLoginStatus(response)
{
    if (DEBUG)
	{
		alert("onFacebookLoginStatus(), "
		  + "\nresponse.status="+response.status
		  +" \nresponse.session="+response.session
		  +" \nresponse.perms="+response.perms);
	}
    if (response.status=="connected" && response.session)
    {
		//alert("You are all set... We now need to get the access token and do a JavaScript refresh.");
                Javascript:__doPostBack('callback','')
		
    }
    else
    {
		alert("Please login to enjoy this application.");
    }
}


</script>

 <%
      end if
     %>


<asp:Literal ID="litStyle" runat="server"></asp:Literal>
<asp:Literal ID="litTemplate" runat="server"></asp:Literal>
<asp:LinkButton ID="lnkContinue" runat="server" Visible=False></asp:LinkButton>
<asp:hiddenfield ID="objDDL" runat="server" value="True"></asp:hiddenfield>
 </ContentTemplate>
<Triggers>
</Triggers>

            </asp:UpdatePanel>
