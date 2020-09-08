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
        public List<TagsToAtriclesDTO> GetTagsToArticle(int ArticleId)
        {
            return TagsToArticlesBL.GetTagsToArticle(ArticleId);
        }
        public List<string> GetTagsNamesToArticle(int ArticleId)
        {
            return TagsToArticlesBL.GetTagsNamesToArticle(ArticleId);
        }
        public static void PostTagToArticle([FromBody] TagsToArticlesTBL tagToArticle)
        {
            TagsToArticlesBL.AddTagToArticle(tagToArticle);
        }
    }
}