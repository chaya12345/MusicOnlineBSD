using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using DTO;
using DAL;

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

        public void PostTagToSong(int songId,int tagId)
        {
            SongsBL.AddTagToSong(songId, tagId);
        }
        public void PostArtistToSong(int songId, int artistId)
        {
            SongsBL.AddArtistToSong(songId, artistId);
        }
    }
}