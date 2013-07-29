using System.IO;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Drawing.Imaging;
using System.Globalization;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Diagnostics;

using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Entities.Users;
using DotNetNuke.Services.Localization.Internal;
using DotNetNuke.Services.FileSystem;
using System;


namespace DotNetNuke.Modules.SocialPolls
{
    public enum Status
    {
        failure = 0,
        success = 1
    }
    public class FileHandlerBase
    {

        #region Protected
        protected Image GetThumbnail(string filename, int maxW, int maxH)
        {
            Image original = Image.FromFile(filename);
            CalculateThumbnailSize(original.Width, original.Height, maxW, maxH);
            Image tn = original.GetThumbnailImage(ThumbWidth, ThumbHeight,
                () => false, IntPtr.Zero);
            return tn;
        }

        protected Status CreateThumbnail(string filepath, int maxW, int maxH)
        {
            try
            { 
                Image original = Image.FromFile(filepath);
                CalculateThumbnailSize(original.Width, original.Height, maxW, maxH);
                original.Dispose();

                using (FileStream fsSource = new FileStream(filepath, FileMode.Open, FileAccess.Read))
                {
                    // Read the source file into a byte array. 
                    byte[] bytes = new byte[fsSource.Length];
                    int numBytesToRead = (int)fsSource.Length;
                    int numBytesRead = 0;
                    while (numBytesToRead > 0)
                    {
                        // Read may return anything from 0 to numBytesToRead. 
                        int n = fsSource.Read(bytes, numBytesRead, numBytesToRead);

                        // Break when the end of the file is reached. 
                        if (n == 0)
                            break;

                        numBytesRead += n;
                        numBytesToRead -= n;
                    }
                    numBytesToRead = bytes.Length;

                    //create thumbnail 
                    Image source = Image.FromStream(fsSource);
                    Bitmap bitmap = new Bitmap(ThumbWidth, ThumbHeight);
                    using (Graphics graphics = Graphics.FromImage((Image)bitmap))
                    {
                        graphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                        graphics.DrawImage(source, 0, 0, ThumbWidth, ThumbHeight);
                    }

                    Image thumbnail = (Image)bitmap;
                    MemoryStream ms = new MemoryStream();
                    thumbnail.Save(ms, ImageFormat.Jpeg);

                    // Write the byte array to the other FileStream.                     
                    string savedFile = SaveFile(ms, Settings, CurrentUser,
                                     UserFolderUrl, Filter, ThumbName);
                }
                return Status.success;
            }
            catch (Exception)
            {
                return Status.failure;
            }
        }

        protected void CalculateThumbnailSize(int w, int h, int maxW, int maxH)
        {
            double scale = 0;
            if (w >= h)
            {
                if (w > maxW)
                {
                    scale = (1 / ((double)w / maxW));
                }
            }
            else
            {
                if (h > maxH)
                {
                    scale = (1 / ((double)h / maxH));
                }
            }
            if (scale > 0)
            {
                ThumbWidth = Convert.ToInt16(w * scale);
                ThumbHeight = Convert.ToInt16(h * scale);
            }
        }

        protected void CalculateThumbnailSize(string filename, int maxW, int maxH)
        {
            Image original = Image.FromFile(filename);
            int w = original.Width;
            int h = original.Height;
            double scale = 0;
            if (w >= h)
            {
                if (w > maxW)
                {
                    scale = (1 / ((double)w / maxW));
                }
            }
            else
            {
                if (h > maxH)
                {
                    scale = (1 / ((double)h / maxH));
                }
            }
            if (scale > 0)
            {
                ThumbWidth = Convert.ToInt16(w * scale);
                ThumbHeight = Convert.ToInt16(h * scale);
            }
            original.Dispose();
        }
        #endregion

        #region properties
        public PortalSettings Settings
        {
            get
            {
                return PortalController.GetCurrentPortalSettings();
            }
        }

        public UserInfo CurrentUser
        {
            get { return UserController.GetCurrentUserInfo(); }
        }

        public string StorageRoot
        {
            get
            {
                return Path.Combine(Settings.HomeDirectoryMapPath, UserFolder);
            }
        }

        /// <summary>
        /// The 'pure' name of the file, no paths or directories
        /// </summary>
        public string FileName { get; set; }

        public string RelativeUrl
        {
            get
            {
                string url = Settings.HomeDirectory + UserFolder + FileName;
                return url.Replace("\\", "/");
            }
        }

        public int PollOwnerId { get; set; }

        public string UserFolderUrl
        {
            get
            {
                if (PollOwnerId == Settings.UserId || PollOwnerId == 0)
                {
                    return FolderManager.Instance.GetUserFolder(CurrentUser).FolderPath;
                }
                else
                {
                    UserInfo user = UserController.GetUserById(Settings.PortalId, PollOwnerId);
                    return FolderManager.Instance.GetUserFolder(user).FolderPath;
                }
                
                
            }
        }

        public string UserFolder
        {
            get
            {
                return UserFolderUrl.Replace("/", "\\");
            }
        }

        public string Filter { get { return "jpg,jpeg,gif,png"; } }

        public bool IsAllowedExtension(string extension)
        {
            return !string.IsNullOrEmpty(extension)
                   && DotNetNuke.Entities.Host.Host.AllowedExtensionWhitelist.IsAllowedExtension(extension);
        }

        public int ThumMaxWidth { get; set; }

        public int ThumbMaxHeight { get; set; }

        public int ThumbWidth { get; set; }

        public int ThumbHeight { get; set; }

        public string ThumbName
        {
            get
            {
                string template = "{0}_thumb_{1}_{2}{3}";
                string ext = Path.GetExtension(FileName);
                string noExt = Path.GetFileNameWithoutExtension(FileName);
                return String.Format(template, noExt, ThumbWidth,
                    ThumbHeight, ext);


            }
        }

        public string ContentType
        {
            get
            {
                string ctype;
                string ext = Path.GetExtension(FileName);
                switch (ext)
                {
                    case ".png":
                        ctype = "image/png";
                        break;
                    case ".jpeg":
                    case ".jpg":
                        ctype = "image/jpeg";
                        break;
                    case ".gif":
                        ctype = "image/gif";
                        break;
                    default:
                        ctype = "";
                        break;
                }
                return ctype;
            }
        }
        #endregion

        #region MyRegion
        protected void DeleteFile(string filePath, string folderUrl)
        {
            var folderManager = FolderManager.Instance;
            int effectivePortalId = PortalController.GetEffectivePortalId(Settings.PortalId);
            IFolderInfo folderInfo;
            folderInfo = folderManager.GetFolder(effectivePortalId, folderUrl);

            string filename = Path.GetFileName(filePath);

            IFileInfo file = FileManager.Instance.GetFile(folderInfo, filename);

            FileManager.Instance.DeleteFile(file);
        }

        protected string SaveFile(Stream stream, PortalSettings portalSettings,
           UserInfo userInfo, string folder, string filter, string fileName)
        {
            try
            {

                if (!string.IsNullOrEmpty(fileName))
                {
                    var extension = Path.GetExtension(fileName).Replace(".", "");
                    if (!string.IsNullOrEmpty(filter) && !filter.ToLower().Contains(extension.ToLower()))
                    {
                        // trying to upload a file not allowed for current filter
                        return string.Empty;
                    }

                    if (!IsAllowedExtension(extension)) return string.Empty;

                    var folderManager = FolderManager.Instance;
                    if (string.IsNullOrEmpty(folder)) folder = "";

                    //Check if this is a User Folder
                    IFolderInfo folderInfo;
                    int effectivePortalId = PortalController.GetEffectivePortalId(portalSettings.PortalId);
                    if (folder.ToLowerInvariant().StartsWith("users/") &&
                        folder.EndsWith(string.Format("/{0}/", userInfo.UserID)))
                    {
                        //Make sure the user folder exists
                        folderInfo = folderManager.GetFolder(effectivePortalId, folder);
                        if (folderInfo == null)
                        {
                            //Add User folder
                            //fix user's portal id
                            userInfo.PortalID = effectivePortalId;

                            var defaultFolderMapping = FolderMappingController.Instance
                                .GetDefaultFolderMapping(portalSettings.PortalId);
                            folderInfo = ((FolderManager)folderManager).AddFolder(defaultFolderMapping, folder);
                        }
                    }
                    else
                    {
                        folderInfo = folderManager.GetFolder(effectivePortalId, folder);
                    }

                    FileManager.Instance.AddFile(folderInfo, fileName, stream, true);
                    return Path.Combine(folderInfo.PhysicalPath, fileName);
                }

                return string.Empty;

            }
            catch (Exception exe)
            {
                //Logger.Error(exe.Message);
                Exceptions.LogException(exe);
                return string.Empty;
            }
        }

        protected static bool GivenFilename(HttpContext context)
        {
            return !string.IsNullOrEmpty(context.Request["f"]);
        }

        protected virtual void DeliverFile(HttpContext context)
        {
            var filename = context.Request["f"];
            var filePath = StorageRoot + filename;

            if (File.Exists(filePath))
            {
                context.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
                context.Response.ContentType = "application/octet-stream";
                context.Response.ClearContent();
                context.Response.WriteFile(filePath);
            }
            else
                context.Response.StatusCode = 404;
        }

        protected Boolean IsFileLocked(string filepath)
        {
            System.IO.FileInfo file = new System.IO.FileInfo(filepath);
            FileStream stream = null;
            try
            {
                //Don't change FileAccess to ReadWrite, 
                //because if a file is in readOnly, it fails.
                stream = file.Open
                (
                    FileMode.Open,
                    FileAccess.Read,
                    FileShare.None
                );
            }
            catch (IOException)
            {
                //the file is unavailable because it is:
                //still being written to
                //or being processed by another thread
                //or does not exist (has already been processed)
                return true;
            }
            finally
            {
                if (stream != null)
                    stream.Close();
            }

            //file is not locked
            return false;
        }

        protected FileStream ReadFileIntoStream(string pathSource)
        {
            try
            {
                using (FileStream fsSource = new FileStream(pathSource,
                    FileMode.Open, FileAccess.Read))
                {

                    // Read the source file into a byte array. 
                    byte[] bytes = new byte[fsSource.Length];
                    int numBytesToRead = (int)fsSource.Length;
                    int numBytesRead = 0;
                    while (numBytesToRead > 0)
                    {
                        // Read may return anything from 0 to numBytesToRead. 
                        int n = fsSource.Read(bytes, numBytesRead, numBytesToRead);

                        // Break when the end of the file is reached. 
                        if (n == 0)
                            break;

                        numBytesRead += n;
                        numBytesToRead -= n;
                    }
                    numBytesToRead = bytes.Length;

                    // Write the byte array to the other FileStream.                     
                    return fsSource;
                }
            }
            catch (FileNotFoundException ioEx)
            {
                Exceptions.LogException(ioEx);
                return null;
            }
        }
        #endregion
    }
}