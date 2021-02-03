using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using DAL;
using BL;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class SingersToArticlesController : ApiController
    {
        public List<string> GetSingersToArticle(int articleId)
        {
            return SingersToArticlesBL.GetSingersToArticle(articleId);
        }
    }
}