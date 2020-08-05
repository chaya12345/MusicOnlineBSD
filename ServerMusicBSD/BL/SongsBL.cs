using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;
using System.Data.Entity.SqlServer;
using System.Data.Entity.Core.Objects.DataClasses;
using System.Data.SqlClient;
using System.Data;
using Newtonsoft.Json;

namespace BL
{

    public class TagsResponse
    {
        public List<string> tags;
    }
    public class SongsBL
    {

        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static List<SongsDTO> GetSongs()
        {
            return Casts.ToSongsDTO.GetSongs(et.getSongs().ToList());
        }
        public static List<SongsDTO> GetSongsBySinger(string singerName)
        {
            return Casts.ToSongsDTO.GetSongs(et.searchBySinger(singerName).ToList());
        }
        public static List<SongsDTO> GetSongsByAlbum(string albumName)
        {
            return Casts.ToSongsDTO.GetSongs(et.searchByAlbum(albumName).ToList());
        }
        public static List<SongsDTO> GetSongsByTag(string tagName)
        {
            return Casts.ToSongsDTO.GetSongs(et.getByTag(tagName).ToList());
        }
        public static List<SongsDTO> GetSongsByTags(string[] tags)
        {
            List<SongsDTO> songs = new List<SongsDTO>();
            foreach (string tag in tags)
            {
                songs.AddRange(GetSongsByTag(tag));
            }
            return songs;
        }
        public static List<SongsDTO> GetSongsByAllTags(List<string> tags)
        {
            List<SongsDTO> songs = GetSongs();
            List<SongsDTO> resultSongs = new List<SongsDTO>();

            foreach (SongsDTO song in songs)
            {
                List<List<string>> list;
                var tagsToSong = et.getTagsOfSong(song.id);
                if (song.tagsId != null)
                    list = tagsToSong.Select(t => new List<string>() { t.Tag1, t.Tag2, t.Tag3 }).ToList();
                //    bool contain = true;
                //    foreach (string tag in tags)
                //    {
                //        if (!tagsToSong.Contains(tag))
                //            contain = false;
                //    }
                //    if (contain)
                //        resultSongs.Add(song);
            }
            return resultSongs;
        }

    }
}
