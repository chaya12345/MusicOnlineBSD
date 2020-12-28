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
        public void PostCommit(CommitsToArticlesTBL commit)
        {
            commit.date = DateTime.Now;
            commit.tested = false;
            CommitsToArticlesBL.AddResponse(commit);
        }
        public List<CommitsToArticlesDTO> GetArticleCommits(int articleId)
        {
            return CommitsToArticlesBL.GetArticleCommits(articleId);
        }
        public int GetCountCommitsToArticle(int articleId)
        {
            return CommitsToArticlesBL.GetCountCommitsToArticle(articleId);
        }
        public bool DeleteCommit(int commitId)
        {
            return CommitsToArticlesBL.DeleteResponse(commitId);
        }
        public List<CommitsToArticlesDTO> GetLastCommits()
        {
            return CommitsToArticlesBL.GetLastCommits();
        }
        [HttpPut]
        public bool UpdateIsTested(int commitId, bool isTested)
        {
            return CommitsToArticlesBL.UpdateIsTested(commitId, isTested);
        }

    }
}