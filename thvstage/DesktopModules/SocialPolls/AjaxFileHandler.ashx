<%@ WebHandler Language="C#" Class="AjaXFileHandler" %>

using System;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Drawing;
using System.Web.Script.Serialization;
using System.Diagnostics;

using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Services.Exceptions;


public class AjaXFileHandler : IHttpHandler {    
  
    public void ProcessRequest (HttpContext context) {

        try
        {
            if (context.Request.Files.Count > 0)
            {
               
                PortalSettings settings = PortalController.GetCurrentPortalSettings();

                string path = settings.HomeDirectoryMapPath 
                    + "Users\\SocialPolls\\" 
                    + settings.UserId;
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                var file = context.Request.Files[0];
                //Stream stream = new FileStream(file, FileMode.Open); 
                string filename = Path.Combine(path, file.FileName);

                SaveStreamToFile(filename, file.InputStream);

                //create and save thumbnail new ver
                Image image = Image.FromFile(filename);
                Image thumb = image.GetThumbnailImage(204, 205, () => false, IntPtr.Zero);

                string tnFileName = Path.Combine(path, "tn_" + Path.GetFileName(filename));
                //Stream tnStream = ;

                //SaveStreamToFile(tnFileName, thumb);
                thumb.Save(tnFileName);

                context.Response.ContentType = "text/plain";
                var serializer = new JavaScriptSerializer();
                string imageUrl = "http://" + context.Request.Url.Host +
                    "/Portals/0/Users/SocialPolls/" + settings.UserId + "/" + file.FileName;
                var result = new { name = imageUrl };
                context.Response.Write(serializer.Serialize(result));

            }
            else
            {
                context.Response.Write("no files");
            }
        }
        catch (Exception ex)
        {
            Exceptions.LogException(ex);
            context.Response.Write(ex.ToString());
            throw;
        }
      
    }

    public void SaveStreamToFile(string fileFullPath, Stream stream)
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
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}