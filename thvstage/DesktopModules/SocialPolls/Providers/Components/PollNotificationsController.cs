using DotNetNuke.Entities.Users;
using DotNetNuke.Services.Localization;
using DotNetNuke.Services.Social.Notifications;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace DotNetNuke.Modules.SocialPolls
{
    public class PollNotificationsController
    {

        public static void AddNotification(UserInfo initiatingUser, UserInfo targetUser, 
            string name, string nsubject, string nbody)
        {
            //get profile link to user
            string profileLink = GetProfileLink(initiatingUser.UserID, 
                initiatingUser.DisplayName); 
             
            var notificationType = NotificationsController.Instance.GetNotificationType(name);
            var subject = string.Format(Localization.GetString(nsubject, 
                Constants.THV_GlobalResources), 
                initiatingUser.DisplayName);

            var body = string.Format(Localization.GetString(nbody, 
                Constants.THV_GlobalResources),
                profileLink);

            var notification = new Notification
            {
                NotificationTypeID = notificationType.NotificationTypeId,
                Subject = subject,
                Body = body,
                IncludeDismissAction = true,
                Context = initiatingUser.UserID.ToString(CultureInfo.InvariantCulture),
                SenderUserID = initiatingUser.UserID
            };

            NotificationsController.Instance.SendNotification(notification, 
                initiatingUser.PortalID,
                null, new List<UserInfo> { targetUser });
        }

        public static void AddVotedOnNotification(UserInfo initiatingUser, 
            UserInfo targetUser)
        {
            string profileLink = GetProfileLink(initiatingUser.UserID, initiatingUser.DisplayName); 
            var notificationType = NotificationsController.Instance.GetNotificationType(Constants.NTF_VotedOn);
            var subject = string.Format(Localization.GetString(Constants.NTF_VotedOn_Subject,
                Constants.THV_GlobalResources), initiatingUser.DisplayName);

            var body = string.Format(Localization.GetString(Constants.NTF_VotedOn_Body, 
                Constants.THV_GlobalResources),profileLink);

            var notification = new Notification
            {
                NotificationTypeID = notificationType.NotificationTypeId,
                Subject = subject,
                Body = body,
                IncludeDismissAction = true,
                Context = initiatingUser.UserID.ToString(CultureInfo.InvariantCulture),
                SenderUserID = initiatingUser.UserID
            };

            NotificationsController.Instance.SendNotification(notification, initiatingUser.PortalID,
                null, new List<UserInfo> { targetUser });
        }

        public static void Add(UserInfo initiatingUser, UserInfo targetUser)
        {
            var notificationType = NotificationsController.Instance.GetNotificationType(Constants.NTF_VotedOn);
            var subject = string.Format(Localization.GetString(Constants.NTF_VotedOn_Subject,
                Constants.THV_GlobalResources), initiatingUser.DisplayName);

            var body = string.Format(Localization.GetString(Constants.NTF_VotedOn_Body,
                Constants.THV_GlobalResources), initiatingUser.DisplayName);

            var notification = new Notification
            {
                NotificationTypeID = notificationType.NotificationTypeId,
                Subject = subject,
                Body = body,
                IncludeDismissAction = true,
                Context = initiatingUser.UserID.ToString(CultureInfo.InvariantCulture),
                SenderUserID = initiatingUser.UserID
            };

            NotificationsController.Instance.SendNotification(notification, initiatingUser.PortalID,
                null, new List<UserInfo> { targetUser });
        }

        #region private methods
        /// <summary>
        /// Return a link to the profile wrapped inside a display name
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="displayName"></param>
        /// <returns></returns>
        public static string GetProfileLink(int userId, string displayName)
        {
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);

            HtmlAnchor a = new HtmlAnchor();
            a.HRef = String.Format(Constants.UserProfilePath, userId.ToString());
            //a.HRef = String.Format(a.HRef, Constants.UserDefaultTab);
            a.InnerText = displayName;
            a.RenderControl(htw);
            return sw.ToString();
        }
        #endregion
       
    }
}