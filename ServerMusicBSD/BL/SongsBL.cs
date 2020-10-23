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
        public static List<SongsDTO> GetSongs()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToSongsDTO.GetSongs(et.SongsTBL.Where(s => s.isPerformance == false).ToList());
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
            List<SongsDTO> result = Casts.ToSongsDTO.GetSongs(et.SongsTBL.Where(s => s.singerId == singerId.id && s.isPerformance == false).ToList());
            var songsByTag = GetSongsByTag(singerName);
            if (songsByTag != null)
            {
                result.AddRange(songsByTag);
            }
            return result;
        }
        public static List<SongsDTO> GetSongsByAlbum(string albumName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            long id = 0;
            AlbumsTBL currentAlbum = et.AlbumsTBL.Where(a => a.name == albumName).FirstOrDefault();
            if (currentAlbum != null)
            {
                id = currentAlbum.id;
            }
            return Casts.ToSongsDTO.GetSongs(et.SongsTBL.Where(a => a.albumId == id).ToList());
        }
        public static List<SongsDTO> GetSongsByTag(string tagName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            var tag = et.TagsTBL.Where(t => t.name == tagName).FirstOrDefault();
            if (tag != null)
            {
                int tagId = tag.id;
                List<int?> songsId = et.TagsToSongsTBL.Where(tagToSong => tagToSong.tagId == tagId)
                    .Select(t => t.songId).ToList();
                List<SongsTBL> songsIncludeTag = new List<SongsTBL>();
                foreach (int? songId in songsId)
                {
                    SongsTBL s = et.SongsTBL.Where(song => song.id == songId && song.isPerformance == false).FirstOrDefault();
                    if (s != null)
                        songsIncludeTag.Add(s);
                }
                return Casts.ToSongsDTO.GetSongs(songsIncludeTag);
            }
            return null;
        }
        public static List<SongsDTO> GetSongsByTag(List<SongsDTO> songs, string tagName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsDTO> suitableSongs = new List<SongsDTO>();
            TagsDTO tag = Casts.ToTagsDTO.GetTag(et.TagsTBL.Where(t => t.name == tagName).FirstOrDefault());
            foreach (SongsDTO song in songs)
            {
                List<TagsDTO> tags = Casts.ToTagsDTO.GetTagsFromTagsToSong(TagsToSongsBL.GetTagsToSong(song.id).ToList());
                if (tags.Where(t => t.id == tag.id).FirstOrDefault() != null) { suitableSongs.Add(song); }
            }
            return suitableSongs;
        }
        public static List<SongsDTO> GetSongsByTagId(int tagId)
        {
            return GetSongsByTag(TagsBL.GetName(tagId));
        }
        public static List<SongsDTO> GetSongsByTags(List<string> tags)
        {
            List<SongsDTO> suitableSongs = new List<SongsDTO>();
            foreach (string tag in tags)
            {
                suitableSongs.AddRange(GetSongsByTag(tag));
            }
            return suitableSongs;
        }
        public static List<SongsDTO> GetSongsByTagOrArtist(string name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsDTO> songs = new List<SongsDTO>();
            if (et.TagsTBL.Where(tag => tag.name == name).FirstOrDefault() != null)
            {
                songs.AddRange(GetSongsByTag(name));
            }
            if (et.ArtistsTBL.Where(artist => artist.name == name).FirstOrDefault() != null)
            {
                songs.AddRange(GetSongsByArtist(name));
            }
            if (et.SingersTBL.Where(singer => singer.name == name).FirstOrDefault() != null)
            {
                songs.AddRange(GetSongsBySinger(name));
            }
            songs = clearDuplicate(songs);
            return songs;
        }
        public static List<SongsDTO> OrderSongsByTags(List<SongsDTO> songs, List<string> tags)
        {
            List<SongsDTO> suitableSongs = new List<SongsDTO>();
            List<SongsDTO> nonSuitableSongs = new List<SongsDTO>();
            foreach (string tag in tags)
            {
                suitableSongs.AddRange(GetSongsByTag(songs, tag));
            }
            foreach (SongsDTO song in songs)
            {
                if (!suitableSongs.Contains(song)) { nonSuitableSongs.Add(song); }
            }
            List<SongsDTO> orderSongs = new List<SongsDTO>();
            orderSongs.AddRange(suitableSongs);
            orderSongs.AddRange(nonSuitableSongs);
            orderSongs = clearDuplicate(orderSongs);
            return orderSongs;
        }
        public static List<SongsDTO> clearDuplicate(List<SongsDTO> songs)
        {
            List<SongsDTO> clearList = new List<SongsDTO>();
            foreach (SongsDTO song in songs)
            {
                if (clearList.Where(s => s.id == song.id).FirstOrDefault() == null)
                {
                    clearList.Add(song);
                    bool b = clearList.Contains(song);
                }
            }
            return clearList;
        }
        public static List<SongsDTO> GetSongsByTags(List<SongsDTO> songs, List<string> tags)
        {
            List<SongsDTO> suitableSongs = new List<SongsDTO>();
            foreach (string tag in tags)
            {
                suitableSongs.AddRange(GetSongsByTag(songs, tag));
            }
            suitableSongs = clearDuplicate(suitableSongs);
            return suitableSongs;
        }
        public static List<SongsDTO> GetSongsByAllTags(List<string> tags)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsTBL> songsIncludeAllTags = new List<SongsTBL>();
            if (tags != null)
            {
                List<SongsTBL> songsList = et.SongsTBL.Where(s => s.isPerformance == false).ToList();
                foreach (SongsTBL song in songsList)
                {
                    List<TagsToSongsDTO> tagsToSong = TagsToSongsBL.GetTagsToSong(song.id);
                    bool isContain = true;
                    foreach (var tagName in tags)
                    {
                        TagsTBL currntTag = et.TagsTBL.Where(t => t.name == tagName).FirstOrDefault();
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
        public static List<SongsDTO> GetSongsByAllTypes(List<TagsDTO>[] tags)
        {
            List<SongsDTO> songs = new List<SongsDTO>();
            songs.AddRange(GetSongsByTags(tags[0].Select(tag => tag.name).ToList()));
            for (int i = 1; tags[i] != null && tags[i].Count > 0; i++)
            {
                songs = GetSongsByTags(songs, tags[i].Select(tag => tag.name).ToList());
            }
            return songs;
        }
        public static List<SongsDTO> GetPerformances()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToSongsDTO.GetSongs(et.SongsTBL.Where(song => song.isPerformance == true).ToList());
        }
        public static void AddSong(SongsTBL song)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                if (song.isPerformance == null)
                    song.isPerformance = false;
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
            SongsTBL song = et.SongsTBL.Where(s => s.id == songId).FirstOrDefault();
            et.SongsTBL.Remove(song);
            et.SaveChanges();
        }
        public static void IncreaseLike(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsTBL song = et.SongsTBL.Where(s => s.id == songId).FirstOrDefault();
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
            SongsTBL song = et.SongsTBL.Where(s => s.id == songId).FirstOrDefault();
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
        public static List<SongsDTO> clearVocalSongs(List<SongsDTO> songs)
        {
            List<SongsDTO> nonVocalSongs = new List<SongsDTO>();
            foreach (SongsDTO song in songs)
            {
                if (song != null)
                {
                    List<string> tags = TagsToSongsBL.GetTagsNamesToSong(song.id);
                    if (!tags.Contains("ווקאלי") && !tags.Contains("אקפלה"))
                    {
                        nonVocalSongs.Add(song);
                    }
                }
            }
            return nonVocalSongs;
        }
        public static List<songsDetails> GetSimilarSongs(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsDTO> tags = Casts.ToTagsDTO.GetTagsFromTagsToSong(TagsToSongsBL.GetTagsToSong(songId));
            List<SongsDTO> possibleSongs = new List<SongsDTO>();
            List<SongsDTO> songs = new List<SongsDTO>();
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
            return Casts.ToSongsDetailsDTO.GetSongsDetails(songs);
        }
        public static List<SongsDTO> GetSongsByArtist(string artistName)
        {

            MusicOnlineEntities et = new MusicOnlineEntities();
            int artistId = et.ArtistsTBL.Where(a => a.name == artistName).FirstOrDefault().id;
            List<ArtistsToSongsTBL> artistsToSongs = et.ArtistsToSongsTBL.Where(a => a.artistId == artistId).ToList();
            if (artistsToSongs != null)
            {
                List<SongsTBL> songs = new List<SongsTBL>();
                foreach (ArtistsToSongsTBL item in artistsToSongs)
                {
                    SongsTBL sta = et.SongsTBL.Where(s => s.id == item.songId).FirstOrDefault();
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
        public static List<SongsDTO> GetSongsByArtistsAndSingers(string name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsDTO> list = new List<SongsDTO>();
            if (et.SingersTBL.Where(singer => singer.name == name).FirstOrDefault() != null)
            {
                list.AddRange(GetSongsBySinger(name));
            }
            if (et.ArtistsTBL.Where(artist => artist.name == name).FirstOrDefault() != null)
            {
                list.AddRange(GetSongsByArtist(name));
            }
            list = clearDuplicate(list);
            return list;
        }
    }
}
