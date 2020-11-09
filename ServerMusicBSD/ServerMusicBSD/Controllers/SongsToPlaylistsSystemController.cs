using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BL;
using DAL;
using DTO;

namespace ServerMusicBSD.Controllers
{
    public class SongsToPlaylistsSystemController
    {
        public List<songsDetails> GetSongsToPlaylistSystem(int playlistId)
        {
            return SongsToPlaylistsSystemBL.GetSongsToPlaylistSystem(playlistId);
        }
        public void PostSongToPlaylistSystem(SongsToPlaylistsSystemTBL stp)
        {
            SongsToPlaylistsSystemBL.AddSongToPlaylistSystem(stp);
        }
        public void PostSongsToPlaylistSystem(List<SongsToPlaylistsSystemTBL> stpList)
        {
            SongsToPlaylistsSystemBL.AddSongsToPlaylistSystem(stpList);
        }
        public void DeleteSongFromPlaylistSystem(int playlistId, int songId)
        {
            SongsToPlaylistsSystemBL.DeleteSongFromPlaylistSystem(playlistId, songId);
        }
    }
}