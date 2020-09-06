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
            return Casts.ToSongsDTO.GetSongs(et.SongsTBL.ToList());
        }
        public static List<SongsDTO> GetSongsBySinger(string singerName)
        {
            SingersTBL singerId = et.SingersTBL.Where(s => s.name == singerName).FirstOrDefault();
            List<SongsDTO> result = Casts.ToSongsDTO.GetSongs(et.SongsTBL.Where(s => s.singerId == singerId.id).ToList());
            result.AddRange(GetSongsByTag(singerName));
            return result;
        }
        public static List<SongsDTO> GetSongsByAlbum(string albumName)
        {
            long id = et.AlbumsTBL.Where(a => a.name == albumName).FirstOrDefault().id;
            return Casts.ToSongsDTO.GetSongs(et.SongsTBL.Where(a => a.albumId == id).ToList());
        }
        public static List<SongsDTO> GetSongsByTag(string tagName)
        {
            List<SongsTBL> list = GetSongInListByTag(et.SongsTBL.ToList(), tagName);
            if (list != null)
                return Casts.ToSongsDTO.GetSongs(list);
            return null;

        }
        private static List<SongsTBL> GetSongInListByTag(List<SongsTBL> songs, string tagName)
        {
            TagsTBL tag = et.TagsTBL.Where(t => t.name == tagName).FirstOrDefault();
            List<SongsTBL> result = new List<SongsTBL>();
            if (tag != null && songs != null)
            {
                List<TagsToSongsTBL> tagToSongs = et.TagsToSongsTBL.Where(t => t.tagId == tag.id).ToList();
                foreach (TagsToSongsTBL song in tagToSongs)
                {
                    SongsTBL songIn = songs.Where(s => s.id == song.songId).FirstOrDefault();
                    if(songIn!=null)
                        result.Add(songIn);
                }
                return result;
            }
            return null;
        }
        public static List<SongsDTO> GetSongsByTags(List<string> tags)
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
            List<SongsTBL> songs = et.SongsTBL.ToList();
            List<SongsTBL> flag = et.SongsTBL.ToList();
            foreach (string tag in tags)
            {
                flag = GetSongInListByTag(songs, tag);
                if (flag != null)
                    songs = flag;
                else
                    break;
            }
            if (flag != null)
                return Casts.ToSongsDTO.GetSongs(songs);
            return null;
        }
        public static void AddSong(SongsTBL song)
        {
            et.SongsTBL.Add(song);
            et.SaveChanges();
        }
        public static void DeleteSong(int songId)
        {
            SongsTBL song = et.SongsTBL.Where(s => s.id == songId).FirstOrDefault();
            et.SongsTBL.Remove(song);
            et.SaveChanges();
        }

    }
}
