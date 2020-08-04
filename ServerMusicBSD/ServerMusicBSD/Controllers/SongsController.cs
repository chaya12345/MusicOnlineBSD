using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using DTO;

namespace ServerMusicBSD.Controllers
{
    public class SongsController : ApiController
    {
        public List<SongsDTO> GetSongs()
        {
            return SongsBL.GetSongs();
        }

        public List<SongsDTO> GetSongsBySinger(string singerName)
        {
            return SongsBL.GetSongsBySinger(singerName);
        }

        public List<SongsDTO> GetSongsByAlbum(string albumName)
        {
            return SongsBL.GetSongsByAlbum(albumName);
        }

        public List<SongsDTO> GetSongsByTag(string tagName)
        {
            return SongsBL.GetSongsByTag(tagName);
        }
        public List<SongsDTO> GetSongsByTags(string[] tags)
        {
            return SongsBL.GetSongsByTags(tags);
        }
        //public List<SongsDTO> GetSongsByAllTags(string[] tags)
        //{

        //}

    }
}