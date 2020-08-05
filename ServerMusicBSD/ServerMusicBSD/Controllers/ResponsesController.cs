using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;

namespace ServerMusicBSD.Controllers
{
    public class ResponsesController : ApiController
    {
        public void PostResponse(int articleId, string name,
            string title, string content, DateTime date)
        {
            ResponsesBL.AddResponse(articleId, name, title, content, date);
        }
    }
}