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

namespace ThingvoteSkin
{
    public partial class PublicApp : Skin
    {

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            RegisterClientScripts();
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