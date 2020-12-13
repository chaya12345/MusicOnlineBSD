using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using DAL;
using DTO;
using BL;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class TagsToArticlesController : ApiController
    {
        public List<TagsToAtriclesDTO> GetTagsToArticle(int articleId)
        {
            return TagsToArticlesBL.GetTagsToArticle(articleId);
        }
        public List<string> GetTagsNamesToArticle(int articleId, bool? all = false)
        {
            return TagsToArticlesBL.GetTagsNamesToArticle(articleId, all);
        }
        public static void PostTagToArticle([FromBody] TagsToArticlesTBL tagToArticle)
        {
            TagsToArticlesBL.AddTagToArticle(tagToArticle);
        }
    }
}