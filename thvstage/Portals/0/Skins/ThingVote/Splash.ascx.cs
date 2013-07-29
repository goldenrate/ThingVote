using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.UI.Skins;
using DotNetNuke.Framework;
using DotNetNuke.Web.Client;
using DotNetNuke.Web.Client.ClientResourceManagement;
using DotNetNuke.Entities.Tabs;
using DotNetNuke.Entities.Users;

namespace ThingvoteSkin
{
    public partial class Splash : Skin
    {

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            UserInfo currentUser = UserController.GetCurrentUserInfo();
            if (Request.IsAuthenticated && !currentUser.IsSuperUser)
            {
                string url = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, "") + "/App.aspx#/";
                Page.Response.Redirect(url);
            }
            else
            {
                RegisterClientScripts();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void RegisterClientScripts()
        {
            ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/knockout-2.2.1.js");
            //ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/knockout.validation.js");
            ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/jquery.validate.min.js");
            ClientResourceManager.RegisterScript(Page, "~/DesktopModules/SocialPolls/Scripts/toastr.min.js");
            ClientResourceManager.RegisterScript(Page, "~/js/Debug/dnn.ServicesFramework.js");
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
    }
}