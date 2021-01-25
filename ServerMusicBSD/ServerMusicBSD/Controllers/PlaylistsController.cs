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
using System.Web;

namespace ServerMusicBSD.Controllers
{
    public class playlistWithSongs
    {
        public PlaylistsTBL playlist;
        public string[] songs;
    }
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class PlaylistsController : ApiController
    {
        public List<PlaylistsDTO> GetPlaylists()
        {
            return PlaylistsBL.GetPlaylists();
        }
        public PlaylistsDTO GetPlaylistById(int playlistId)
        {
            return PlaylistsBL.GetPlaylistById(playlistId);
        }
        public  PlaylistsDTO GetPlaylistByName(string playlistName)
        {
            return PlaylistsBL.GetPlaylistByName(playlistName);
        }
        public void PostPlaylist([FromBody] PlaylistsTBL playlists)
        {
            PlaylistsBL.AddPlaylist(playlists);
        }
        [HttpPost]
        public bool AddPlaylist(bool isEdit = false)
        {
            var httpRequest = HttpContext.Current.Request;
            if (httpRequest.Params.Count > 0)
            {
                bool isSuccess = false;
                playlistWithSongs pws = Newtonsoft.Json.JsonConvert.DeserializeObject<playlistWithSongs>(httpRequest.Params["playlist"]);
                if (pws != null && pws.playlist != null && pws.songs != null)
                {
                    isSuccess = PlaylistsBL.AddPlaylistWithSongs(pws.playlist, pws.songs, isEdit);
                }
                if (httpRequest.Files.Count > 0 && isSuccess)
                {
                    SavingFilesBL.SaveFile(httpRequest.Files[0], "images\\for_playlists");
                }
                return isSuccess;
            }
            return false;
        }
        [HttpPost]
        //public void PostPlaylistWithSongs([FromBody] playlistWithSongs pws, ise)
        //{
        //    if (pws != null && pws.playlist != null && pws.songs != null)
        //    {
        //        PlaylistsBL.AddPlaylistWithSongs(pws.playlist, pws.songs, isEdit);
        //    }
        //}
        [HttpPut]
        public bool UpdatePlaylistWithSongs([FromBody] playlistWithSongs pws)
        {
            if (pws != null && pws.playlist != null && pws.songs != null)
            {
                return PlaylistsBL.UpdatePlaylistWithSongs(pws.playlist, pws.songs);
            }
            return false;
        }
        public void DeletePlayList(int playlistId)
        {
            PlaylistsBL.DeletePlayList(playlistId);
        }
    }
}