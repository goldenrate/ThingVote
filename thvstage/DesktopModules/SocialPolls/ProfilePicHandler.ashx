<%@ WebHandler Language="C#" Class="ProfilePicHandler" %>

using System;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Drawing;
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

public class ProfilePicHandler : IHttpHandler
{
    #region IHttpHandler Members

    public void ProcessRequest(HttpContext context)
    {
        var provider = new System.Net.Http.MultipartMemoryStreamProvider();        
         
        
        PortalSettings settings = PortalController.GetCurrentPortalSettings();
        int userId = settings.UserId;
        
        var userController = new UserController();
        UserInfo user = UserController.GetCurrentUserInfo();
        if (user == null) { context.Response.End(); }        
        //a path to the user files on the server
        string userFolder = FolderManager.Instance.GetUserFolder(user).FolderPath;
        string filter = "jpg,jpeg,gif,png";
        //userFolder = userFolder.Replace("/", "\\");         
        
        //save the new file to the server 
        var receivedFile = context.Request.Files[0];
        string mappedUserFolder = Path.Combine(settings.HomeDirectoryMapPath, userFolder);
        var fileName = Path.Combine(mappedUserFolder, receivedFile.FileName);

        string savedFile = SaveFile(receivedFile.InputStream, settings, user, 
            userFolder, filter, receivedFile.FileName); 
        
        //get the id of the file to store in properties 
        IFolderInfo folderInfo = FolderManager.Instance.GetFolder(settings.PortalId, userFolder);
        var profileImage = (DotNetNuke.Services.FileSystem.FileInfo)FileManager
            .Instance.GetFile(folderInfo, receivedFile.FileName);        
        //update profile property
        user.Profile.SetProfileProperty("Photo", profileImage.FileId.ToString());
        UserController.UpdateUser(settings.PortalId, user);
        
        //prepare the file for writing back

        var serializer = new JavaScriptSerializer(); 
        var result = new {name = user.Profile.PhotoURL };
        var serializedResult = serializer.Serialize(result);

        context.Response.Write(serializedResult);
     
        context.Response.End();
    }

    private void SaveStreamToFile(string fileFullPath, Stream stream)
    {
        if (stream.Length == 0) return;

        // Create a FileStream object to write a stream to a file
        using (FileStream fileStream = System.IO.File.Create(fileFullPath, (int)stream.Length))
        {
            // Fill the bytes[] array with the stream data
            byte[] bytesInStream = new byte[stream.Length];
            stream.Read(bytesInStream, 0, (int)bytesInStream.Length);

            // Use FileStream object to write to the specified file
            fileStream.Write(bytesInStream, 0, bytesInStream.Length);
        }
    }

    private string SaveFile(Stream stream, PortalSettings portalSettings,
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
            return string.Empty;
        }
    }

    //private IFolderInfo AddUserFolder(UserInfo user)
    //{
    //    //user _default portal for all super users
    //    var portalID = user.IsSuperUser ? -1 : user.PortalID;

    //    var defaultFolderMapping = FolderMappingController.Instance.GetDefaultFolderMapping(portalID);

    //    var folderPath = PathUtils.Instance.FormatFolderPath(String.Format("Users/{0}", rootFolder));
    //}
    
    private bool IsAllowedExtension(string extension)
    {
        return !string.IsNullOrEmpty(extension)
               && DotNetNuke.Entities.Host.Host.AllowedExtensionWhitelist.IsAllowedExtension(extension);
    }

    private bool IsImageExtension(string extension)
    {
        List<string> imageExtensions = new List<string> { ".JPG", ".JPE", ".BMP", ".GIF", ".PNG", ".JPEG", ".ICO" };
        return imageExtensions.Contains(extension.ToUpper());
    }

    private void SetupCulture()
    {
        PortalSettings settings = PortalController.GetCurrentPortalSettings();
        if (settings == null) return;

        CultureInfo pageLocale = TestableLocalization.Instance.GetPageLocale(settings);
        if (pageLocale != null)
        {
            TestableLocalization.Instance.SetThreadCultures(pageLocale, settings);
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    #endregion

}