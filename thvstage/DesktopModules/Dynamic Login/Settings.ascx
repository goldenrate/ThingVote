<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Settings.ascx.vb" Inherits="DataSprings.DNN.Modules.DynamicLogin.Settings" %>
<%@ Register TagPrefix="Portal" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<asp:UpdatePanel ID="UpdatePanelDynamicSettings" runat="server">
 <ContentTemplate>
<asp:Literal id="litDESC" runat="server"></asp:Literal>
<dnn:SectionHead ID="dshGeneral" runat="server" ResourceKey="General" CssClass="Head" Section="tblSettings" IncludeRule="True" IsExpanded="True"></dnn:SectionHead>
<TABLE id="tblSettings"  cellSpacing="2" cellPadding="2" border="0" runat="server">
	<TR>
		<TD valign="top" class="SubHead"><dnn:label id="plDefaultRedirectLink" runat="server" suffix=":" controlname="txtRecordsPerPage"></dnn:label></TD>
		<TD valign="top">
			<portal:url id="ctlURL" runat="server" shownewwindow="False" showfiles="false" showtrack="False" showlog="false"
				width="250"></portal:url></TD>
	</TR>
	<TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plEmailTemplate" controlname="txtEmailTemplate" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtEmailTemplate" runat="server" CssClass="NormalTextBox" Width="300px" TextMode="MultiLine"
				Rows="10">%UserName% signed on %Date%</asp:TextBox></TD>
	</TR>



        <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plOverrideRedirection" controlname="chkOverrideRedirection" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:CheckBox id="chkOverrideRedirection" runat="server"></asp:CheckBox></TD>
	</TR>

      <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plShowFirstLoginMessage" controlname="chkShowFirstLoginMessage" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:CheckBox id="chkShowFirstLoginMessage" runat="server"></asp:CheckBox></TD>
	</TR>
	<TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFirstLoginMessage" controlname="txtFirstLoginMessage" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtFirstLoginMessage" runat="server" CssClass="NormalTextBox" Width="300px" TextMode="MultiLine"
				Rows="10"></asp:TextBox></TD>
	</TR>


        <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plEmailLogin" controlname="chkEnableEmailLogin" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:CheckBox id="chkEnableEmailLogin" runat="server"></asp:CheckBox></TD>
	</TR>


     <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plUserIDLogin" controlname="chkEnableUserIDLogin" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:CheckBox id="chkEnableUserIDLogin" runat="server"></asp:CheckBox></TD>
	</TR>
 <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plSamePage" controlname="chkSamePage" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:CheckBox id="chkSamePage" runat="server"></asp:CheckBox></TD>
	</TR>

 <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plDefaultRememberMe" controlname="chkDefaultRememberMe" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:CheckBox id="chkDefaultRememberMe" runat="server"></asp:CheckBox></TD>
	</TR>

 <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plNoFocus" controlname="chkNoFocus" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:CheckBox id="chkNoFocus" runat="server"></asp:CheckBox></TD>
	</TR>
 <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plShowUsernamePWBackground" controlname="chkShowUsernamePasswordBackgroundImage" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:CheckBox id="chkShowUsernamePasswordBackgroundImage" runat="server"></asp:CheckBox></TD>
	</TR>

        <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plUsernameWatermark" controlname="txtUserNameWatermark" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtUserNameWatermark" runat="server" CssClass="NormalTextBox" Width="120px"></asp:TextBox></TD>
	</TR>
        <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plPasswordWatermark" controlname="txtPasswordWatermark" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtPasswordWatermark" runat="server" CssClass="NormalTextBox" Width="120px"></asp:TextBox></TD>
	</TR>

    <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plHideQuickMenu" controlname="chkHideQuickMenu" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:CheckBox id="chkHideQuickMenu" runat="server" CssClass="NormalTextBox"></asp:CheckBox></TD>
	</TR>


</TABLE>


<dnn:SectionHead ID="dshButtonType" runat="server" ResourceKey="ButtonType" CssClass="Head" Section="tblButtonType" IncludeRule="True" IsExpanded="False"></dnn:SectionHead>
<TABLE id="tblButtonType" runat="server" cellSpacing="2" cellPadding="2" border="0">

	<TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plEnableImages" controlname="chkEnableImages" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
		
 			<asp:DropDownList ID="cboButtonType" runat="server" CssClass="NormalTextbox">
                        <asp:ListItem Value="link" ResourceKey="LinkButton"></asp:ListItem>
                        <asp:ListItem Value="input" ResourceKey="InputButton"></asp:ListItem>
                        <asp:ListItem Value="image" ResourceKey="ImageButton"></asp:ListItem>
                       </asp:DropDownList>
</TD>
	</TR>
	<TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plLoginImage" controlname="ctlLoginImage" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<portal:url id="ctlLoginImage" runat="server" showTabs="False" width="250" showlog="false" showtrack="False"
				shownewwindow="False"></portal:url></TD>
	</TR>
	<TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plRegisterImage" controlname="ctlRegisterImage" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<portal:url id="ctlRegisterImage" runat="server"  showTabs="False" width="250" showlog="false" showtrack="False"
				shownewwindow="False"></portal:url></TD>
	</TR>
	<TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plPasswordReminderImage" controlname="ctlPasswordReminderImage" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<portal:url id="ctlPasswordReminderImage" runat="server"  showTabs="False" width="250" showlog="false" showtrack="False"
				shownewwindow="False"></portal:url></TD>
	</TR>
</TABLE>



<dnn:SectionHead ID="dshForcePRofile" runat="server" ResourceKey="ForceProfile" CssClass="Head" Section="tblForce" IncludeRule="True" IsExpanded="False"></dnn:SectionHead>
<TABLE id="tblForce"  cellSpacing="2" cellPadding="2" border="0"  runat="server">

	
	<TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plInvalidProfile" controlname="ctlProfileChange" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<portal:url id="ctlProfileChange" runat="server" showTabs="True" showfiles="false" width="250" showlog="false" showtrack="False"
				shownewwindow="False"></portal:url></TD>
	</TR>
	<TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plForcePasswordChange" controlname="ctlForcePasswordChange" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<portal:url id="ctlForcePasswordChange" runat="server" showTabs="True" showfiles="false" width="250" showlog="false" showtrack="False"
				shownewwindow="False"></portal:url></TD>
	</TR>
</TABLE>
<dnn:SectionHead ID="dshStyleSheet" runat="server" ResourceKey="DNNStyleSheet" CssClass="Head"
                        Section="tblStyleSheet" IncludeRule="True" IsExpanded="False"></dnn:SectionHead>
                    <table id="tblStyleSheet" runat="server">
                        
                        <tr>
                            <td align="left" width="285" height="24">
                                <asp:TextBox ID="txtStyleSheet" runat="server" CssClass="NormalTextBox" Width="450px"
                                    Height="252px" TextMode="MultiLine"></asp:TextBox></td>
                           
                        </tr>
                       
                    </table>
                  
<dnn:SectionHead ID="dshSQLExecution" runat="server" ResourceKey="SQLExecution" CssClass="Head"
                        Section="tblSQLExecution" IncludeRule="True" IsExpanded="False"></dnn:SectionHead>
                    <table id="tblSQLExecution" runat="server">
                        <TR>
				<TD align="left" ColSpan="2">
					<asp:Literal id="litSQLExecution" runat="server"></asp:Literal></TD>
			</TR>                       
                        <tr>
				<TD class="SubHead" vAlign="top">
				<dnn:label id="plSQLExecution" controlname="txtSQLExecution" suffix=":" runat="server"></dnn:label></TD>
                            <td align="left" width="285" height="24">
                                <asp:TextBox ID="txtSQLExecution" runat="server" CssClass="NormalTextBox" Width="400px" Height="200px" TextMode="MultiLine"></asp:TextBox></td>
		
                           
                        </tr>
                       
                    </table>
                <dnn:SectionHead ID="dshFaceBookIntegration" runat="server" ResourceKey="FacebookIntegration" CssClass="Head"
                        Section="tblFacebookIntegration" IncludeRule="True" IsExpanded="False"></dnn:SectionHead>
                    <table id="tblFacebookIntegration" runat="server">
                        <TR>
				<TD align="left">
					<asp:Literal id="litFacebookIntegration" runat="server"></asp:Literal></TD>
			</TR>                       
                     
                         <TR>
				<TD align="left">
                               <dnn:SectionHead ID="dshFaceBookIntegrationGeneral" runat="server" ResourceKey="FacebookIntegrationGeneral" CssClass="Head"
                             Section="tblFacebookIntegrationGeneral" IncludeRule="True" IsExpanded="True"></dnn:SectionHead>
			       <table id="tblFacebookIntegrationGeneral" runat="server">


		<TR>
                   <TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookAppID" controlname="txtFaceBookAppID" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtFaceBookAppID" runat="server" CssClass="NormalTextBox" Width="400px"></asp:TextBox></TD>
	       </TR>
               <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookAppKey" controlname="txtFaceBookAppKey" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtFacebookAppKey" runat="server" CssClass="NormalTextBox" Width="400px"></asp:TextBox></TD>
	        </TR>

                <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookAppSecret" controlname="txtFaceBookAppSecret" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtFacebookAppSecret" runat="server" CssClass="NormalTextBox" Width="400px"></asp:TextBox></TD>
	        </TR>


                 <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookUserCreationType" controlname="optFacebookUserCreationType"   suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			 <asp:RadioButtonList ID="optFacebookUserCreationType" RepeatDirection="Horizontal" RepeatColumns="2" runat="server" CssClass="NormalTextbox">
                         <asp:ListItem Value="none" ResourceKey="createuser"></asp:ListItem>
                         <asp:ListItem Value="userid" ResourceKey="createuser0"></asp:ListItem>
                         <asp:ListItem Value="email" ResourceKey="createuser1"></asp:ListItem>
                       </asp:RadioButtonList>
                </TD>
	        </TR>
                 <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookRedirectPage" controlname="txtFaceBookRedirectPage" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtFacebookRedirectPage" runat="server" RowNumbers="2" CssClass="NormalTextBox" Width="400px"></asp:TextBox></TD>
	        </TR>


                    <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookUserNamePrefix" controlname="txtFacebookUserNamePrefix" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtFacebookUserNamePrefix" runat="server" CssClass="NormalTextBox" Width="120px"></asp:TextBox>
                </TD>
	        </TR>

                    <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookUserExistsWithEmail" controlname="txtUserNamePrefix" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">

                       <asp:CheckBox id="chkFacebookUserExistsWithEmail" runat="server"></asp:CheckBox>
                </TD>
	        </TR>

                 <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookStoreAltField" controlname="cboFacebookAltProfileField" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
		 <asp:DropDownList ID="cboFacebookAltProfileField"  runat="server" CssClass="NormalTextbox"> </asp:DropDownList>
                </TD>
	        </TR>

                 <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookUserStatus" controlname="cboFacebookUserStatus" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
		 <asp:DropDownList ID="cboFacebookUserstatus"  runat="server" CssClass="NormalTextbox"> </asp:DropDownList>
                </TD>
	        </TR>


         
                 <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookAdditionalParams" controlname="txtFacebookAdditionalParams" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtFacebookAdditionalParams" runat="server" CssClass="NormalTextBox" Width="400px" TextMode="MultiLine"
				Rows="2"></asp:TextBox>
                </TD>
	        </TR>


                <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookOAuthPageType" controlname="cboFacebookOAuthPageType" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			 <asp:DropDownList ID="cboFacebookOAuthPageType"  runat="server" CssClass="NormalTextbox">
                         <asp:ListItem Value="PopUp" ResourceKey="PopUp"></asp:ListItem>
                         <asp:ListItem Value="Page" ResourceKey="Page"></asp:ListItem>
                       
                       </asp:DropDownList>
                </TD>
	        </TR>

               <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookAltImage" controlname="txtFacebookAltImage" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtFacebookAltImage" runat="server" CssClass="NormalTextBox" Width="120px"></asp:TextBox>
                </TD>
	        </TR>

                <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookPostWhen" controlname="cboFacebookFacebookPostWhen" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			 <asp:DropDownList ID="cboFacebookPostWhen"  runat="server" CssClass="NormalTextbox">
                        <asp:ListItem Value="None" ResourceKey="None"></asp:ListItem>
                        <asp:ListItem Value="CreateUserOnly" ResourceKey="CreateUserOnly"></asp:ListItem>
                        <asp:ListItem Value="UpdateUserOnly" ResourceKey="UpdateUserOnly"></asp:ListItem>
                        <asp:ListItem Value="CreateAndUpdateUser" ResourceKey="CreateAndUser"></asp:ListItem>

                       </asp:DropDownList>
                </TD>
	        </TR>

 
                <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookSilentPostURL" controlname="txtFacebookSilentPostURL" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtFacebookSilentPostURL" runat="server" CssClass="NormalTextBox" Width="400px" TextMode="MultiLine"
				Rows="2"></asp:TextBox>
                </TD>
	        </TR>
                
               
                 <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookSilentPostContents" controlname="txtFacebookSilentPostContents" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtFacebookSilentPostContents" runat="server" CssClass="NormalTextBox" Width="400px" TextMode="MultiLine"
				Rows="5"></asp:TextBox>
                </TD>
	        </TR>

                            </table>
                          </TD>
			</TR> 

                        <TR>
				<TD align="left">
                               <dnn:SectionHead ID="dshFaceBookIntegrationWallPosts" runat="server" ResourceKey="FacebookIntegrationWallPosts" CssClass="Head"
                             Section="tblFacebookIntegrationWallPosts" IncludeRule="True" IsExpanded="False"></dnn:SectionHead>
			       <table id="tblFacebookIntegrationWallPosts" runat="server">

                <TR>
  		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookUpdateUsersWallPost" controlname="chkFacebookUpdateUsersWallPost" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">

                       <asp:CheckBox id="chkFacebookUpdateUsersWallPost" runat="server"></asp:CheckBox>
                </TD>
	        </TR>

                 <TR>
  		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookWallPostDelay" controlname="txtFacebookWallPostDelay" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">

                      <asp:TextBox id="txtFacebookWallPostDelay" runat="server" CssClass="NormalTextBox" Width="220px"></asp:TextBox>
                </TD>
	        </TR>


               <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookWallTitle" controlname="txtFacebookWallTitle" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtFacebookWallTitle" runat="server" CssClass="NormalTextBox" Width="220px"></asp:TextBox>
                </TD>
	        </TR>


                 <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookWallMessage" controlname="txtFacebookWallMessage" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtFacebookWallMessage" runat="server" CssClass="NormalTextBox" Width="400px" TextMode="MultiLine"
				Rows="2"></asp:TextBox>
                </TD>
	        </TR>
                
                <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookWallLink" controlname="txtFacebookWallLink" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtFacebookWallLink" runat="server" CssClass="NormalTextBox" Width="200px"></asp:TextBox>
                </TD>
	        </TR>


               <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plFacebookWallImage" controlname="txtFacebookWallImage" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtFacebookWallImage" runat="server" CssClass="NormalTextBox" Width="200px"></asp:TextBox>
                </TD>
	        </TR>

                               </table>
                               </td></tr>               
           
                       
                    </table>
                    
                    <dnn:SectionHead ID="dshTwitterIntegration" runat="server" ResourceKey="TwitterIntegration" CssClass="Head"
                        Section="tblTwitterIntegration" IncludeRule="True" IsExpanded="False"></dnn:SectionHead>
                    <table id="tblTwitterIntegration" style="width:100%" runat="server">
                         <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plTwitterConsumerKey" controlname="txtTwitterConsumerKey" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtTwitterConsumerKey" runat="server" CssClass="NormalTextBox" Width="200px"></asp:TextBox>
                </TD>
	        </TR>
	        <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plTwitterConsumerSecret" controlname="txtTwitterConsumerSecret" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtTwitterConsumerSecret" runat="server" CssClass="NormalTextBox" Width="200px"></asp:TextBox>
                </TD>
	        </TR>
		<TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plTwitterUserCreationType" controlname="optTwitterUserCreationType"   suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			 <asp:RadioButtonList ID="optTwitterUserCreationType" RepeatDirection="Horizontal" RepeatColumns="2" runat="server" CssClass="NormalTextbox">
                         <asp:ListItem Value="Twitter UserID" ResourceKey="Tcreateuser0"></asp:ListItem>
                         <asp:ListItem Value="Twitter Screen Name" ResourceKey="Tcreateuser1"></asp:ListItem>
                       </asp:RadioButtonList>
                </TD>
	        </TR>	      
	        <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plTwitterUserNamePrefix" controlname="txtTwitterUserNamePrefix" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtTwitterUserNamePrefix" runat="server" CssClass="NormalTextBox" Width="120px"></asp:TextBox>
                </TD>
	        </TR>  
	          <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plTwitterStoreAltField" controlname="cboTwitterAltProfileField" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
		 <asp:DropDownList ID="cboTwitterAltProfileField"  runat="server" CssClass="NormalTextbox"> </asp:DropDownList>
                </TD>
	        </TR>

                 <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plTwitterUserStatus" controlname="cboTwitterUserStatus" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
		 <asp:DropDownList ID="cboTwitterUserstatus"  runat="server" CssClass="NormalTextbox"> </asp:DropDownList>
                </TD>
	        </TR>
	          <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plTwitterOAuthPageType" controlname="cboTwitterOAuthPageType" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			 <asp:DropDownList ID="cboTwitterOAuthPageType"  runat="server" CssClass="NormalTextbox">
                         <asp:ListItem Value="PopUp" ResourceKey="PopUp"></asp:ListItem>
                         <asp:ListItem Value="Page" ResourceKey="Page"></asp:ListItem>
                       
                       </asp:DropDownList>
                </TD>
	        </TR>
	        <TR>
  		<TD class="SubHead" vAlign="top">
			<dnn:label id="plTwitterUpdateUsersTweet" controlname="chkTwitterUpdateUsersTweet" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
                       <asp:CheckBox id="chkTwitterUpdateUsersTweet" runat="server"></asp:CheckBox>
                </TD>
	        </TR>
	        	        <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plTwitterUsersTweet" controlname="txtTwitterUsersTweet" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtTwitterUsersTweet" runat="server" CssClass="NormalTextBox" Width="400px" TextMode="MultiLine"
				Rows="2"></asp:TextBox>
                </TD>
	        </TR>

			</table>
			
			        <dnn:SectionHead ID="dshLinkedinIntegration" runat="server" ResourceKey="LinkedinIntegration" CssClass="Head"
                        Section="tblLinkedinIntegration" IncludeRule="True" IsExpanded="False"></dnn:SectionHead>
                    <table id="tblLinkedinIntegration" style="width:100%" runat="server">
                         <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plLinkedinApiKey" controlname="txtLinkedinApiKey" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtLinkedinApiKey" runat="server" CssClass="NormalTextBox" Width="200px"></asp:TextBox>
                </TD>
	        </TR>
	                                 <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plLinkedinSecretKey" controlname="txtLinkedinSecretKey" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtLinkedinSecretKey" runat="server" CssClass="NormalTextBox" Width="200px"></asp:TextBox>
                </TD>
	        </TR>
<%--	        	        	        <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plLinkedinUserCreationType" controlname="optLinkedinUserCreationType"   suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			 <asp:RadioButtonList ID="optLinkedinUserCreationType" RepeatDirection="Horizontal" RepeatColumns="2" runat="server" CssClass="NormalTextbox">
                         <asp:ListItem Value="userid" ResourceKey="Lcreateuser0"></asp:ListItem>
                         <asp:ListItem Value="lname" ResourceKey="Lcreateuser1"></asp:ListItem>
                       </asp:RadioButtonList>
                </TD>
	        </TR>--%>	      
	        <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plLinkedinUserNamePrefix" controlname="txtLinkedinUserNamePrefix" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtLinkedinUserNamePrefix" runat="server" CssClass="NormalTextBox" Width="120px"></asp:TextBox>
                </TD>
	        </TR>  
	          <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plLinkedinStoreAltField" controlname="cboLinkedinAltProfileField" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
		 <asp:DropDownList ID="cboLinkedinAltProfileField"  runat="server" CssClass="NormalTextbox"> </asp:DropDownList>
                </TD>
	        </TR>

                 <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plLinkedinUserCreateStatus" controlname="cboLinkedinUserStatus" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
		 <asp:DropDownList ID="cboLinkedinUserstatus"  runat="server" CssClass="NormalTextbox"> </asp:DropDownList>
                </TD>
	        </TR>
	          <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plLinkedinOAuthPageType" controlname="cboLinkedinOAuthPageType" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			 <asp:DropDownList ID="cboLinkedinOAuthPageType"  runat="server" CssClass="NormalTextbox">
                         <asp:ListItem Value="PopUp" ResourceKey="PopUp"></asp:ListItem>
                         <asp:ListItem Value="Page" ResourceKey="Page"></asp:ListItem>
                       
                       </asp:DropDownList>
                </TD>
	        </TR>
	        	        <TR>
  		<TD class="SubHead" vAlign="top">
			<dnn:label id="plLinkedinUpdateUsersPost" controlname="chkLinkedinUpdateUsersStatus" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
                       <asp:CheckBox id="chkLinkedinUpdateUsersStatus" runat="server"></asp:CheckBox>
                </TD>
	        </TR>
	        	        <TR>
		<TD class="SubHead" vAlign="top">
			<dnn:label id="plLinkedinUserStatus" controlname="txtLinkedinUserStatus" suffix=":" runat="server"></dnn:label></TD>
		<TD vAlign="top">
			<asp:TextBox id="txtLinkedinUserStatus" runat="server" CssClass="NormalTextBox" Width="400px" TextMode="MultiLine"
				Rows="2"></asp:TextBox>
                </TD>
	        </TR>
			</table>
			

<P align="center"><asp:linkbutton id="lnkSave" runat="server" ResourceKey="Save">Save</asp:linkbutton>&nbsp;</p>

</ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanelDynamicSettings"> 
            <ProgressTemplate> 

                     </ProgressTemplate> 
        </asp:UpdateProgress> 

