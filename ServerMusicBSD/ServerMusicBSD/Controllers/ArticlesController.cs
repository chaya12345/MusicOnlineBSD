using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DTO;
using BL;
using DAL;

namespace ServerMusicBSD.Controllers
{
    public class ArticlesController : ApiController
    {
        public List<ArticlesDTO> GetArticles()
        {
            return ArticlesBL.GetArticles();
        }
        public ArticlesDTO GetArticleById(int id)
        {
            return ArticlesBL.GetArticleById(id);
        }
        public void PostArticle([FromBody] ArticlesBTL article)
        {
            ArticlesBL.AddArticle(article);
        }
        public void DeleteArticle(int articleId)
        {
            ArticlesBL.DeleteArticle(articleId);
        }
    }
}