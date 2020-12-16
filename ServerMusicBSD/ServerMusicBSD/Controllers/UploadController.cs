using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Http;

namespace ServerMusicBSD.Controllers
{
    public class UploadController : ApiController
    {
        [System.Web.Http.HttpPost]
        [System.Web.Http.ActionName("UploadImage")]
        public HttpResponseMessage UploadJsonFile(string folderName, string folderName2)
        {
            HttpResponseMessage response = new HttpResponseMessage();
            var httpRequest = HttpContext.Current.Request;
            if (httpRequest.Files.Count > 0)
            {
                int i = 0;
                foreach (string file in httpRequest.Files)
                {
                    ++i;
                    var postedFile = httpRequest.Files[file];
                    var filePath = HttpContext.Current.Server.MapPath("~/UploadFile/" + postedFile.FileName);
                    filePath = AppDomain.CurrentDomain.BaseDirectory.Substring(0,
                            AppDomain.CurrentDomain.BaseDirectory.LastIndexOf("Server") - 1) + "\\DAL\\src\\"
                            + (i == 1 ? folderName : folderName2) + "\\" + postedFile.FileName;
                    postedFile.SaveAs(filePath);
                }
            }
            return response;
        }
        [System.Web.Http.HttpDelete]
        [System.Web.Http.ActionName("DeleteImage")]
        public void DeleteFileFromFolder(string FoldersPath, string StrFilename)
        {

            string strPhysicalFolder = AppDomain.CurrentDomain.BaseDirectory.Substring(0,
                            AppDomain.CurrentDomain.BaseDirectory.LastIndexOf("Server") - 1) + "\\DAL\\src\\"
                            + FoldersPath + "\\";
            string strFileFullPath = strPhysicalFolder + StrFilename;
            if (System.IO.File.Exists(strFileFullPath))
            {
                System.IO.File.Delete(strFileFullPath);
            }

        }

    }
}