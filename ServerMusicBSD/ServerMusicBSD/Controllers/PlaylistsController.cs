﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;
using BL;

namespace ServerMusicBSD.Controllers
{
    public class PlaylistsController : ApiController
    {
        public void PostPlaylist([FromBody] PlaylistsTBL newPlaylist)
        {
            PlaylistBL.AddPlaylist(newPlaylist);
        }
        public void DeletePlaylist(int id)
        {
            PlaylistBL.DeletePlaylist(id);
        }
    }
}