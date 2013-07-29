<%@ Control Language="vb" AutoEventWireup="false" Codebehind="_ControlPanel.ascx.vb" Inherits="DataSprings.DNN.Modules.DynamicLogin.ControlPanel"	 TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="datasprings" TagName="DynamicLoginEdit" Src="DynamicLoginEdit.ascx" %>
<%@ Register TagPrefix="datasprings" TagName="DynamicLoginTemplate" Src="ManageLoginTemplate.ascx" %>
<%@ Register TagPrefix="datasprings" TagName="DynamicRoleEdit" Src="DynamicRoleEdit.ascx" %>
<%@ Register TagPrefix="datasprings" TagName="DynamicRoleGroupEdit" Src="DynamicRoleGroupEdit.ascx" %>
<%@ Register TagPrefix="datasprings" TagName="DynamicLoginSettings" Src="Settings.ascx" %>
<%@ Register TagPrefix="datasprings" TagName="dynamicloginiprestrictionsdiv" Src="DynamicIPRestrictions.ascx" %>
<%@ Register TagPrefix="datasprings" TagName="DynamicLoginSingleSignOn" Src="SingleSignOnSetup.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>


<script language="javascript">
  // Get a reference to the PageRequestManager.
  var prm = Sys.WebForms.PageRequestManager.getInstance();
 
  // Using that prm reference, hook _initializeRequest
  // and _endRequest, to run our code at the begin and end
  // of any async postbacks that occur.
 if (null != prm)
{
  prm.add_initializeRequest(InitializeRequest);
  prm.add_endRequest(EndRequest);
}
 
  // Executed anytime an async postback occurs.
  function InitializeRequest(sender, args) 
  {
    try
     {
     jQuery.blockUI({ message: '<div class="SubHead"><BR><BR><img src="<% =GetProgressURL()%>" />&nbsp;&nbsp;&nbsp;<BR><BR><% =GetProgressText()%></div><BR>' });

      }
    catch(err)
    {
    //Handle errors here
     }

      
  }
 
  // Executed when the async postback completes.
  function EndRequest(sender, args) 
  {
   

        try
       {
          jQuery.unblockUI();
       }
        catch(err)
        {
           //Handle errors here
         }


  }
</script>


<a name="dltoppage"></a>
<LINK media="screen" href="controlpanel.css" type="text/css" rel="StyleSheet">
<asp:Literal ID="litJavascript" runat="server"></asp:Literal>

<input id="CurrentDiv" type="hidden" runat="server">
<style id="DataSprings_ControlPanel" type="text/css">DIV.showdots { BORDER-RIGHT: #efefef 5px dotted; BORDER-TOP: #efefef 5px dotted; BORDER-LEFT: #efefef 5px dotted; BORDER-BOTTOM: #efefef 5px dotted }
	DIV.hidedots { BORDER-RIGHT: #efefef 0px dotted; BORDER-TOP: #efefef 0px dotted; BORDER-LEFT: #efefef 0px dotted; BORDER-BOTTOM: #efefef 0px dotted }
	DIV.showbg { BORDER-RIGHT: #efefef 0px dotted; BORDER-TOP: #efefef 0px dotted; BORDER-LEFT: #efefef 0px dotted; BORDER-BOTTOM: #efefef 0px dotted; BACKGROUND-COLOR: #efefef; layer-background-color: #EFEFEF }
	DIV.hidebg { BORDER-RIGHT: #efefef 0px dotted; BORDER-TOP: #efefef 0px dotted; BORDER-LEFT: #efefef 0px dotted; BORDER-BOTTOM: #efefef 0px dotted; BACKGROUND-COLOR: #ffffff; layer-background-color: #FFFFFF }
</style>
<script language="javascript" type="text/javascript"> 

var globalhiddenfield


function SetHiddenField(HiddenField) { 
globalhiddenfield = HiddenField; 

}

function hideBlocks(Questions) { 

hideDiv('dynamicloginmanagetemplatediv')
hideDiv('dynamicloginusernotificationdiv')
hideDiv('dynamicloginsettingsdiv')
hideDiv('dynamicloginrolesdiv')
hideDiv('dynamicloginrolegroupsdiv')
hideDiv('dynamicloginiprestrictionsdiv')
hideDiv('dynamicloginsinglesignondiv')



}


function setStyle(Questions) { 

el = document.getElementById('cpiTemplate'); 
el.className = "hidedots";

el = document.getElementById('cpiConfig'); 
el.className = "hidedots";
el = document.getElementById('cpiRoles'); 
el.className = "hidedots";
el = document.getElementById('cpiRoleGroups'); 
el.className = "hidedots";
el = document.getElementById('cpiUserNotification'); 
el.className = "hidedots";

el = document.getElementById('cpiIPRestriction'); 
el.className = "hidebg";

el = document.getElementById('cpiSingleSignOn'); 
el.className = "hidebg";


el = document.getElementById('cplTemplate'); 
el.className = "hidebg";

el = document.getElementById('cplConfig'); 
el.className = "hidebg";
el = document.getElementById('cplRoles'); 
el.className = "hidebg";
el = document.getElementById('cplRoleGroups'); 
el.className = "hidebg";

el = document.getElementById('cplUserNotification'); 
el.className = "hidebg";
el = document.getElementById('cplIPRestriction'); 
el.className = "hidebg";


el = document.getElementById('cplSingleSignOn'); 
el.className = "hidebg";



if (Questions == "dynamicloginsettingsdiv") {

el = document.getElementById('cpiConfig'); 
el.className = "showdots";
el = document.getElementById('cplConfig'); 
el.className = "showbg";
}

else if (Questions == "dynamicloginrolesdiv") {

el = document.getElementById('cpiRoles'); 
el.className = "showdots";
el = document.getElementById('cplRoles'); 
el.className = "showbg";
}


else if (Questions == "dynamicloginrolegroupsdiv") {

el = document.getElementById('cpiRoleGroups'); 
el.className = "showdots";
el = document.getElementById('cplRoleGroups'); 
el.className = "showbg";

}

else if (Questions == "dynamicloginmanagetemplatediv") {

el = document.getElementById('cpiTemplate'); 
el.className = "showdots";
el = document.getElementById('cplTemplate'); 
el.className = "showbg";
}

else if (Questions == "dynamicloginiprestrictionsdiv") {

el = document.getElementById('cpiIPRestriction'); 
el.className = "showdots";
el = document.getElementById('cplIPRestriction'); 
el.className = "showbg";
}

else if (Questions == "dynamicloginusernotificationdiv") {

el = document.getElementById('cpiUserNotification'); 
el.className = "showdots";
el = document.getElementById('cplUserNotification'); 
el.className = "showbg";
}



else if (Questions == "dynamicloginsinglesignondiv") {

el = document.getElementById('cpiSingleSignOn'); 
el.className = "showdots";
el = document.getElementById('cplSingleSignOn'); 
el.className = "showbg";
}

}



function showCurrentDiv(HiddenField) { 

globalhiddenfield = HiddenField;
showDiv(document.getElementById(HiddenField).value)

}


</script>
<script language="javascript" type="text/javascript"> 
function hideDiv(pass) { 
  
var divs = document.getElementsByTagName('div'); 

for(i=0;i<divs.length;i++){ 
if(divs[i].id.match(pass)){//if they are 'see' divs 

if (document.getElementById) // DOM3 = IE5, NS6 
divs[i].style.display='none';// show/hide 

else 
if (document.layers) // Netscape 4 
document.layers[divs[i]].display = 'hidden'; 
else // IE 4 
document.all.hideShow.divs[i].visibility = 'hidden'; 

} 
} 
} 

function showDiv(pass) { 
hideBlocks('');

document.getElementById(globalhiddenfield).value = pass;

setStyle(pass)


var divs = document.getElementsByTagName('div'); 
for(i=0;i<divs.length;i++){ 
if(divs[i].id.match(pass)){ 
if (document.getElementById) 

divs[i].style.display='';// show/hide 

else 
if (document.layers) // Netscape 4 
document.layers[divs[i]].display = 'visible'; 
else // IE 4 
document.all.hideShow.divs[i].visibility = 'visible'; 
} 
} 
} 
</script>
<TABLE id="tblMainControlPanel" cellspacing="0" cellpadding="0" border="0" bgcolor="#ffffff"
	width="100%">
	<TR>
		<TD align="left">
			<table class="ControlPanel" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td>
						<table cellspacing="1" cellpadding="1" width="100%">
							<tr>
								<td valign="middle" nowrap align="left" width="25%">
									<asp:Label ID="lblOptControlPanel" EnableViewState="False" resourcekey="ControlPanel" CssClass="Head"
										runat="server"></asp:Label></td>
								<td valign="middle" align="center" width="50%">
								</td>
								<td valign="middle" nowrap align="right" width="25%">
									<asp:Label ID="lblControlVisibility" EnableViewState="False" resourcekey="Visibility" CssClass="SubHead"
										runat="server"></asp:Label><asp:LinkButton ID="cmdControlVisibility" runat="server" CausesValidation="False">
										<asp:Image ID="imgControlVisibility" runat="server"></asp:Image>
									</asp:LinkButton>&nbsp;
								</td>
							</tr>
							<tr id="rowDRControlPanel" runat="server">
								<td valign="middle" align="center" colspan="5">
									<table width="100%" bgcolor="#ffffff" border="0">
										<tr>
											<td align="center" width="25%">
												<div id="cpiTemplate">
													<a href="javascript:showDiv('dynamicloginmanagetemplatediv')">
														<asp:Image ID="imgTemplate" runat="server" AlternateText="Dynamic Login Template" ImageUrl="~/desktopmodules/Dynamic Login/Images/ControlPanel_ManageTemplate.jpg"></asp:Image></a></div>
											</td>
											<td align="center" width="25%">
												<div id="cpiConfig">
													<a href="javascript:showDiv('dynamicloginsettingsdiv')">
														<asp:Image ID="imgSettings" runat="server" AlternateText="Manage Module Configuration" ImageUrl="~/desktopmodules/Dynamic Login/Images/ControlPanel_ModuleConfig.jpg"></asp:Image></a></div>
											</td>
											<td align="center" width="25%">
												<div id="cpiRoles">
													<a href="javascript:showDiv('dynamicloginrolesdiv')">
														<asp:Image ID="imgManageRoleRules" runat="server" AlternateText="Manage Role Rules" ImageUrl="~/desktopmodules/Dynamic Login/Images/ControlPanel_Role.jpg"></asp:Image></a></div>
											</td>
											<td align="center" width="25%">
												<div id="cpiRoleGroups">
													<a href="javascript:showDiv('dynamicloginrolegroupsdiv')">
														<asp:Image ID="imgManageRoleGroupRules" runat="server" AlternateText="Manage Role Group Rules" ImageUrl="~/desktopmodules/Dynamic Login/Images/ControlPanel_RoleGroup.jpg"></asp:Image></a></div>
											</td>
										</tr>
										<tr>
											<td align="center" nowrap>
												<div id="cplTemplate" width="25%" nowrap>
													<asp:HyperLink ID="hypTemplate" runat="server" resourcekey="Template" NavigateUrl="javascript:showDiv('dynamicloginmanagetemplatediv')"
														Visible="true"></asp:HyperLink></div>
											</td>
											<td align="center" width="25%" nowrap>
												<div id="cplConfig" nowrap>
													<asp:HyperLink ID="hypSettings" runat="server" resourcekey="Settings" NavigateUrl="javascript:showDiv('dynamicloginsettingsdiv')"
														Visible="true"></asp:HyperLink></div>
											</td>
											<td align="center" width="25%" nowrap>
												<div id="cplRoles" nowrap>
													<asp:HyperLink ID="hypRoleRules" runat="server" resourcekey="RoleRules" NavigateUrl="javascript:showDiv('dynamicloginrolesdiv')"
														Visible="true"></asp:HyperLink></div>
											</td>
											<td align="center" nowrap>
												<div id="cplRoleGroups" width="25%" nowrap>
													<asp:HyperLink ID="hypRoleGroupRules" runat="server" resourcekey="RoleRuleGroups" NavigateUrl="javascript:showDiv('dynamicloginrolegroupsdiv')"
														Visible="true"></asp:HyperLink></div>
											</td>
										</tr>
									</table>
									<TABLE id="Table1" width="100%" bgColor="#ffffff" border="0">
										<TR>
											<TD align="center" width="25%">
												<DIV id="cpiUserNotification"><A href="javascript:showDiv('dynamicloginusernotificationdiv')">
														<asp:Image id="imgUserNotifications" runat="server" ImageUrl="~/desktopmodules/Dynamic Login/Images/ControlPanel_UserNotification.jpg"
															AlternateText="User Notifications"></asp:Image></A></DIV>
											</TD>
											<TD align="center" width="25%">
												<DIV id="cpiIPRestriction"><A href="javascript:showDiv('dynamicloginiprestrictionsdiv')">
														<asp:Image id="imgIPRestrictions" runat="server" ImageUrl="~/desktopmodules/Dynamic Login/Images/ControlPanel_IPRestriction.jpg"
															AlternateText="IP Restrictions"></asp:Image></A></DIV>
											</TD>
											<TD align="center" width="25%">
												<DIV id="cpiSingleSignOn"><A href="javascript:showDiv('dynamicloginsinglesignondiv')">
														<asp:Image id="ImgSingleSignOn" runat="server" ImageUrl="~/desktopmodules/Dynamic Login/Images/ControlPanel_SingleSignOn.jpg"
															AlternateText="Single Sign On"></asp:Image></A></DIV>
											</TD>
											<TD align="center" width="25%">
														<DIV id="cpiExit"><A href='<% =DotNetNuke.Common.NavigateURL(TabId) %>'>
														<asp:Image id="imgExt" runat="server" ImageUrl="~/desktopmodules/Dynamic Login/Images/ControlPanel_Exit.jpg"
															AlternateText="Exit"></asp:Image></A></DIV>
										
											</TD>
										</TR>
										<TR>
											<TD noWrap align="center" width="25%">
												<DIV id="cplUserNotification" noWrap>
													<asp:HyperLink id="hypUserNoficiations" runat="server" resourcekey="UserNotifications" Visible="true" NavigateUrl="javascript:showDiv('dynamicloginusernotificationdiv')"></asp:HyperLink></DIV>
											</TD>
											<TD noWrap align="center" width="25%">
												<DIV id="cplIPRestriction" noWrap>
													<asp:HyperLink id="hypIPRestrictions" runat="server" resourcekey="IPRestrictions" Visible="true" NavigateUrl="javascript:showDiv('dynamicloginiprestrictionsdiv')"></asp:HyperLink></DIV>
											</TD>
											<TD noWrap align="center">
												<DIV id="cplSingleSignOn" noWrap>
													<asp:HyperLink id="hypSingleSignOn" runat="server" resourcekey="SingleSignOn" Visible="true" NavigateUrl="javascript:showDiv('SingleSignOn')"></asp:HyperLink></DIV>
										
											</TD>
											<TD noWrap align="center">
												<DIV id="cplExit" noWrap width="25%">
													<asp:HyperLink id="hypExit" runat="server" resourcekey="Exit" Visible="true"></asp:HyperLink>
												</DIV>
											</TD>
										</TR>
									</TABLE>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<div id="dynamicloginmanagetemplatediv" align="left">
				<datasprings:DynamicLoginTemplate ID="MAnageLoginTemplate" runat="server"></datasprings:DynamicLoginTemplate>
			
			</div>
			<div id="dynamicloginsettingsdiv" align="left">
					<datasprings:DynamicLoginSettings ID="DynamicSettings" runat="server"></datasprings:DynamicLoginSettings>
			
			</div>
			<div id="dynamicloginrolesdiv" align="left">
				<datasprings:DynamicRoleEdit ID="DynamicRoleEdit" runat="server"></datasprings:DynamicRoleEdit>
				

			</div>
			<div id="dynamicloginrolegroupsdiv" align="left">
				<datasprings:DynamicRoleGroupEdit ID="DynamicRoleGroupEdit" runat="server"></datasprings:DynamicRoleGroupEdit>
			</div>
			<div id="dynamicloginusernotificationdiv" align="left">
				<datasprings:DynamicLoginEdit ID="DynamicLoginEdit" runat="server"></datasprings:DynamicLoginEdit>
			</div>
			<div id="dynamicloginiprestrictionsdiv" align="left">
				<datasprings:dynamicloginiprestrictionsdiv ID="DynamicIPRestrictions" runat="server"></datasprings:dynamicloginiprestrictionsdiv>
			</div>
			<div id="dynamicloginsinglesignondiv" align="left">
				<datasprings:DynamicLoginSingleSignOn ID="SingleSignOnSetup" runat="server"></datasprings:DynamicLoginSingleSignOn>
			</div>
		</TD>
	</TR>
<TR> <TD align="center"><BR><asp:hyperlink id="lnkExitControlPanel" runat="server" resourceKey="lnkExit.Text"></asp:hyperlink>
</TD></<TR>
</TABLE>
