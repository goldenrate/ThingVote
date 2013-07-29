#region Usings

using System;
using System.Collections;
using System.Web.Routing;
using System.Web.UI;
using System.Web.Script.Serialization;
using System.Linq;

using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework;
using DotNetNuke.UI.Modules;
using DotNetNuke.Web.Client.ClientResourceManagement;
using System.Collections.Generic;
using System.IO;
using System.Web;
using DotNetNuke.Entities.Users;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Entities.Modules;
using System.Net.Http;
using System.Net;
using ASPvia.SocialVotes.Models;

#endregion

namespace DotNetNuke.Modules.SocialPolls
{
    public class WizardInitData
    {
        public List<Category> Categories { get; set; }
        public List<VoteType> VoteTypes { get; set; }

    }

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The View class displays the content
    /// 
    /// Typically your view control would be used to display content or functionality in your module.
    /// 
    /// View may be the only control you have in your project depending on the complexity of your module
    /// 
    /// Because the control inherits from SocialPollsModuleBase you have access to any custom properties
    /// defined there, as well as properties from DNN such as PortalId, ModuleId, TabId, UserId and many more.
    /// 
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class View : SocialPollsModuleBase
    {
        protected override void OnInit(EventArgs e)
        {
            RegisterClientScripts();

            //Set properties 
            PortalSettings settings = PortalController.GetCurrentPortalSettings();

            //the user is authenticated 
            if (Request.IsAuthenticated)
            {
                var userController = new UserController();
                var user = userController.GetUser(settings.PortalId, UserId);
                DisplayName = user.DisplayName;
                //UserProfilePhotUrl = user.Profile.PhotoURL;

                //get init value
                var initFlag = user.Profile.GetPropertyValue("IsNew");
                if (initFlag == Null.NullString || initFlag == null)
                {
                    InitiateApplication(user);
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        

        #region private methods
        private void RegisterClientScripts()
        {
            ServicesFramework.Instance.RequestAjaxAntiForgerySupport();
            jQuery.RegisterJQueryUI(Page);
            jQuery.RegisterHoverIntent(Page);


            ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/knockout-2.2.1.js");
            //ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/knockout.validation.js");
            ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/jquery.validate.min.js");
            ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/toastr.min.js");
            ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/framework/SPAServicesFramework.js");
            ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/UploadImage/js/jquery.fileupload.js");
            ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/UploadImage/js/jquery.iframe-transport.js");
            ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/dnn.jquery.js");
            ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/jquery.nailthumb.1.1.min.js");
            ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/sammy.js");
            //ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/dove.js");
            ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/moment.min.js");
            ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/jquery.masonry.js");
        }

        /// <summary>
        /// If this method has been called then the application was never initiated for this 
        /// user and we need to add all the property definitios for this user 
        /// </summary>
        /// <param name="user"></param>
        private void InitiateApplication(UserInfo user)
        {
           
            user.Profile.SetProfileProperty("IsNew", "false");
            user.Profile.SetProfileProperty("VotesOnPolls", "false");
            user.Profile.SetProfileProperty("VotesOnVotedPolls", "false");
            user.Profile.SetProfileProperty("FriendsJoined", "false");
            user.Profile.SetProfileProperty("FacebookConnect", "false");
            user.Profile.SetProfileProperty("FacebookTimeline", "false");
            UserController.UpdateUser(PortalSettings.PortalId, user);
        }

        #endregion
        /// <summary>
        /// False if this user is not a new user, which means all properties 
        /// have been initialized for him 
        /// </summary>
       
        public int IsNew {get; set; }
        public string DisplayName { get; set; }
        public string UserProfilePhotUrl { get; set; }
        public int ProfileUserId
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.Params["UserId"]))
                {
                    return Int32.Parse(Request.Params["UserId"]);
                }

                return UserController.GetCurrentUserInfo().UserID;
            }
        }        
        protected int GroupId
        {
            get
            {
                int groupId = Null.NullInteger;
                if (!string.IsNullOrEmpty(Request.Params["GroupId"]))
                {
                    groupId = Int32.Parse(Request.Params["GroupId"]);
                }
                return groupId;
            }
        }
        protected string ViewProfileUrl
        {
            get
            {
                return Globals.NavigateURL(ModuleContext.PortalSettings.UserTabId, "", "userId=PROFILEUSER");
            }
        }
        protected string ProfileUrlUserToken
        {
            get
            {
                return "PROFILEUSER";
            }
        }
        public int MembersModuleId 
        {
            get
            {
                return 417;
            }
        }
        public int MembersTabId
        {
            get
            {
                return 86;
            }
        }

    }
}