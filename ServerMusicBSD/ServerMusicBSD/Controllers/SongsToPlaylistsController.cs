using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using DAL;

namespace ServerMusicBSD.Controllers
{
    public class SongsToPlaylistsController : ApiController
    {
        public void PostSong([FromBody] SongsToPlaylistsTBL songToPlaylist)
        {
            SongsToPlaylistsBL.AddSongToPlaylist(songToPlaylist);
        }
        [AcceptVerbs("Put")]
        public void PutSong(int id, [FromBody] SongsToPlaylistsTBL songsToPlaylist)
        {
            SongsToPlaylistsBL.MoveSongToOtherPlaylist(id, songsToPlaylist);
        }
        public void DeleteSong(int id)
        {
            SongsToPlaylistsBL.DeleteSong(id);
        }

    }
}