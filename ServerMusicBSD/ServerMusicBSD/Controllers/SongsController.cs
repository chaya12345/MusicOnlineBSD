using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;
using BL;
using DTO;

namespace ServerMusicBSD.Controllers
{
    public class SongsController : ApiController
    {
        MusicOnlineEntities et = new MusicOnlineEntities();
        public List<SongsDTO> GetSongs()
        {
            return SongsBL.GetSongs();
        }
    }
}