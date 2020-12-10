using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
using BL;
using DAL;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class SongsToPlaylistsController : ApiController
    {
        public List<songsDetails> GetSongsToPlaylist(int playlistId)
        {
            return SongsToPlaylistsBL.GetSongsToPlaylist(playlistId);
        }
        public void PostSongToPlaylist([FromBody] SongsToPlaylistsTBL stp)
        {
            SongsToPlaylistsBL.AddSongToPlaylist(stp);
        }
        public void PostSongsToPlaylist([FromBody] List<SongsToPlaylistsTBL> stpList)
        {
            SongsToPlaylistsBL.AddSongsToPlaylist(stpList);
        }
        public void DeleteSongFromPlaylistSystem(int playlistId, int songId)
        {
            SongsToPlaylistsBL.DeleteSongFromPlaylist(playlistId, songId);
        }
    }
}