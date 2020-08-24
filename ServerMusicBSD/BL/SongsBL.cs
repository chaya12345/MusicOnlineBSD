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
            int id = et.SingersTBL.Where(s => s.name == singerName).FirstOrDefault().id;
            return Casts.ToSongsDTO.GetSongs(et.SongsTBL.Where(s => s.singerId == id).ToList());
        }
        public static List<SongsDTO> GetSongsByAlbum(string albumName)
        {
            int id = et.AlbumsTBL.Where(a => a.name == albumName).FirstOrDefault().id;
            return Casts.ToSongsDTO.GetSongs(et.SongsTBL.Where(a => a.albumId == id).ToList());
        }
        //public static List<SongsDTO> GetSongsByTag(string tagName)
        //{
        //    int id = et.TagNameTBL.Where(t => t.name == tagName).FirstOrDefault().id;
        //    List<SongsTBL> AllSong = et.SongsTBL.ToList();
        //    List<SongsTBL> list = new List<SongsTBL>();
        //    if (id != null)
        //    {
        //        foreach (SongsTBL song in AllSong)
        //        {
        //            TagsTBL tagsOfSong = et.TagsTBL.Where(t => t.id == song.tagsId).FirstOrDefault();
        //            if (tagsOfSong.tag1 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag2 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag3 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag4 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag5 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag6 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag7 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag8 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag9 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag10 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag11 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag12 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag13 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag14 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag15 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag16 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag17 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag18 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag19 == id)
        //            {
        //                list.Add(song);
        //            }
        //            if (tagsOfSong.tag20 == id)
        //            {
        //                list.Add(song);
        //            }


        //        }
        //    }
        //    return Casts.ToSongsDTO.GetSongs(list);
        //}
        //public static List<SongsDTO> GetSongsByTags(string[] tags)
        //{
        //    List<SongsDTO> songs = new List<SongsDTO>();
        //    foreach (string tag in tags)
        //    {
        //        songs.AddRange(GetSongsByTag(tag));
        //    }
        //    return songs;
        //}
        //public static List<SongsDTO> GetSongsByAllTags(List<string> tags)
        //{
        //    List<SongsDTO> songs = GetSongs();
        //    List<SongsTBL> resultSongs = new List<SongsTBL>();
        //    int mutchSong = 0;

        //    foreach (SongsDTO song in songs)
        //    {
        //        TagsTBL tagsTBL = et.TagsTBL.Where(t => t.id == song.tagsId).FirstOrDefault();
        //        if (tagsTBL.tag1 != null)
        //        {
// if(tags.Contains(et.TagNameTBL.Where(t=>t.id==tag1).FirstOrDefault().name)
//שtag1 לא ריק וגם מוכל במערך
//ככה צריך לבדוק כל שיר ושיר
//וצריך להוסיף עוד משתנה כאונט שיספור כמה היה תגים מוכלים
//אם מספר התגים המוכלים שווה לאורך המערך של התגים שהתרבל אז נוסיף את השיר לרשימת השירים המוחזרת
        //        }
                

        //    }
        //    return Casts.ToSongsDTO.GetSongs(resultSongs);
        //}

        public static void addSong(SongsTBL song)
        {
            et.SongsTBL.Add(song);
            et.SaveChanges();
        }
        public static void DeleteSong(int songId)
        {
            if (songId != null)
            {
                SongsTBL song = et.SongsTBL.Where(s => s.id == songId).FirstOrDefault();
                et.SongsTBL.Remove(song);
                et.SaveChanges();
            }

        }
    }
}
