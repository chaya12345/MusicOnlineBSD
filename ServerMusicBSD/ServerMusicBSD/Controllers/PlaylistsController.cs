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
    public class PlaylistWithSong {
        public PlaylistsTBL playlist { get; set; }
        public SongsTBL song { get; set; }
    }
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class PlaylistsController : ApiController
    {
        public bool PostPlaylist([FromBody] PlaylistsTBL newPlaylist)
        {
            return PlaylistBL.AddPlaylist(newPlaylist);
        }
        public bool PostPlaylistWithSong([FromBody] PlaylistWithSong playlistWithSong)
        {
            return PlaylistBL.AddPlaylistWithSong(playlistWithSong.playlist, playlistWithSong.song);
        }
        public void DeletePlaylist(int playlistId)
        {
            PlaylistBL.DeletePlaylist(playlistId);
        }
        public List<PlaylistsDTO> GetPlaylistsByUserId(int userId)
        {
            return PlaylistBL.GetPlaylistsByUserId(userId);
        }
    }
}