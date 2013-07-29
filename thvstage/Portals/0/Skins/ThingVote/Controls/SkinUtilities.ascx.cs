
#region Usings

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Entities.Tabs;
using DotNetNuke.Entities.Users;
using DotNetNuke.Services.Authentication;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using DotNetNuke.Services.Social.Notifications;
using DotNetNuke.Services.Social.Messaging.Internal;
using DotNetNuke.UI.UserControls;
using DotNetNuke.UI.Skins;


#endregion



namespace Bootstrap.DNN
{
    public partial class SkinUtilities : SkinObjectBase
    {
        protected override void OnInit(EventArgs e)
        {
            SetRegistrationLink();
        }

        protected void SetRegistrationLink()
        {
            string navUrl = Globals.RegisterURL(HttpUtility.UrlEncode(
                Globals.NavigateURL()), Null.NullString);
            this.RegistrationLink = "return " + UrlUtils.PopUpUrl(navUrl, this, 
                PortalSettings, true, false, 600, 950);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
           

        public string RegistrationLink { get; set; }
        
        public string FacebookAppId {
            get
            {
                var modules = new ModuleController();
                
                ModuleInfo dl = modules.GetModuleByDefinition(
                    PortalSettings.PortalId, "Dynamic Login");
                var settings = modules.GetModuleSettings(dl.ModuleID);
                if (settings.ContainsKey("FaceBookAppID"))
                {
                    return settings["FaceBookAppID"].ToString();
                }else
                {
                    return "";
                }
            }
        }
    } 
}