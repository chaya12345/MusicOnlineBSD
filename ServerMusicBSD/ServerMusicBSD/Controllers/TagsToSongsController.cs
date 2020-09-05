using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;
using DTO;
using BL;

namespace ServerMusicBSD.Controllers
{
    public class TagsToSongsController : ApiController
    {
        public List<string> GetTagsToSong(string songName)
        {
            return TagsToSongsBL.GetTagsToSong(songName);
        }
        public static void PostTagToSong(TagsToSongsTBL tagToSong)
        {
            TagsToSongsBL.PostTagToSong(tagToSong);
        }
    }
}