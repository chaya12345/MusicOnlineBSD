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
    public class FollowUpController : ApiController
    {
        public void PostFollowUp([FromBody]FollowUpTBL followUp)
        {
            FollowUpBL.AddFollowUp(followUp);
        }
        public void DeleteFollowUp(int followUpId)
        {
            FollowUpBL.DeleteFollowUp(followUpId);
        }
        public List<string> GetSongsNameYouFollowUp(int? userId,string mail)
        {
            return FollowUpBL.GetSongsNameYouFollowUp(userId, mail);
        }
        public List<string> GetArticlesNameYouFollowUp(int? userId, string mail)
        {
            return FollowUpBL.GetArticlesNameYouFollowUp(userId, mail);
        }
        public List<string> GetMailsOfSongFollowUp(int songId)
        {
            return FollowUpBL.GetMailsOfSongFollowUp(songId);
        }
        public List<string> GetMailsOfArticleFollowUp(int articleId)
        {
            return FollowUpBL.GetMailsOfArticleFollowUp(articleId);
        }
    }
}