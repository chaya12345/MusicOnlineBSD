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
    public class SongsToPlaylistsSystemController : ApiController
    {
        public List<songsDetails> GetSongsToPlaylistSystem(int playlistId)
        {
            return SongsToPlaylistsSystemBL.GetSongsToPlaylistSystem(playlistId);
        }
        public void PostSongToPlaylistSystem([FromBody] SongsToPlaylistsSystemTBL stp)
        {
            SongsToPlaylistsSystemBL.AddSongToPlaylistSystem(stp);
        }
        public void PostSongsToPlaylistSystem([FromBody] List<SongsToPlaylistsSystemTBL> stpList)
        {
            SongsToPlaylistsSystemBL.AddSongsToPlaylistSystem(stpList);
        }
        public void DeleteSongFromPlaylistSystem(int playlistId, int songId)
        {
            SongsToPlaylistsSystemBL.DeleteSongFromPlaylistSystem(playlistId, songId);
        }
    }
}