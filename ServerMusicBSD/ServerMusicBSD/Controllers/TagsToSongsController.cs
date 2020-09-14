﻿using System;
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
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class TagsToSongsController : ApiController
    {
        public List<TagsToSongsDTO> GetTagsToSong(int songId)
        {
            return TagsToSongsBL.GetTagsToSong(songId);
        }
        public List<string> GetTagsNamesToSong(int songId)
        {
            return TagsToSongsBL.GetTagsNamesToSong(songId);
        }
        public List<string> GetTagsIncludeArtistsToSong(int songId)
        {
            return TagsToSongsBL.GetTagsIncludeArtistsToSong(songId);
        }
        public static void PostTagToSong([FromBody] TagsToSongsTBL tagToSong)
        {
            TagsToSongsBL.AddTagToSong(tagToSong);
        }
    }
}