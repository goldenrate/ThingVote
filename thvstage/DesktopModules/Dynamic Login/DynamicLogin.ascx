<%@ Control language="vb" Inherits="DataSprings.DNN.Modules.DynamicLogin.DynamicLogin" CodeBehind="DynamicLogin.ascx.vb" 
AutoEventWireup="false" Explicit="True" %>

<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
  <% if CStr(Settings("FaceBookAppID")) <> "" then %>
<div id="fb-root"></div>
<script>
var DEBUG=false;
window.fbAsyncInit = function()
{
    FB.Event.subscribe('auth.statusChange', onFacebookStatusChange);
    FB.init({
      appId  : '<% = CStr(Settings("FaceBookAppID")) %>',
      status : true, // check login status
      cookie : true, // enable cookies to allow the server to access the session
      xfbml  : true,  // parse XFBML
      oauth:true
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
    FB.login(onFacebookLoginStatus, {scope:'<% = CStr(GetFacebookPerms()) %>'});
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
		  +" \nresponse.session="+response.authResponse.accessToken
		  +" \nresponse.scope="+response.scope);
	}
    if (response.status=="connected" && response.authResponse.accessToken)
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


function setCookie(name,value,days) {    if (days) {        var date = new Date();        date.setTime(date.getTime
()+(days*24*60*60*1000));        var expires = "; expires="+date.toGMTString();    }    else var expires = "";    
document.cookie = name+"="+value+expires+"; path=/";}


/*
* Callback function for 'auth.statusChange' event.
*/
function onFacebookStatusChange(response)
{
    if (DEBUG)
	{
		alert("onFacebookStatusChange(), "
		  + "\nresponse.status="+response.status
		  +" \nresponse.session="+response.authResponse.accessToken
		  +" \nresponse.scope="+response.scope);
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
		  +" \nresponse.session="+response.authResponse.accessToken
		  +" \nresponse.scope="+response.scope);
	}
    if (response.status=="connected" && response.authResponse)
    {
		//alert("You are all set... We now need to get the access token and do a JavaScript refresh.");
		setCookie('dsoauth2', response.authResponse.accessToken, 1);               

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
<asp:LinkButton ID="lnkToken" runat="server" Visible="false" OnClick="lnkToken_Click">click</asp:LinkButton>
<asp:LinkButton ID="lnkToken2" runat="server" Visible="false" OnClick="lnkToken2_Click">click</asp:LinkButton>

<asp:Literal ID="litStyle" runat="server"></asp:Literal>
<asp:Literal ID="litTemplate" runat="server"></asp:Literal>
<asp:LinkButton ID="lnkContinue" runat="server" Visible=False></asp:LinkButton>
<asp:hiddenfield ID="objDDL" runat="server" value="False"></asp:hiddenfield>
<asp:Label ID="lblAdminMsg" Font-Bold="true" ForeColor="red" Visible="false" runat="server"></asp:Label>