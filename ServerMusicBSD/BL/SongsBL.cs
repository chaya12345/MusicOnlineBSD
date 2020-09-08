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
            return Casts.ToSongsDTO.GetSongs(et.SongsTBLs.ToList());
        }
        public static List<SongsDTO> GetSongsBySinger(string singerName)
        {
            SingersTBL singerId = et.SingersTBLs.Where(s => s.name == singerName).FirstOrDefault();
            List<SongsDTO> result = Casts.ToSongsDTO.GetSongs(et.SongsTBLs.Where(s => s.singerId == singerId.id).ToList());
            result.AddRange(GetSongsByTag(singerName));
            return result;
        }
        public static List<SongsDTO> GetSongsByAlbum(string albumName)
        {
            long id = et.AlbumsTBLs.Where(a => a.name == albumName).FirstOrDefault().id;
            return Casts.ToSongsDTO.GetSongs(et.SongsTBLs.Where(a => a.albumId == id).ToList());
        }
        public static List<SongsDTO> GetSongsByTag(string tagName)
        {
            int tagId = et.TagsTBLs.Where(tag => tag.name == tagName).FirstOrDefault().id;
            List<int?> songsId = et.TagsToSongsTBLs.Where(tagToSong => tagToSong.tagId == tagId)
                .Select(t => t.songId).ToList();
            List<SongsTBL> songsIncludeTag = new List<SongsTBL>();
            foreach (int? songId in songsId)
            {
                songsIncludeTag.Add(et.SongsTBLs.Where(song => song.id == songId).FirstOrDefault());
            }
            return Casts.ToSongsDTO.GetSongs(songsIncludeTag);
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
            List<SongsTBL> songsIncludeAllTags = new List<SongsTBL>();
            if (tags != null) {
                List<SongsTBL> songsList = et.SongsTBLs.ToList();
                foreach (SongsTBL song in songsList)
                {
                    List<TagsToSongsDTO> tagsToSong = TagsToSongsBL.GetTagsToSong(song.id);
                    bool isContain = true;
                    foreach (var tagName in tags)
                    {
                        int tagId = et.TagsTBLs.Where(t => t.name == tagName).FirstOrDefault().id;
                        if (tagsToSong.Select(tag => tag.tagId).Contains(tagId) == false)
                        {
                            isContain = false;
                            break;
                        }
                    }
                    if (isContain)
                        songsIncludeAllTags.Add(song);
                }
            }
            return Casts.ToSongsDTO.GetSongs(songsIncludeAllTags);
        }
        public static void AddSong(SongsTBL song)
        {
            et.SongsTBLs.Add(song);
            et.SaveChanges();
        }
        public static void DeleteSong(int songId)
        {
            SongsTBL song = et.SongsTBLs.Where(s => s.id == songId).FirstOrDefault();
            et.SongsTBLs.Remove(song);
            et.SaveChanges();
        }
        //public static List<SongsDTO> Get3SimilarSongs(int songId)
        //{
        //    List<string> tags = TagsToSongsBL.GetTagsNamesToSong(songId);
        //    List<SongsDTO> similarSong = GetSongsByAllTags(tags);
        //    if (similarSong.Count == 3)
        //        return similarSong;
        //    if (similarSong.Count > 3)
        //    {
        //        similarSong.RemoveRange(4, similarSong.Count - 3);
        //        return similarSong;
        //    }
        //   // List<SongsTBL> songsList = et.SongsTBLs.ToList();
        //   //et.TagsToSongsTBLs.Where(t => t.songId != songId)
        //   //       .OrderBy(t => GetCountOfSimilarTags(t.songId, tags)).GroupBy(t => t.songId).ToList();
        //   // for (int i = similarSong.Count; i < 3; i++)
        //   // {
                
        //   // }
            
        //} 
        private static int GetCountOfSimilarTags(int? songId, List<string> tags)
        {
            int count = 0;
            List<TagsToSongsDTO> tagsToSong = TagsToSongsBL.GetTagsToSong(int.Parse(songId+""));
            foreach (string tagName in tags)
            {
                int tagId = et.TagsTBLs.Where(t => t.name == tagName).FirstOrDefault().id;
                if (tagsToSong.Select(tag => tag.tagId).Contains(tagId) == true)
                    count++;
            }
            return count;
        }

    }
}
