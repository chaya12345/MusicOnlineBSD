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
            List<SongsDTO> result= Casts.ToSongsDTO.GetSongs(et.SongsTBL.Where(s => s.singerId == singerId.id).ToList());
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
            TagNameTBL tagId =et.TagNameTBL.Where(t=>t.name==tagName).FirstOrDefault();
            List<SongsDTO> AllSong = GetSongs();
            List<SongsDTO> result = new List<SongsDTO>();
            foreach (SongsDTO song in AllSong)
            {
                if (song.tagsId!=null && tagId!=null && IsSongContainTag(song.tagsId, tagId.id))
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
                    TagNameTBL tagId = et.TagNameTBL.Where(a => a.name == tag).FirstOrDefault();
                    if (song.tagsId!=null && tagId!=null && IsSongContainTag(song.tagsId, tagId.id))
                        mutchTag++;
                }
                if (mutchTag == tags.Count())
                    result.Add(song);
                mutchTag = 0;
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
                et.SaveChanges();
                return;
            }
            if (tags.tag2 == null)
            {
                tags.tag2 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag3 == null)
            {
                tags.tag3 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag4 == null)
            {
                tags.tag4 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag5 == null)
            {
                tags.tag5 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag6 == null)
            {
                tags.tag6 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag7 == null)
            {
                tags.tag7 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag8 == null)
            {
                tags.tag8 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag9 == null)
            {
                tags.tag9 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag10 == null)
            {
                tags.tag10 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag11 == null)
            {
                tags.tag11 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag12 == null)
            {
                tags.tag12 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag13 == null)
            {
                tags.tag13 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag14 == null)
            {
                tags.tag14 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag15 == null)
            {
                tags.tag15 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag16 == null)
            {
                tags.tag16 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag17 == null)
            {
                tags.tag17 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag18 == null)
            {
                tags.tag18 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag19 == null)
            {
                tags.tag19 = tagNameId;
                et.SaveChanges();
                return;
            }
            if (tags.tag20 == null)
            {
                tags.tag20 = tagNameId;
                et.SaveChanges();
                return;
            }
        }
        public static void AddArtistToSong(int songId, int artistId)
        {
            SongsTBL song = et.SongsTBL.Where(s => s.id == songId).FirstOrDefault();
            ArtistsTBL artist = et.ArtistsTBL.Where(a => a.id == song.artistId).FirstOrDefault();
            if (artist.art1 == null)
            {
                artist.art1 = artistId;
                et.SaveChanges();
                return;
            }
            if (artist.art2 == null)
            {
                artist.art2 = artistId;
                et.SaveChanges();
                return;
            }
            if (artist.art3 == null)
            {
                artist.art3 = artistId;
                et.SaveChanges();
                return;
            }
            if (artist.art4 == null)
            {
                artist.art4 = artistId;
                et.SaveChanges();
                return;
            }
            if (artist.art5 == null)
            {
                artist.art5 = artistId;
                et.SaveChanges();
                return;
            }
            if (artist.art6 == null)
            {
                artist.art6 = artistId;
                et.SaveChanges();
                return;
            }
            if (artist.art7 == null)
            {
                artist.art7 = artistId;
                et.SaveChanges();
                return;
            }
            if (artist.art8 == null)
            {
                artist.art8 = artistId;
                et.SaveChanges();
                return;
            }
            if (artist.art9 == null)
            {
                artist.art9 = artistId;
                et.SaveChanges();
                return;
            }
            if (artist.art10 == null)
            {
                artist.art10 = artistId;
                et.SaveChanges();
                return;
            }
        }
    }
}
