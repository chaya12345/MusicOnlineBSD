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
    public class SongsToUserPlaylistsController : ApiController
    {
        public void PostSongToUserPlaylists([FromBody] SongsToUserPlaylistsTBL songToUserPlaylist)
        {
            SongsToUserPlaylistsBL.AddSongToUserPlaylist(songToUserPlaylist);
        }
        public bool PutMoveSongToOtherUserPlaylist(int songId, int prevUserPlaylistId, int currentUserPlaylistId)
        {
            return SongsToUserPlaylistsBL.MoveSongToOtherUserPlaylist(songId, prevUserPlaylistId, currentUserPlaylistId);
        }
        public void DeleteSongFromUserPlaylist(int songId)
        {
            SongsToUserPlaylistsBL.DeleteSong(songId);
        }
        public List<songsDetails> GetSongsToUserPlaylists(int userPlaylistId)
        {
            return SongsToUserPlaylistsBL.GetSongsToUserPlaylists(userPlaylistId);
        }
        public void PostLikedSong(int songId, int userId)
        {
            SongsToUserPlaylistsBL.AddLikedSong(songId, userId);
        }

    }
}