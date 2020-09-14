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
    public class SimilarSongs
    {
        public int songId;
        public int numberOfMatchingTags;
    }
    public class SongsBL
    {
        public static List<SongsDTO> GetSongs()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToSongsDTO.GetSongs(et.SongsTBL.ToList());
        }
        public static SongsDTO GetSongById(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToSongsDTO.GetSong(et.SongsTBL.Where(song => song.id == songId).FirstOrDefault());
        }
        public static List<SongsDTO> GetSongsBySinger(string singerName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingersTBL singerId = et.SingersTBL.Where(s => s.name == singerName).FirstOrDefault();
            List<SongsDTO> result = Casts.ToSongsDTO.GetSongs(et.SongsTBL.Where(s => s.singerId == singerId.id).ToList());
            result.AddRange(GetSongsByTag(singerName));
            return result;
        }
        public static List<SongsDTO> GetSongsByAlbum(string albumName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            long id = et.AlbumsTBL.Where(a => a.name == albumName).FirstOrDefault().id;
            return Casts.ToSongsDTO.GetSongs(et.SongsTBL.Where(a => a.albumId == id).ToList());
        }
        public static List<SongsDTO> GetSongsByTag(string tagName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            int tagId = et.TagsTBL.Where(tag => tag.name == tagName).FirstOrDefault().id;
            List<int?> songsId = et.TagsToSongsTBL.Where(tagToSong => tagToSong.tagId == tagId)
                .Select(t => t.songId).ToList();
            List<SongsTBL> songsIncludeTag = new List<SongsTBL>();
            foreach (int? songId in songsId)
            {
                songsIncludeTag.Add(et.SongsTBL.Where(song => song.id == songId).FirstOrDefault());
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
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsTBL> songsIncludeAllTags = new List<SongsTBL>();
            if (tags != null) {
                List<SongsTBL> songsList = et.SongsTBL.ToList();
                foreach (SongsTBL song in songsList)
                {
                    List<TagsToSongsDTO> tagsToSong = TagsToSongsBL.GetTagsToSong(song.id);
                    bool isContain = true;
                    foreach (var tagName in tags)
                    {
                        int tagId = et.TagsTBL.Where(t => t.name == tagName).FirstOrDefault().id;
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
            MusicOnlineEntities et = new MusicOnlineEntities();
            et.SongsTBL.Add(song);
            et.SaveChanges();
        }
        public static void DeleteSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsTBL song = et.SongsTBL.Where(s => s.id == songId).FirstOrDefault();
            et.SongsTBL.Remove(song);
            et.SaveChanges();
        }
        private static int GetCountOfSimilarTags(int? songId, List<string> tags)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            int count = 0;
            List<TagsToSongsDTO> tagsToSong = TagsToSongsBL.GetTagsToSong(songId.Value);
            foreach (string tagName in tags)
            {
                int tagId = et.TagsTBL.Where(t => t.name == tagName).FirstOrDefault().id;
                if (tagsToSong.Select(tag => tag.tagId).Contains(tagId) == true)
                    count++;
            }
            return count;
        }
        public static void IncreaseLike(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsTBL song = et.SongsTBL.Where(s => s.id == songId).FirstOrDefault();
            if (song != null)
            {
                if (song.count_like == null)
                    song.count_like = 1;
                else song.count_like++;
                et.SaveChanges();
            }
        }
        public static void DecreaseLike(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsTBL song = et.SongsTBL.Where(s => s.id == songId).FirstOrDefault();
            if (song != null)
            {
                if (song.count_like == null || song.count_like == 0)
                    song.count_like = 0;
                else song.count_like--;
                et.SaveChanges();
            }
        }
        public static List<SongsDTO> GetSimilarSongs(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<string> tags = TagsToSongsBL.GetTagsNamesToSong(songId);
            List<TagsTBL> tagsTBL = et.TagsTBL.Where(t => tags.Contains(t.name)).ToList();
            //קבלת סוג הג'אנר
            int? janer = tagsTBL.Where(t => t.tagTypeId != null).FirstOrDefault().id;
            int janerInt = int.Parse(janer + "");
            //כל השירים שנמצאים בג'אנר הזה
            List<TagsToSongsTBL> tagsToSong = et.TagsToSongsTBL.Where(t => t.tagId ==janerInt).ToList();
            List<SongsTBL> songsInJaner = new List<SongsTBL>();
            List<SimilarSongs> similarSongs = new List<SimilarSongs>();
            //הכנסה לרשימה של השירים את כל השירים ששיכים לג'אנר מסוים
            foreach (TagsToSongsTBL tagToSong in tagsToSong)
            {
                SongsTBL song = et.SongsTBL.Where(s => s.id == tagToSong.songId).FirstOrDefault();
                if (song != null)
                    songsInJaner.Add(song);
            }
            //מכניסים את כל השירים לרשימה מסוג שירים דומים
            foreach (SongsTBL song in songsInJaner)
            {
                if (song.id != songId)
                    similarSongs.Add(new SimilarSongs() { songId = song.id, numberOfMatchingTags = GetCountOfSimilarTags(song.id, tags) });
            }
            //ממינים את השירים מאותו ג'אנר לפי השיר המתאים ביותר
            similarSongs = similarSongs.OrderByDescending(s => s.numberOfMatchingTags).ToList();
            List<SongsTBL> result = new List<SongsTBL>();
            foreach (SimilarSongs song in similarSongs)
            {
                int IdSong = song.songId;
                result.Add(et.SongsTBL.Where(s => s.id == IdSong).FirstOrDefault());
            }
            return Casts.ToSongsDTO.GetSongs(result);
        }
    }
    
}
