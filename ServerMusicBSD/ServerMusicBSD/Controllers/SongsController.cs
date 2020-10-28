using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using DTO;
using DAL;
using System.Web.Http.Cors;
using System.Net.Mail;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class SongsController : ApiController
    {
        public List<SongsDTO> GetSongs()
        {
            return SongsBL.GetSongs();
        }
        public SongsDTO GetSongById(int songId)
        {
            return SongsBL.GetSongById(songId);
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
        public List<SongsDTO> GetSongsByTagOrArtist(string name)
        {
            return SongsBL.GetSongsByTagOrArtist(name);
        }
        public List<SongsDTO> GetSongsByTagId(int tagId)
        {
            return SongsBL.GetSongsByTagId(tagId);
        }
        public List<SongsDTO> PostSongsByTags([FromBody] TagsResponse tagsResponse)
        {
            return SongsBL.GetSongsByTags(tagsResponse.tags);
        }
        public List<SongsDTO> PostSongsByAllTags([FromBody] TagsResponse tagsResponse)
        {
            return SongsBL.GetSongsByAllTags(tagsResponse.tags);
        }
        public void PostSong([FromBody] SongsTBL song)
        {
            SongsBL.AddSong(song);
        }
        public void DeleteSong(int songId)
        {
            SongsBL.DeleteSong(songId);
        }
        public List<songsDetails> GetSimilarSongs(int songId)
        {
           return SongsBL.GetSimilarSongs(songId);
        }
        public void PutIncreaseLikeToSong(int songId)
        {
            SongsBL.IncreaseLike(songId);
        }
        public void PutDecreaseLikeToSong(int songId)
        {
            SongsBL.DecreaseLike(songId);
        }
        public  List<SongsDTO> GetSongsByArtist(string artistName)
        {
            return SongsBL.GetSongsByArtist(artistName);
        }
        public  List<SongsDTO> GetSongsByArtistsAndSingers(string name)
        {
            return SongsBL.GetSongsByArtistsAndSingers(name);
        }
        public List<SongsDTO> GetPerformances()
        {
            return SongsBL.GetPerformances();
        }
        public List<SongsDTO> GetSongsPublishedThisYear()
        {
            return SongsBL.GetSongsPublishedThisYear();
        }
        public  string GetToJewishDateString(string format)
        {
            return SongsBL.ToJewishDateString(DateTime.Today,format);
        }
    }
}