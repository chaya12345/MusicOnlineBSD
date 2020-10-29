using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class SongsDetailsBL
    {
        public static List<songsDetails> GetSongs()
        {
            List<SongsDTO> list = SongsBL.GetSongs();
            if (list != null)
                return Casts.ToSongsDetailsDTO.GetSongsDetails(list);
            return null;
        }
        public static songsDetails GetSongById(int songId)
        {
            SongsDTO song = SongsBL.GetSongById(songId);
            if (song != null)
                return Casts.ToSongsDetailsDTO.comperSongToSongsDetails(song);
            return null;
        }
        public static List<songsDetails> GetSongsBySinger(string singerName)
        {
            List<SongsDTO> list = SongsBL.GetSongsBySinger(singerName);
            if (list != null)
                return Casts.ToSongsDetailsDTO.GetSongsDetails(list);
            return null;
        }
        public static List<songsDetails> GetSongsByAlbum(string albumName)
        {
            List<SongsDTO> list = SongsBL.GetSongsByAlbum(albumName);
            if (list != null)
                return Casts.ToSongsDetailsDTO.GetSongsDetails(list);
            return null;
        }
        public static List<songsDetails> GetSongsByTag(string tagName)
        {
            List<SongsDTO> list = SongsBL.GetSongsByTag(tagName);
            if (list != null)
                return Casts.ToSongsDetailsDTO.GetSongsDetails(list);
            return null;
        }
        public static List<songsDetails> GetSongsByTagOrArtist(string name)
        {
            List<SongsDTO> list = SongsBL.GetSongsByTagOrArtist(name);
            if (list != null)
                return Casts.ToSongsDetailsDTO.GetSongsDetails(list);
            return null;
        }
        public static List<songsDetails> GetSongsByTagId(int tagId)
        {
            List<SongsDTO> list = SongsBL.GetSongsByTagId(tagId);
            if (list != null)
                return Casts.ToSongsDetailsDTO.GetSongsDetails(list);
            return null;
        }
        public static List<songsDetails> GetSongsByTags(List<string> tags)
        {
            List<SongsDTO> list = SongsBL.GetSongsByTags(tags);
            if (list != null)
                return Casts.ToSongsDetailsDTO.GetSongsDetails(list);
            return null;
        }
        public static List<songsDetails> GetSongsByAllTags(List<string> tags)
        {
            List<SongsDTO> list = SongsBL.GetSongsByAllTags(tags);
            if (list != null)
                return Casts.ToSongsDetailsDTO.GetSongsDetails(list);
            return null;
        }
        public static List<songsDetails> GetSimilarSongs(int songId)
        {
            List<songsDetails> list = SongsBL.GetSimilarSongs(songId);
            return list != null ? list : null;
        }
        public static List<songsDetails> GetSongsByArtist(string artistName)
        {
            List<SongsDTO> list = SongsBL.GetSongsByArtist(artistName);
            if (list != null)
                return Casts.ToSongsDetailsDTO.GetSongsDetails(list);
            return null;
        }
        public static List<songsDetails> GetSongsByArtistsAndSingers(string name)
        {
            List<SongsDTO> list = SongsBL.GetSongsByArtistsAndSingers(name);
            if (list != null)
                return Casts.ToSongsDetailsDTO.GetSongsDetails(list);
            return null;
        }
        public static List<songsDetails> GetPerformances()
        {
            List<SongsDTO> list = SongsBL.GetPerformances();
            if (list != null)
                return Casts.ToSongsDetailsDTO.GetSongsDetails(list);
            return null;
        }
        public static List<songsDetails> GetSongsPublishedThisYear()
        {
            List<SongsDTO> list = SongsBL.GetSongsPublishedThisYear();
            if (list != null)
                return Casts.ToSongsDetailsDTO.GetSongsDetails(list);
            return null;
        }
    }
}
