using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using DTO;
using DAL;

namespace ServerMusicBSD.Controllers
{
    public class ResponsesController : ApiController
    {
        public void PostResponse(ResponsesTBL response)//תגובות
        {
            ResponsesBL.AddResponse(response);
        }
        public List<ResponsesDTO> GetArticleResponses(int articleId)
        {
            return ResponsesBL.GetArticleResponses(articleId);
        }
        public void DeleteResponse(int responseId)
        {
            ResponsesBL.DeleteResponse(responseId);
        }
    }
}