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
    public class UserPlaylistWithSong {
        public UserPlaylistsTBL userPlaylist { get; set; }
        public SongsTBL song { get; set; }
    }
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class UserPlaylistsController : ApiController
    {
        public bool PostUserPlaylist([FromBody] UserPlaylistsTBL newPlaylist)
        {
            return UserPlaylistBL.AddUserPlaylist(newPlaylist);
        }
        public bool PostPlaylistWithSong([FromBody] UserPlaylistWithSong userPlaylistWithSong)
        {
            return UserPlaylistBL.AddUserPlaylistWithSong(userPlaylistWithSong.userPlaylist, userPlaylistWithSong.song);
        }
        public void DeleteUserPlaylist(int userPlaylistId)
        {
            UserPlaylistBL.DeleteUserPlaylist(userPlaylistId);
        }
        public List<UserPlaylistsDTO> GetPlaylistsByUserId(int userId)
        {
            return UserPlaylistBL.GetUserPlaylistsByUserId(userId);
        }
    }
}