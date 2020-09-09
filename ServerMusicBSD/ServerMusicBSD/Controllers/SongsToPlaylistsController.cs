using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using BL;
using DAL;
using DTO;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class SongsToPlaylistsController : ApiController
    {
        public void PostSong([FromBody] SongsToPlaylistsTBL songToPlaylist)
        {
            SongsToPlaylistsBL.AddSongToPlaylist(songToPlaylist);
        }
        [AcceptVerbs("Put")]
        public void PutSong(int id, int playlistId)
        {
            SongsToPlaylistsBL.MoveSongToOtherPlaylist(id, playlistId);
        }
        public void DeleteSong(int id)
        {
            SongsToPlaylistsBL.DeleteSong(id);
        }
        public List<SongsToPlaylistsDTO> GetSongsToPlaylists(int playlistId)
        {
            return SongsToPlaylistsBL.GetSongsToPlaylists(playlistId);
        }

    }
}