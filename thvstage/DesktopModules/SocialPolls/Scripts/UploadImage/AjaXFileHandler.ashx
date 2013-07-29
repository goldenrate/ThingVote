<%@ WebHandler Language="C#" Class="AjaXFileHandler" %>

using System;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.Script.Serialization;

public class AjaXFileHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        if (context.Request.Files.Count > 0)
        {
            string destinationFolder = "temp";
            string path = context.Server.MapPath("~/"+destinationFolder);
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            var file = context.Request.Files[0];
            string filename = Path.Combine(path, file.FileName);
            file.SaveAs(filename);

            context.Response.ContentType = "text/plain";
            var serializer = new JavaScriptSerializer();
            string imageUrl = "http://"+ context.Request.Url.Host+ "/" + destinationFolder + "/" + file.FileName;
            var result = new { name = imageUrl };
            context.Response.Write(serializer.Serialize(result));

        }
        else {
            context.Response.Write("no files");
        }
      
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}