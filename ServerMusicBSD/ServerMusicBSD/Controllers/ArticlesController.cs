﻿using System;
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
        public void PostTagToArticle(int articleId,int tagId)
        {
            ArticlesBL.AddTagToAtricle(articleId, tagId);
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
       
    }
}