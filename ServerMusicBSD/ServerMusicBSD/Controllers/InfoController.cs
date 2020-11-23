using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using BL;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class InfoController : ApiController
    {
        public int GetSongsCount()
        {
            return InfoBL.GetSongsCount();
        }
        public int GetArticlesCount()
        {
            return InfoBL.GetArticlesCount();
        }
        public int GetPlaylistsCount()
        {
            return InfoBL.GetPlaylistsCount();
        }
        public int GetUsersCount()
        {
            return InfoBL.GetUsersCount();
        }
        public int GetSubsToNewsletterCount()
        {
            return InfoBL.GetSubsToNewsletterCount();
        }
    }
}