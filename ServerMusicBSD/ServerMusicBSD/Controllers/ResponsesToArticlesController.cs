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
    public class ResponsesToArticlesController : ApiController
    {
        public void PostResponse(ResponsesToArticlesTBL response)
        {
            response.date = DateTime.Today;
            ResponsesToArticlesBL.AddResponse(response);
        }
        public List<ResponsesToArticlesDTO> GetArticleResponses(int articleId)
        {
            return ResponsesToArticlesBL.GetArticleResponses(articleId);
        }
        public int GetCountResponsesToArticle(int articleId)
        {
            return ResponsesToArticlesBL.GetCountResponsesToArticle(articleId);
        }
        public void DeleteResponse(int responseId)
        {
            ResponsesToArticlesBL.DeleteResponse(responseId);
        }
        public List<ResponsesToArticlesDTO> GetLastResponses()
        {
            return ResponsesToArticlesBL.GetLastResponses();
        }
        public  List<LastResponsDTO> GetLastResponsesToArticlesAndSongs()
        {
            return ResponsesToArticlesBL.GetLastResponsesToArticlesAndSongs();
        }
    }
}