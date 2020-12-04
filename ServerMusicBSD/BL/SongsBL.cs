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
using System.Data.Entity.Validation;
using System.Globalization;

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
    enum eNecessityLevel { HARD, FLEXIBLE };
    struct Necessity
    {
        public eNecessityLevel level { get; set; }
        public string tag { get; set; }
        public Necessity(eNecessityLevel level, string tag)
        {
            this.level = level;
            this.tag = tag;
        }
    }
    public class SongsBL
    {
        static List<Necessity> necessity = new List<Necessity>() {
            new Necessity(eNecessityLevel.HARD, "ג'אנר"),
            new Necessity(eNecessityLevel.HARD, "מקצב"),
            new Necessity(eNecessityLevel.HARD, "ווקאלי"),
            new Necessity(eNecessityLevel.FLEXIBLE, "סגנון"),
            new Necessity(eNecessityLevel.FLEXIBLE, "נושא")
        };
        public static List<songsDetails> GetSongs()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsTBL> list = et.SongsTBL.Where(s => s != null && s.isPerformance == false).ToList();
            if (list != null)
                return Casts.ToSongsDTO.GetSongs(list);
            return null;
        }
        public static SongsTBL getSongByName(string name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.SongsTBL.Where(s => s != null && s.name == name).FirstOrDefault();
        }
        public static List<songsDetails> GetSongsIncludePerformances()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsTBL> list = et.SongsTBL.Where(s => s != null).ToList();
            if (list != null)
            {
                return Casts.ToSongsDTO.GetSongs(list);
            }
            return null;
        }
        public static songsDetails GetSongById(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsTBL song1 = et.SongsTBL.Where(song => song.id == songId).FirstOrDefault();
            if (song1 != null)
                return Casts.ToSongsDTO.GetSongWithSingerName(song1);
            return null;
        }
        public static SingersDTO GetSingerOfSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsTBL currentSong = et.SongsTBL.Where(song => song.id == songId).FirstOrDefault();
            if (currentSong != null)
            {
                SingersTBL currentSinger = et.SingersTBL.Where(singer => singer.id == currentSong.singerId).FirstOrDefault();
                if (currentSinger != null)
                    return Casts.ToSingersDTO.GetSinger(currentSinger);
            }
            return null;
        }
        public static List<songsDetails> GetSongsBySinger(string singerName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingersTBL singerId = et.SingersTBL.Where(s => s != null && s.name == singerName).FirstOrDefault();
            if (singerId == null)
                return null;
            List<songsDetails> result = Casts.ToSongsDTO.GetSongs(et.SongsTBL.Where(s => s != null && s.singerId == singerId.id && s.isPerformance == false).ToList());
            var songsByTag = GetSongsByTag(singerName);
            if (songsByTag != null)
            {
                result.AddRange(songsByTag);
            }
            if (result != null)
                return result;
            return null;
        }
        public static List<songsDetails> GetSongsByAlbum(string albumName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            long id = 0;
            AlbumsTBL currentAlbum = et.AlbumsTBL.Where(a => a != null && a.name == albumName).FirstOrDefault();
            if (currentAlbum != null)
            {
                id = currentAlbum.id;
            }
            List<SongsTBL> list = et.SongsTBL.Where(a => a != null && a.albumId == id).ToList();
            if (list != null)
                return Casts.ToSongsDTO.GetSongs(list);
            return null;
        }
        public static List<songsDetails> GetSongsByTag(string tagName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            var tag = et.TagsTBL.Where(t => t != null && t.name == tagName).FirstOrDefault();
            if (tag != null)
            {
                int tagId = tag.id;
                List<int?> songsId = et.TagsToSongsTBL.Where(tagToSong => tagToSong != null && tagToSong.tagId == tagId)
                    .Select(t => t.songId).ToList();
                List<SongsTBL> songsIncludeTag = new List<SongsTBL>();
                foreach (int? songId in songsId)
                {
                    SongsTBL s = et.SongsTBL.Where(song => song != null && song.id == songId && song.isPerformance == false).FirstOrDefault();
                    if (s != null)
                        songsIncludeTag.Add(s);
                }
                if (songsIncludeTag != null)
                    return Casts.ToSongsDTO.GetSongs(songsIncludeTag);
            }
            return null;
        }
        public static List<songsDetails> GetSongsByTag(List<songsDetails> songs, string tagName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<songsDetails> suitableSongs = new List<songsDetails>();
            TagsDTO tag = Casts.ToTagsDTO.GetTag(et.TagsTBL.Where(t => t != null && t.name == tagName).FirstOrDefault());
            if (tag == null || songs == null)
                return null;
            foreach (songsDetails song in songs)
            {
                List<TagsDTO> tags = Casts.ToTagsDTO.GetTagsFromTagsToSong(TagsToSongsBL.GetTagsToSong(song.id).ToList());
                if (tags.Where(t => t != null && t.id == tag.id).FirstOrDefault() != null)
                    suitableSongs.Add(song);
            }
            if (suitableSongs != null)
                return suitableSongs;
            return null;
        }
        public static List<songsDetails> GetSongsByTagId(int tagId)
        {
            return GetSongsByTag(TagsBL.GetName(tagId));
        }
        public static List<songsDetails> GetSongsByTags(List<string> tags)
        {
            if (tags == null)
                return null;
            List<songsDetails> suitableSongs = new List<songsDetails>();
            foreach (string tag in tags)
            {

                List<songsDetails> list = GetSongsByTag(tag);
                if (list != null)
                    suitableSongs.AddRange(list);
            }
            if (suitableSongs != null)
                return suitableSongs;
            return null;
        }
        public static List<songsDetails> GetSongsByTagOrArtist(string name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<songsDetails> songs = new List<songsDetails>();
            if (et.TagsTBL.Where(tag => tag.name == name).FirstOrDefault() != null)
            {
                List<songsDetails> list = GetSongsByTag(name);
                if (list != null)
                    songs.AddRange(list);
            }
            if (et.ArtistsTBL.Where(artist => artist.name == name).FirstOrDefault() != null)
            {
                List<songsDetails> list = GetSongsByArtist(name);
                if (list != null)
                    songs.AddRange(list);
            }
            if (et.SingersTBL.Where(singer => singer.name == name).FirstOrDefault() != null)
            {
                List<songsDetails> list = GetSongsBySinger(name);
                if (list != null)
                    songs.AddRange(list);
            }
            songs = clearDuplicate(songs);
            return songs;
        }
        public static List<songsDetails> OrderSongsByTags(List<songsDetails> songs, List<string> tags)
        {
            List<songsDetails> suitableSongs = new List<songsDetails>();
            List<songsDetails> nonSuitableSongs = new List<songsDetails>();
            if (tags == null || songs == null)
                return null;
            foreach (string tag in tags)
            {
                List<songsDetails> list = GetSongsByTag(songs, tag);
                if (list != null)
                    suitableSongs.AddRange(list);
            }
            foreach (songsDetails song in songs)
            {
                if (!suitableSongs.Contains(song) && song != null)
                    nonSuitableSongs.Add(song);
            }
            List<songsDetails> orderSongs = new List<songsDetails>();
            if (suitableSongs != null && nonSuitableSongs!=null)
            {
                orderSongs.AddRange(suitableSongs);
                orderSongs.AddRange(nonSuitableSongs);
                orderSongs = clearDuplicate(orderSongs);
                return orderSongs;
            }
            return null;
        }
        public static List<songsDetails> clearDuplicate(List<songsDetails> songs)
        {
            List<songsDetails> clearList = new List<songsDetails>();
            if (songs == null)
                return null;
            foreach (songsDetails song in songs)
            {
                if (clearList.Where(s =>s!=null&& song!=null&&s.id == song.id).FirstOrDefault() == null)
                {
                    clearList.Add(song);
                    bool b = clearList.Contains(song);
                }
            }
            if (clearList != null)
                return clearList;
            return null;
        }
        public static List<songsDetails> GetSongsByTags(List<songsDetails> songs, List<string> tags)
        {
            List<songsDetails> suitableSongs = new List<songsDetails>();
            if (songs == null || tags == null)
                return null;
            foreach (string tag in tags)
            {
                List<songsDetails> list = GetSongsByTag(songs, tag);
                if (list != null)
                    suitableSongs.AddRange(list);
            }
            suitableSongs = clearDuplicate(suitableSongs);
            return suitableSongs;
        }
        public static List<songsDetails> GetSongsByAllTags(List<string> tags)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsTBL> songsIncludeAllTags = new List<SongsTBL>();
            if (tags != null)
            {
                List<SongsTBL> songsList = et.SongsTBL.Where(s => s!=null&&s.isPerformance == false).ToList();
                if (songsList == null)
                    return null;
                foreach (SongsTBL song in songsList)
                {
                    List<TagsToSongsDTO> tagsToSong = TagsToSongsBL.GetTagsToSong(song.id);
                    if (tagsToSong == null)
                        return null;
                    bool isContain = true;
                    foreach (var tagName in tags)
                    {
                        TagsTBL currntTag = et.TagsTBL.Where(t =>t!=null&& t.name == tagName).FirstOrDefault();
                        int tagId = 0;
                        if (currntTag != null)
                        {
                            tagId = currntTag.id;
                        }
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
        public static List<songsDetails> GetSongsByAllTypes(List<TagsDTO>[] tags)
        {
            List<songsDetails> songs = new List<songsDetails>();
            songs.AddRange(GetSongsByTags(tags[0].Select(tag => tag.name).ToList()));
            for (int i = 1; tags[i] != null && tags[i].Count > 0; i++)
            {
                songs = GetSongsByTags(songs, tags[i].Select(tag => tag.name).ToList());
            }
            return songs;
        }
        public static List<songsDetails> GetPerformances()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsTBL> list = et.SongsTBL.Where(song => song != null && song.isPerformance == true).ToList();
            if (list != null)
                return Casts.ToSongsDTO.GetSongs(list);
            return null;
        }
        public static void AddSong(SongsTBL song, string singerName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                SingersTBL singer = et.SingersTBL.Where(s => s != null && s.name == singerName).FirstOrDefault();
                if (song == null || singer == null)
                    return;
                if (song.isPerformance == null)
                    song.isPerformance = false;
                song.date = DateTime.Now;
                song.singerId = singer.id;
                song.count_like = 0;
                song.count_views = 0;
                et.SongsTBL.Add(song);
                et.SaveChanges();
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
        }
        public static void DeleteSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsTBL song = et.SongsTBL.Where(s => s != null &&s.id == songId).FirstOrDefault();
            if (song != null)
            {
                et.SongsTBL.Remove(song);
                et.SaveChanges();
            }
        }
        public static void IncreaseLike(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsTBL song = et.SongsTBL.Where(s =>s!=null&& s.id == songId).FirstOrDefault();
            if (song != null)
            {
                if (song.count_like == null || song.count_like == 0)
                {
                    song.count_like = 1;
                    et.SaveChanges();
                }
                else
                {
                    song.count_like++;
                    et.SaveChanges();
                }
            }
        }
        public static void DecreaseLike(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsTBL song = et.SongsTBL.Where(s =>s!=null&& s.id == songId).FirstOrDefault();
            if (song != null)
            {
                if (song.count_like == null || song.count_like == 0)
                {
                    song.count_like = 0;
                    et.SaveChanges();
                }
                else
                {
                    song.count_like--;
                    et.SaveChanges();
                }
            }
        }
        public static List<songsDetails> clearVocalSongs(List<songsDetails> songs)
        {
            List<songsDetails> nonVocalSongs = new List<songsDetails>();
            foreach (songsDetails song in songs)
            {
                if (song != null)
                {
                    List<string> tags = TagsToSongsBL.GetTagsNamesToSong(song.id);
                    if (tags!=null&&!tags.Contains("ווקאלי") && !tags.Contains("אקפלה"))
                    {
                        nonVocalSongs.Add(song);
                    }
                }
            }
            if (nonVocalSongs != null)
                return nonVocalSongs;
            return null;
        }
        public static List<songsDetails> GetSimilarSongs(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsDTO> tags = Casts.ToTagsDTO.GetTagsFromTagsToSong(TagsToSongsBL.GetTagsToSong(songId));
            List<songsDetails> possibleSongs = new List<songsDetails>();
            List<songsDetails> songs = new List<songsDetails>();
            List<TagsDTO>[] hardTags = new List<TagsDTO>[necessity.Count];
            List<TagsDTO> flexibleTags = new List<TagsDTO>();
            int index = 0;
            foreach (Necessity nec in necessity)
            {
                TagsDTO tagType = new TagsDTO();
                List<TagsDTO> tagsType = new List<TagsDTO>();
                if (nec.level == eNecessityLevel.HARD)
                {
                    tagsType = TagsTypesBL.GetTagByType(tags, nec.tag);
                    if (tagType != null)
                    {
                        hardTags[index] = new List<TagsDTO>();
                        hardTags[index++].AddRange(tagsType);
                    }
                }
                else if (nec.level == eNecessityLevel.FLEXIBLE)
                {
                    tagType = TagsTypesBL.GetTagByType(tags, nec.tag).FirstOrDefault();
                    if (tagType != null) { flexibleTags.Add(tagType); }
                }
            }
            possibleSongs.AddRange(GetSongsByAllTypes(hardTags));
            if (tags.Where(tag => tag.name == "ווקאלי" || tag.name == "אקפלה").FirstOrDefault() == null)
            {
                possibleSongs = clearVocalSongs(possibleSongs);
            }
            songs.AddRange(OrderSongsByTags(possibleSongs, flexibleTags.Select(tag => tag.name).ToList()));
            bool isFound = songs.Remove(songs.Where(song => song.id == songId).FirstOrDefault());
            return songs;
        }
        public static List<songsDetails> GetSongsByArtist(string artistName)
        {

            MusicOnlineEntities et = new MusicOnlineEntities();
            int artistId = et.ArtistsTBL.Where(a => a!=null&& a.name == artistName).FirstOrDefault().id;
            List<ArtistsToSongsTBL> artistsToSongs = et.ArtistsToSongsTBL.Where(a =>a!=null&& a.artistId == artistId).ToList();
            if (artistsToSongs != null)
            {
                List<SongsTBL> songs = new List<SongsTBL>();
                foreach (ArtistsToSongsTBL item in artistsToSongs)
                {
                    SongsTBL sta = et.SongsTBL.Where(s =>s!=null&& s.id == item.songId).FirstOrDefault();
                    if (sta != null)
                    {
                        songs.Add(sta);
                    }
                }
                if (songs != null)
                    return Casts.ToSongsDTO.GetSongs(songs);

            }
            return null;
        }
        public static List<songsDetails> GetSongsByArtistsAndSingers(string name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<songsDetails> list = new List<songsDetails>();
            if (et.SingersTBL.Where(singer => singer!=null&& singer.name == name).FirstOrDefault() != null)
            {
                List<songsDetails> list1 = GetSongsBySinger(name);
                if (list1 != null)
                    list.AddRange(list1);
            }
            if (et.ArtistsTBL.Where(artist => artist!=null&& artist.name == name).FirstOrDefault() != null)
            {
                List<songsDetails> list1 = GetSongsByArtist(name);
                if (list1 != null)
                    list.AddRange(list1);
            }
            list = clearDuplicate(list);
            return list;
        }
        public static string ToJewishDateString(DateTime value, string format)
        {
            var ci = CultureInfo.CreateSpecificCulture("he-IL");
            ci.DateTimeFormat.Calendar = new HebrewCalendar();
            return value.ToString(format, ci);
        }
        public static List<songsDetails> GetSongsPublishedThisYear()
        {
            string year = ToJewishDateString(DateTime.Today, "D");
            if (year.Contains("תשרי") || year.Contains("חשון"))
            {
                year = ToJewishDateString(DateTime.Today.AddDays(-70), "D");
            }
            year= year.Substring(year.IndexOf('ת'));
            Console.WriteLine(year);
            List<songsDetails> songs = GetSongs();
            if (songs == null)
                return null;
            List<songsDetails> result = new List<songsDetails>();
            foreach (songsDetails item in songs)
            {
                if (item != null && item.date != null)
                {
                    if (ToJewishDateString(item.date.Value, "D").Contains(year))
                        result.Add(item);
                }
            }
            return result != null ? result : null;
        }
        public static void AddViewToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsTBL song = et.SongsTBL.Where(s => s != null && s.id == songId).FirstOrDefault();
            if (song == null)
                return;
            if (song.count_views == null)
                song.count_views = 1;
            else
                song.count_views++;
            song.lastViewingDate = DateTime.Now;
            et.SaveChanges();
        }
        public static void addSong(SongsTBL song,string singers,string artists,string tags)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            song.date = DateTime.Now;
            List<string> singersName=new List<string>();
            int len;
            do
            {
                if (singers.Contains(","))
                    len = singers.IndexOf(',');
                else len = singers.Length;
                singersName.Add(singers.Substring(0, len));
                singers = singers.Substring(len + 1, singers.Length - len - 1);
            } while (singers.Contains(","));
            SingersTBL singer =et.SingersTBL.Where(s=>s.name==singersName[0]).FirstOrDefault();
            if (singer == null)
                return;
            song.singerId = singer.id;
        }
    }
}
