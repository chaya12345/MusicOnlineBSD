﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DTO;
using BL;
using DAL;
using System.Web.Http.Cors;

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
        public  void PostPlaylist([FromBody] PlaylistsTBL playlists)
        {
            PlaylistsBL.AddPlaylist(playlists);
        }
        [HttpPost]
        public void PostPlaylistWithSongs([FromBody] playlistWithSongs pws)
        {
            PlaylistsBL.AddPlaylistWithSongs(pws.playlist, pws.songs);
        }
    }
}