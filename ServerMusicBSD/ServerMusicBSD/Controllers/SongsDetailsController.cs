using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using DAL;
using BL;
using DTO;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class SongsDetailsController : ApiController
    {
        public  List<songsDetails> GetSongs()
        {
            return SongsDetailsBL.GetSongs();
        }
        public songsDetails GetSongById(int songId)
        {
            return SongsDetailsBL.GetSongById(songId);
        }
        public List<songsDetails> GetSongsBySinger(string singerName)
        {
            return SongsDetailsBL.GetSongsBySinger(singerName);
        }
        public List<songsDetails> GetSongsByAlbum(string albumName)
        {
            return SongsDetailsBL.GetSongsByAlbum(albumName);
        }
        public List<songsDetails> GetSongsByTag(string tagName)
        {
            return SongsDetailsBL.GetSongsByTag(tagName);
        }
        public List<songsDetails> GetSongsByTagOrArtist(string name)
        {
            return SongsDetailsBL.GetSongsByTagOrArtist(name);
        }
        public List<songsDetails> GetSongsByTagId(int tagId)
        {
            return SongsDetailsBL.GetSongsByTagId(tagId);
        }
        public List<songsDetails> PostSongsByTags([FromBody] TagsResponse tagsResponse)
        {
            return SongsDetailsBL.GetSongsByTags(tagsResponse.tags);
        }
        public List<songsDetails> PostSongsByAllTags([FromBody] TagsResponse tagsResponse)
        {
            return SongsDetailsBL.GetSongsByAllTags(tagsResponse.tags);
        }
        public List<songsDetails> GetSimilarSongs(int songId)
        {
            return SongsDetailsBL.GetSimilarSongs(songId);
        }
        public List<songsDetails> GetSongsByArtist(string artistName)
        {
            return SongsDetailsBL.GetSongsByArtist(artistName);
        }
        public List<songsDetails> GetSongsByArtistsAndSingers(string name)
        {
            return SongsDetailsBL.GetSongsByArtistsAndSingers(name);
        }
        public List<songsDetails> GetPerformances()
        {
            return SongsDetailsBL.GetPerformances();
        }
        public List<songsDetails> GetSongsPublishedThisYear()
        {
            return SongsDetailsBL.GetSongsPublishedThisYear();
        }
    }
}