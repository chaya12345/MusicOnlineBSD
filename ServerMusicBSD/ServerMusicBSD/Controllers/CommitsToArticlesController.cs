using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using DTO;
using DAL;
using System.Web.Http.Cors;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class CommitsToArticlesController : ApiController
    {
        public void PostResponse(CommitsToArticlesTBL response)
        {
            response.date = DateTime.Today;
            CommitsToArticlesBL.AddResponse(response);
        }
        public List<CommitsToArticlesDTO> GetArticleCommits(int articleId)
        {
            return CommitsToArticlesBL.GetArticleCommits(articleId);
        }
        public int GetCountCommitsToArticle(int articleId)
        {
            return CommitsToArticlesBL.GetCountCommitsToArticle(articleId);
        }
        public void DeleteResponse(int responseId)
        {
            CommitsToArticlesBL.DeleteResponse(responseId);
        }
        public List<CommitsToArticlesDTO> GetLastCommits()
        {
            return CommitsToArticlesBL.GetLastCommits();
        }
       
    }
}