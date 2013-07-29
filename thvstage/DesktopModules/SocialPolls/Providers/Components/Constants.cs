using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DotNetNuke.Modules.SocialPolls
{
    public class Constants
    {
        public const string UserProfilePath = "/#/my/{0}";
        public const string UserProfilePathWTab = "/#/my/{0}/{1}";
        public const string UserDefaultTab = "polls";   

        /// <summary>
        /// DNN APP PATHS
        /// </summary>
        public const string ModulePath = "~/DesktopModules/SocialPolls/";
        public const string THV_GlobalResources = 
            ModulePath + "App_LocalResources/ThingVoteGlobal.resx";

        /// <summary>
        /// Indicates if the application was initialized  
        /// </summary>
        public const string IsInitSettings = "IsInitSettings";

        /// <summary>
        /// Voted On notification is whes someone voted your poll
        /// </summary>
        public const string NTF_VotedOn = "VotedOnPoll";
        public const string NTF_VotedOn_Subject = "VotedOnPoll";
        public const string NTF_VotedOn_Body = "VotedOnPollBody";

        /// <summary>
        /// When your facebook friend has join
        /// </summary>
        public const string NTF_FacebookFriendJoin = "FacebookFriendJoin";
        public const string NTF_FacebookFriendJoin_Subject = "FacebookFriendJoin";
        public const string NTF_FacebookFriendJoin_Body = "FacebookFriendJoinBody";

        /// <summary>
        /// When new poll was created by someone you follow
        /// </summary>
        public const string NTF_NewPollByFollowed = "NewPollByFollowed";
        public const string NTF_NewPollByFollowed_Subject = "NewPollByFollowed";
        public const string NTF_NewPollByFollowed_Body = "NewPollByFollowedBody";

        /// <summary>
        /// Voted on poll you voted 
        /// </summary>
        public const string NTF_VotedOnPollYouVoted = "VotedOnPollYouVoted";
        public const string NTF_VotedOnPollYouVoted_Subject = "VotedOnPollYouVoted";
        public const string NTF_VotedOnPollYouVoted_Body = "VotedOnPollYouVotedBody";
       

    }
}