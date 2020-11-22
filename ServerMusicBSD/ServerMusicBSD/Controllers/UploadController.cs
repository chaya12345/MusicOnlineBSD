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
        public HttpResponseMessage UploadJsonFile()
        {
            HttpResponseMessage response = new HttpResponseMessage();
            var httpRequest = HttpContext.Current.Request;
            if (httpRequest.Files.Count > 0)
            {
                foreach (string file in httpRequest.Files)
                {
                    var postedFile = httpRequest.Files[file];
                    var filePath = HttpContext.Current.Server.MapPath("~/UploadFile/" + postedFile.FileName);
                    filePath = AppDomain.CurrentDomain.BaseDirectory.Substring(0,
                            AppDomain.CurrentDomain.BaseDirectory.LastIndexOf("Server") - 1) + "\\DAL\\src\\images\\for_playlists\\"
                            + postedFile.FileName;
                    postedFile.SaveAs(filePath);
                }
            }
            return response;
        }
    }
}