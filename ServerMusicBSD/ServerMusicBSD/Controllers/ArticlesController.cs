﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DTO;
using BL;
using DAL;
using System.Web.Http.Cors;

namespace ServerMusicBSD.Controllers
{
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
        public void PostArticle([FromBody] ArticlesTBL article)
        {
            article.date = DateTime.Today;
            ArticlesBL.AddArticle(article);
        }
        public void DeleteArticle(int articleId)
        {
            ArticlesBL.DeleteArticle(articleId);
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
        public void PutLastViewDate‏(int articleId)
        {
            ArticlesBL.UpdateLastViewDate(articleId);
        }
    }
}