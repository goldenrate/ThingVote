using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Drawing;

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
    public class FileTransferHandler : FileHandlerBase, IHttpHandler
    {
		private readonly JavaScriptSerializer js = new JavaScriptSerializer();

        #region properties
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        #endregion	

        #region MyRegion
        int tnMaxWidth = 202;
        int tnMaxHeight = 205;
        string filter = "jpg,jpeg,gif,png";
        #endregion

		public void ProcessRequest (HttpContext context) {
			context.Response.AddHeader("Pragma", "no-cache");
			context.Response.AddHeader("Cache-Control", "private, no-cache");
            try
            {
                if (!String.IsNullOrEmpty(context.Request.QueryString["tnmaxwidth"]))
                {
                    tnMaxWidth = Convert.ToInt32(context.Request.QueryString["tnmaxwidth"]);
                }

                if (!String.IsNullOrEmpty(context.Request.QueryString["tnmaxheight"]))
                {
                    tnMaxHeight = Convert.ToInt32(context.Request.QueryString["tnmaxheight"]);
                }                
            }
            catch (Exception)
            {
                Exceptions.ProcessHttpException(context.Request);
            }

            HandleMethod(context);
		}

		// Handle request based on method
		private void HandleMethod (HttpContext context) {
           
            switch (context.Request.HttpMethod) {
				case "HEAD":
				case "GET":
					if (GivenFilename(context)) 
                        DeliverFile(context);
					else 
                        ListCurrentFiles(context);
					break;
				case "POST":
				case "PUT":
                    postHandler(context);
					break;			
				case "OPTIONS":
					ReturnOptions(context);
					break;

				default:
					context.Response.ClearHeaders();
					context.Response.StatusCode = 405;
					break;
			}
		}

        private void postHandler(HttpContext context)
        {
            var action = context.Request.Form["action"];
            if (action != null)
            {               
                switch (action)
                {
                    case "delete":
                        DeleteFile(context);
                        break;
                    default:
                        break;
                }
            }
            else
            {
                UploadFile(context);
            }
        }

		private static void ReturnOptions(HttpContext context) {
			context.Response.AddHeader("Allow", "DELETE,GET,HEAD,POST,PUT,OPTIONS");
			context.Response.StatusCode = 200;
		}

		// Delete file from the server
		private void DeleteFile (HttpContext context) {
            //FileName = Path.Get
			var filePath = StorageRoot + context.Request["f"];
            if (File.Exists(filePath))
            {
                //var file = File.
                FileName = Path.GetFileName(filePath);
                System.IO.FileInfo file = new System.IO.FileInfo(filePath);
                FilesStatus status = new FilesStatus(file);

                if (!IsFileLocked(filePath))
                {
                    DeleteFile(filePath, UserFolderUrl);
                    status.delete_status = Status.success;
                    status.tnails_delete_status = DeleteThumbnails(filePath);
                }
                else
                {
                    //we try a few times before giving up
                    int cap = 100;
                    status.delete_status = Status.failure;

                }
                ResponseWithJSON(context, status);

            }
            else
            {
                //the file was already deleted but it's still exist on the client side
                if (context.Request["f"] != null)
                {
                    FileName = context.Request["f"];
                    FilesStatus status = new FilesStatus(FileName, 0);
                    status.FileExist = false;
                    ResponseWithJSON(context, status);
                }

            }
		}

        private void ResponseWithJSON(HttpContext context, FilesStatus status)
        {
            string jsonObj = js.Serialize(status);
            context.Response.AddHeader("Content-Disposition", "inline; filename=\"deleteResults.json\"");
            context.Response.Write(jsonObj);
            context.Response.ContentType = "application/json";
        }



        private Status DeleteThumbnails(string filePath)
        {
            try
            {
                //delet all its thumbnails
                string dir = Path.GetDirectoryName(filePath);
                string noExt = Path.GetFileNameWithoutExtension(FileName);
                var thumbs = Directory.GetFiles(dir)
                    .Where(f => f.Contains(noExt + "_thumb"));
                foreach (string f in thumbs)
                {
                    File.Delete(f);
                }

                return Status.success;
            }
            catch (Exception exe)
            {               
                Exceptions.LogException(exe);
                return Status.failure;
            }
        }

		// Upload file to the server
		private void UploadFile (HttpContext context) {
			var statuses = new List<FilesStatus>();
			var headers = context.Request.Headers;

			if (string.IsNullOrEmpty(headers["X-File-Name"])) {
				UploadWholeFile(context, statuses);
			} else {
				UploadPartialFile(headers["X-File-Name"], context, statuses);
			}

			WriteJsonIframeSafe(context, statuses);
		}

		// Upload partial file
		private void UploadPartialFile (string fileName, HttpContext context, List<FilesStatus> statuses) {
			if (context.Request.Files.Count != 1) throw new HttpRequestValidationException("Attempt to upload chunked file containing more than one fragment per request");
			var inputStream = context.Request.Files[0].InputStream;
			var fullName = StorageRoot + Path.GetFileName(fileName);

			using (var fs = new FileStream(fullName, FileMode.Append, FileAccess.Write)) {
				var buffer = new byte[1024];

				var l = inputStream.Read(buffer, 0, 1024);
				while (l > 0) {
					fs.Write(buffer, 0, l);
					l = inputStream.Read(buffer, 0, 1024);
				}
				fs.Flush();
				fs.Close();
			}
			statuses.Add(new FilesStatus(new System.IO.FileInfo(fullName)));
		}

		// Upload entire file
		private void UploadWholeFile (HttpContext context, List<FilesStatus> statuses) {
			for (int i = 0; i < context.Request.Files.Count; i++) {
				var file = context.Request.Files[i];
                FileName = file.FileName;
                var filePath = StorageRoot + FileName;

                if (!File.Exists(filePath))
                {
                    Stream stream = file.InputStream;
                    using (stream)
                    {
                        string savedFile = SaveFile(stream, Settings, CurrentUser,
                                    UserFolderUrl, filter, FileName); 
                    }
                }          

                statuses.Add(new FilesStatus(FileName, file.ContentLength, RelativeUrl));
			}
		}

		private void WriteJsonIframeSafe (HttpContext context, List<FilesStatus> statuses) {
			context.Response.AddHeader("Vary", "Accept");
			try {
				if (context.Request["HTTP_ACCEPT"].Contains("application/json"))
					context.Response.ContentType = "application/json";
				else
					context.Response.ContentType = "text/plain";
			} catch {
				context.Response.ContentType = "text/plain";
			}

			var jsonObj = js.Serialize(statuses.ToArray());
			context.Response.Write(jsonObj);
		}
        

		private void ListCurrentFiles (HttpContext context) {
			var files =
				new DirectoryInfo(StorageRoot)
					.GetFiles("*", SearchOption.TopDirectoryOnly)
					.Where(f => !f.Attributes.HasFlag(FileAttributes.Hidden))
					.Select(f => new FilesStatus(f))
					.ToArray();

			string jsonObj = js.Serialize(files);
			context.Response.AddHeader("Content-Disposition", "inline; filename=\"files.json\"");
			context.Response.Write(jsonObj);
			context.Response.ContentType = "application/json";
		}
	}
}