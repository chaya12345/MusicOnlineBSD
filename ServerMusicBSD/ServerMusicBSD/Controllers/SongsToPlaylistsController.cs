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
        public void PostSongToPlaylists([FromBody] SongsToPlaylistsTBL songToPlaylist)
        {
            SongsToPlaylistsBL.AddSongToPlaylist(songToPlaylist);
        }
        public bool PutMoveSongToOtherPlaylist(int songId, int prevPlaylistId, int currentPlaylistId)
        {
            return SongsToPlaylistsBL.MoveSongToOtherPlaylist(songId, prevPlaylistId, currentPlaylistId);
        }
        public void DeleteSongFromPlaylist(int songId)
        {
            SongsToPlaylistsBL.DeleteSong(songId);
        }
        public List<songsDetails> GetSongsToPlaylists(int playlistId)
        {
            return SongsToPlaylistsBL.GetSongsToPlaylists(playlistId);
        }
        public void PostLikedSong(int songId, int userId)
        {
            SongsToPlaylistsBL.AddLikedSong(songId, userId);
        }

    }
}