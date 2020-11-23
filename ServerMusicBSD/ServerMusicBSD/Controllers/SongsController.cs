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
    public class SongObj
    {
        public SongsTBL song;
        public string[] singers;
        public string[] tags;
        public ArtistWithJob[] artists;
    }
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class SongsController : ApiController
    {
        public List<songsDetails> GetSongs()
        {
            return SongsBL.GetSongs();
        }
        public songsDetails GetSongById(int songId)
        {
            return SongsBL.GetSongById(songId);
        }
        public List<songsDetails> GetSongsBySinger(string singerName)
        {
            return SongsBL.GetSongsBySinger(singerName);
        }
        public List<songsDetails> GetSongsByAlbum(string albumName)
        {
            return SongsBL.GetSongsByAlbum(albumName);
        }
        public List<songsDetails> GetSongsByTag(string tagName)
        {
            return SongsBL.GetSongsByTag(tagName);
        }
        public List<songsDetails> GetSongsByTagOrArtist(string name)
        {
            return SongsBL.GetSongsByTagOrArtist(name);
        }
        public List<songsDetails> GetSongsByTagId(int tagId)
        {
            return SongsBL.GetSongsByTagId(tagId);
        }
        public SingersDTO GetSingerOfSong(int songId)
        {
            return SongsBL.GetSingerOfSong(songId);
        }
        public List<songsDetails> PostSongsByTags([FromBody] TagsResponse tagsResponse)
        {
            return SongsBL.GetSongsByTags(tagsResponse.tags);
        }
        public List<songsDetails> PostSongsByAllTags([FromBody] TagsResponse tagsResponse)
        {
            return SongsBL.GetSongsByAllTags(tagsResponse.tags);
        }
        public void PostSong([FromBody] SongObj songObj)
        {
            if (songObj.singers.Length > 0)
            {
                SongsBL.AddSong(songObj.song, songObj.singers[0]);
                SongsTBL song = SongsBL.getSongByName(songObj.song.name);
                if (song != null)
                {
                    TagsToSongsBL.AddTagsToSong(songObj.tags, song.id);
                    ArtistsToSongsBL.AddArtistsToSong(songObj.artists, song.id);
                    ArtistsToSongsBL.AddArtistsToDuet(songObj.singers, song.id);
                }
            }
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
        public List<songsDetails> GetSongsByArtist(string artistName)
        {
            return SongsBL.GetSongsByArtist(artistName);
        }
        public List<songsDetails> GetSongsByArtistsAndSingers(string name)
        {
            return SongsBL.GetSongsByArtistsAndSingers(name);
        }
        public List<songsDetails> GetPerformances()
        {
            return SongsBL.GetPerformances();
        }
        public List<songsDetails> GetSongsPublishedThisYear()
        {
            return SongsBL.GetSongsPublishedThisYear();
        }
        public void PutViewToSong(int songId)
        {
            SongsBL.AddViewToSong(songId);
        }
    }
}