/*
' Copyright (c) 2013  DotNetNuke Corporation
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
*/

using System;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Entities.Controllers;
using DotNetNuke.Services.Social.Notifications;
using DotNetNuke.Entities.Users;
using DotNetNuke.Services.Localization;

namespace DotNetNuke.Modules.SocialPolls
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The Settings class manages Module Settings
    /// 
    /// Typically your settings control would be used to manage settings for your module.
    /// There are two types of settings, ModuleSettings, and TabModuleSettings.
    /// 
    /// ModuleSettings apply to all "copies" of a module on a site, no matter which page the module is on. 
    /// 
    /// TabModuleSettings apply only to the current module on the current page, if you copy that module to
    /// another page the settings are not transferred.
    /// 
    /// If you happen to save both TabModuleSettings and ModuleSettings, TabModuleSettings overrides ModuleSettings.
    /// 
    /// Below we have some examples of how to access these settings but you will need to uncomment to use.
    /// 
    /// Because the control inherits from SocialPollsSettingsBase you have access to any custom properties
    /// defined there, as well as properties from DNN such as PortalId, ModuleId, TabId, UserId and many more.
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class Settings : SocialPollsModuleSettingsBase
    {
        #region Base Method Implementations

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// LoadSettings loads the settings from the Database and displays them
        /// </summary>
        /// -----------------------------------------------------------------------------
        public override void LoadSettings()
        {
            try
            {
                if (Page.IsPostBack == false)
                {
                    //Check for existing settings and use those on this page
                    //Settings["SettingName"]

                    // we update the init settings simply by disabling the button
                    if (Settings.Contains(Constants.IsInitSettings))
                    {
                        //btnInit.Visible = false;
                        //txtSetting1.Text = Settings[Constants.IsInitSettings].ToString();
                    }
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// UpdateSettings saves the modified settings to the Database
        /// </summary>
        /// -----------------------------------------------------------------------------
        public override void UpdateSettings()
        {
            try
            {
                var modules = new ModuleController();

                //the following are two sample Module Settings, using the text boxes that are commented out in the ASCX file.
                //module settings
                //modules.UpdateModuleSetting(ModuleId, "Setting1", txtSetting1.Text);
                //modules.UpdateModuleSetting(ModuleId, "Setting2", txtSetting2.Text);

                //tab module settings
                //modules.UpdateTabModuleSetting(TabModuleId, "Setting1",  txtSetting1.Text);
                //modules.UpdateTabModuleSetting(TabModuleId, "Setting2",  txtSetting2.Text);
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        #endregion

        protected void btnInit_Click(object sender, EventArgs e)
        {
            try
            {
                CreateNotifications();

                //if the initialization was successful then we set the application to be true 
                var modules = new ModuleController();
                modules.UpdateModuleSetting(ModuleId, Constants.IsInitSettings, "true");
            }
            catch (Exception exc)
            {
                
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        private void CreateNotifications()
        {
            NotificationsController nc = new NotificationsController();

            var votedOnNotificationType = new NotificationType
            {
                Name = Constants.NTF_VotedOn,
                Description = Constants.NTF_VotedOn
            };
            NotificationsController.Instance.CreateNotificationType(votedOnNotificationType);

            var fbFriendJoin = new NotificationType
            {
                Name = Constants.NTF_FacebookFriendJoin,
                Description = Constants.NTF_FacebookFriendJoin
            };
            NotificationsController.Instance.CreateNotificationType(fbFriendJoin);

            var pollByFollowed = new NotificationType
            {
                Name = Constants.NTF_NewPollByFollowed,
                Description = Constants.NTF_NewPollByFollowed
            };
            NotificationsController.Instance.CreateNotificationType(pollByFollowed);

            var votedOnSamePoll = new NotificationType
            {
                Name = Constants.NTF_VotedOnPollYouVoted,
                Description = Constants.NTF_VotedOnPollYouVoted
            };
            NotificationsController.Instance.CreateNotificationType(votedOnSamePoll);
        }

        private void AddVotedOnNotification()
        {

            var votedOnNotificationType = new NotificationType()
            {
                 Name = Constants.NTF_VotedOn,
                 Description = "The intiating user has voted orn one of the target user's polls"
            };

            // var actions = new List<NotificationTypeAction>();
            //actions.Add(new NotificationTypeAction
            //{
            //    NameResourceKey = "Accept",
            //    DescriptionResourceKey = "AcceptFriend",
            //    APICall = "DesktopModules/InternalServices/API/RelationshipService/AcceptFriend"
            //});
            
            NotificationsController.Instance.CreateNotificationType(votedOnNotificationType);
            //NotificationsController.Instance.SetNotificationTypeActions(actions, type.NotificationTypeId);
        }       
    }
}