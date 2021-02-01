using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DTO;
using BL;
using DAL;
using System.Web.Http.Cors;
using System.Web;
using System.Globalization;

namespace ServerMusicBSD.Controllers
{
    public class ArticleObj
    {
        public ArticlesTBL article;
        public string[] singers;
        public string[] tags;
        //public string[] artists;
    }
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ArticlesController : ApiController
    {
        public List<ArticlesDTO> GetArticles()
        {
            return ArticlesBL.GetArticles();
        }
        public ArticlesDTO GetArticleById(int articleid)
        {
            return ArticlesBL.GetArticleById(articleid);
        }
        public bool PostArticle([FromBody] ArticleObj articleObj)
        {
            articleObj.article.date = DateTime.Today;
            ArticlesBL.AddArticle(articleObj.article);
            ArticlesDTO article = ArticlesBL.GetArticleByTitle(articleObj.article.title);
            bool flag = true;
            if (article != null)
            {
                if (TagsToArticlesBL.AddTagToArticle(articleObj.tags, article.id) == false)
                    flag = false;
                if (SingersToArticlesBL.AddSingersToArticle(articleObj.singers, article.id) == false)
                    flag = false;
            }
            return flag;
        }
        [HttpPost]
        public bool AddArticle(bool isEdit = false)
        {
            var httpRequest = HttpContext.Current.Request;
            ArticleObj articleObj = Newtonsoft.Json.JsonConvert.DeserializeObject<ArticleObj>(httpRequest.Params["details"]);
            if (!isEdit)
            {
                ArticlesBL.AddArticle(articleObj.article);
                ArticlesDTO article = ArticlesBL.GetArticleByTitle(articleObj.article.title);
                bool flag = true;
                if (article != null)
                {
                    saveFiles(httpRequest, article.title);
                    if (TagsToArticlesBL.AddTagToArticle(articleObj.tags, article.id) == false)
                        flag = false;
                    if (SingersToArticlesBL.AddSingersToArticle(articleObj.singers, article.id) == false)
                        flag = false;
                }
                return flag;
            }
            return false;
        }
        private void saveFiles(HttpRequest httpRequest, string title)
        {
            if (httpRequest.Files["image"] != null)
            {
                SavingFilesBL.SaveFile(httpRequest.Files["image"], "images\\for_articles");
            }
            if (httpRequest.Form["content"] != null)
            {
                SavingFilesBL.SaveToTxtFile(httpRequest.Form["content"], "articles_content",
                    SavingFilesBL.formatFolderName(title));
            }
        }
        public bool DeleteArticle(int articleId)
        {
           return ArticlesBL.DeleteArticle(articleId);
        }
        public List<ArticlesDTO> GetArticlesByTag(string tagName)
        {
            return ArticlesBL.GetArticlesByTag(tagName);
        }
        public List<ArticlesDTO> PostArticlesByTags([FromBody] TagsResponse tagsResponse)
        {
            return ArticlesBL.GetArticlesByTags(tagsResponse.tags);
        }
        public List<ArticlesDTO> PostArticlesByAllTags([FromBody] TagsResponse tagsResponse)
        {
            return ArticlesBL.GetArticlesByAllTags(tagsResponse.tags);
        }
        public void PutIncreaseLikeToArticle(int articleId)
        {
            ArticlesBL.InreaseLike(articleId);
        }
        public void PutDecreaseLikeToSongArticle(int articleId)
        {
            ArticlesBL.DecreaseLike(articleId);
        }
        public  void PutViewToArticle(int articleId)
        {
            ArticlesBL.AddViewToArticle(articleId);
        }
    }
}