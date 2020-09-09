using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;
using DTO;
using BL;
using System.Web.Http.Cors;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
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
        public List<PlaylistsDTO> GetPlaylistsByUserId(int userId)
        {
            return PlaylistBL.GetPlaylistsByUserId(userId);
        }
    }
}