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
            int singerId = et.SingersTBL.Where(s => s.name == singerName).FirstOrDefault().id;
            List<SongsDTO> result= Casts.ToSongsDTO.GetSongs(et.SongsTBL.Where(s => s.singerId == singerId).ToList());
            result.AddRange(GetSongsByTag(singerName));
            return result;
        }
        public static List<SongsDTO> GetSongsByAlbum(string albumName)
        {
            int id = et.AlbumsTBL.Where(a => a.name == albumName).FirstOrDefault().id;
            return Casts.ToSongsDTO.GetSongs(et.SongsTBL.Where(a => a.albumId == id).ToList());
        }
        public static List<SongsDTO> GetSongsByTag(string tagName)
        {
            int tagId=et.TagNameTBL.Where(t=>t.name==tagName).FirstOrDefault().id;
            List<SongsDTO> AllSong = GetSongs();
            List<SongsDTO> result = new List<SongsDTO>();
            foreach (SongsDTO song in AllSong)
            {
                if (IsSongContainTag(song.tagsId, tagId))
                {
                    result.Add(song);
                }
            }
            return result;
        }
        public static bool IsSongContainTag(Nullable<int> tagsId,int Tag)
        {
            TagsTBL tags = et.TagsTBL.Where(t => t.id == tagsId).FirstOrDefault();
            if (tags.tag1 != null && tags.tag1 == Tag)
                return true;
            if (tags.tag2 != null && tags.tag2 == Tag)
                return true;
            if (tags.tag3 != null && tags.tag3 == Tag)
                return true;
            if (tags.tag4 != null && tags.tag4 == Tag)
                return true;
            if (tags.tag5 != null && tags.tag5 == Tag)
                return true;
            if (tags.tag6 != null && tags.tag6 == Tag)
                return true;
            if (tags.tag7 != null && tags.tag7 == Tag)
                return true;
            if (tags.tag8 != null && tags.tag8 == Tag)
                return true;
            if (tags.tag9 != null && tags.tag9 == Tag)
                return true;
            if (tags.tag10 != null && tags.tag10 == Tag)
                return true;
            if (tags.tag11 != null && tags.tag11 == Tag)
                return true;
            if (tags.tag12 != null && tags.tag12 == Tag)
                return true;
            if (tags.tag13 != null && tags.tag13 == Tag)
                return true;
            if (tags.tag14 != null && tags.tag14 == Tag)
                return true;
            if (tags.tag15 != null && tags.tag15 == Tag)
                return true;
            if (tags.tag16 != null && tags.tag16 == Tag)
                return true;
            if (tags.tag17 != null && tags.tag17 == Tag)
                return true;
            if (tags.tag18 != null && tags.tag18 == Tag)
                return true;
            if (tags.tag19 != null && tags.tag19 == Tag)
                return true;
            if (tags.tag20 != null && tags.tag20 == Tag)
                return true;
            return false;
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
            int mutchTag = 0;
            List<SongsDTO> allSongs = GetSongs();
            List<SongsDTO> result = new List<SongsDTO>();
            foreach (SongsDTO song in allSongs)
            {
                //בדיקה עבור כל שיר אם הוא מכיל את כל התגיות
                foreach (string tag in tags)
                {
                    int tagId = et.TagNameTBL.Where(a => a.name == tag).FirstOrDefault().id;
                    if (IsSongContainTag(song.tagsId, tagId))
                        mutchTag++;
                }
                if (mutchTag == tags.Count())
                    result.Add(song);
            }
            return result;
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
        public static void AddTagToSong(int songId,int tagNameId)
        {
            SongsTBL song = et.SongsTBL.Where(s => s.id == songId).FirstOrDefault();
            TagsTBL tags = et.TagsTBL.Where(t => t.id == song.tagsId).FirstOrDefault();
            if(tags.tag1==null)
            {
                tags.tag1 = tagNameId;
                return;
            }
            if (tags.tag2 == null)
            {
                tags.tag2 = tagNameId;
                return;
            }
            if (tags.tag3 == null)
            {
                tags.tag3 = tagNameId;
                return;
            }
            if (tags.tag4 == null)
            {
                tags.tag4 = tagNameId;
                return;
            }
            if (tags.tag5 == null)
            {
                tags.tag5 = tagNameId;
                return;
            }
            if (tags.tag6 == null)
            {
                tags.tag6 = tagNameId;
                return;
            }
            if (tags.tag7 == null)
            {
                tags.tag7 = tagNameId;
                return;
            }
            if (tags.tag8 == null)
            {
                tags.tag8 = tagNameId;
                return;
            }
            if (tags.tag9 == null)
            {
                tags.tag9 = tagNameId;
                return;
            }
            if (tags.tag10 == null)
            {
                tags.tag10 = tagNameId;
                return;
            }
            if (tags.tag11 == null)
            {
                tags.tag11 = tagNameId;
                return;
            }
            if (tags.tag12 == null)
            {
                tags.tag12 = tagNameId;
                return;
            }
            if (tags.tag13 == null)
            {
                tags.tag13 = tagNameId;
                return;
            }
            if (tags.tag14 == null)
            {
                tags.tag14 = tagNameId;
                return;
            }
            if (tags.tag15 == null)
            {
                tags.tag15 = tagNameId;
                return;
            }
            if (tags.tag16 == null)
            {
                tags.tag16 = tagNameId;
                return;
            }
            if (tags.tag17 == null)
            {
                tags.tag17 = tagNameId;
                return;
            }
            if (tags.tag18 == null)
            {
                tags.tag18 = tagNameId;
                return;
            }
            if (tags.tag19 == null)
            {
                tags.tag19 = tagNameId;
                return;
            }
            if (tags.tag20 == null)
            {
                tags.tag20 = tagNameId;
                return;
            }
        }
    }
}
