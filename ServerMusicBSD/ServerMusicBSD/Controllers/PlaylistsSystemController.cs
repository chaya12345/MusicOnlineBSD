using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DTO;
using BL;
using DAL;
using System.Web.Http.Cors;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class PlaylistsSystemController : ApiController
    {
        public List<PlaylistsSystemDTO> GetPlaylists()
        {
            return PlaylistsSystemBL.GetPlaylists();
        }
        public PlaylistsSystemDTO GetPlaylistById(int playlistId)
        {
            return PlaylistsSystemBL.GetPlaylistById(playlistId);
        }
        public  PlaylistsSystemDTO GetPlaylistByName(string playlistName)
        {
            return PlaylistsSystemBL.GetPlaylistByName(playlistName);
        }
        public  void PostPlaylistSystem([FromBody] PlaylistsSystemTBL playlistsSystem)
        {
            PlaylistsSystemBL.AddPlaylistSystem(playlistsSystem);
        }
    }
}