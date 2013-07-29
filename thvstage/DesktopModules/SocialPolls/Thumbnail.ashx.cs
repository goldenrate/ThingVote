using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Drawing;
using System.Drawing.Imaging;

using System.Diagnostics;

using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Entities.Users;
using DotNetNuke.Services.FileSystem;
using System;

namespace DotNetNuke.Modules.SocialPolls
{
	public class Thumbnail : FileHandlerBase, IHttpHandler {
        string filter = "jpg,jpeg,gif,png";

		public void ProcessRequest (HttpContext context) {
			context.Response.ContentType = "image/jpg";			
            try
            {
                if (!String.IsNullOrEmpty(context.Request.QueryString["tnmaxwidth"]))
                {
                    ThumMaxWidth = Convert.ToInt32(context.Request.QueryString["tnmaxwidth"]);
                }

                if (!String.IsNullOrEmpty(context.Request.QueryString["tnmaxheight"]))
                {
                    ThumbMaxHeight = Convert.ToInt32(context.Request.QueryString["tnmaxheight"]);
                }

                if (!String.IsNullOrEmpty(context.Request.QueryString["ownerId"]))
                {
                    PollOwnerId = Convert.ToInt32(context.Request.QueryString["ownerId"]);
                }
                if (!String.IsNullOrEmpty(context.Request.QueryString["w"]))
                {
                    ThumbWidth = Convert.ToInt32(context.Request.QueryString["w"]);
                }

                if (!String.IsNullOrEmpty(context.Request.QueryString["h"]))
                {
                    ThumbHeight = Convert.ToInt32(context.Request.QueryString["h"]);
                }
                DeliverFile(context);
            }
            catch (Exception exc)
            {
                Exceptions.LogException(exc);
                Exceptions.ProcessHttpException(context.Request);
            }
		}

        #region protected
        protected override void DeliverFile(HttpContext context)
        {
            FileName = (context.Request["f"]).ToString();
            var filePath = StorageRoot + FileName;            
            //the name of the thumbnail including its size 
            if (File.Exists(filePath))
            {
                CalculateThumbnailSize(filePath, ThumMaxWidth, ThumbMaxHeight);
                string thumbPath = StorageRoot + ThumbName;
                if (!File.Exists(thumbPath))
                {
                    CreateThumbnail(filePath, ThumMaxWidth, ThumbMaxHeight);
                    //Image tn = GetThumbnail(filePath, ThumMaxWidth, ThumbMaxHeight);
                    //tn.Save(thumbPath);
                    //tn.Dispose();
                }
                context.Response.ContentType = ContentType;
                context.Response.WriteFile(thumbPath);
                var serializer = new JavaScriptSerializer();
                var result = new { TNname = thumbPath };
                context.Response.Write(serializer.Serialize(result));
            }
        }
        #endregion

        #region properties       
        public bool IsReusable { get { return false; } }
        public string ThumbnailPath { get; set; }
        #endregion
	}
}
