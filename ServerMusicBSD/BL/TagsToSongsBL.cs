using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class TagsToSongsBL
    {
        public static List<string> GetTagsNamesToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsToSongsDTO> tagsToSong = GetTagsToSong(songId);
            List<string> tags = new List<string>();
            if (tagsToSong == null)
                return null;
            foreach (TagsToSongsDTO tag in tagsToSong)
            {
                TagsForSongsTBL x = et.TagsForSongsTBL.Where(t =>t!=null&& t.id == tag.tagId).FirstOrDefault();
                if(x!=null)
                tags.Add(x.name);
            }
            return tags!=null?tags:null;
        }
        public static List<string> GetTagsIncludeArtistsToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<string> tagsIncludeArtists = new List<string>();
            List<string> singers = SingersToSongsBL.GetSingersToSong(songId);
            if (singers != null)
                tagsIncludeArtists.AddRange(singers);
            List<string> list = GetTagsNamesToSong(songId);
            if (list != null)
                tagsIncludeArtists.AddRange(list);
            List<string> list1 = ArtistsToSongsBL.GetArtistsNamesToSong(songId);
            if(list1!=null)
            tagsIncludeArtists.AddRange(list1);
            return tagsIncludeArtists!=null?tagsIncludeArtists:null;
        }
        public static List<TagsToSongsDTO> GetTagsToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsToSongsTBL> list = et.TagsToSongsTBL.Where(t => t != null && t.songId == songId).ToList();
            if (list != null)
                return Casts.ToTagsToSongsDTO.GetTagsToSongs(list);
            return null;
        }
        public static void AddTagToSong(TagsToSongsTBL tagToSong)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try {
                if (tagToSong != null)
                {
                    et.TagsToSongsTBL.Add(tagToSong);
                    et.SaveChanges();
                }
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
        public static void AddTagsToSong(string[] tags, int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (tags != null)
            {
                foreach (string tag in tags)
                {
                    TagsForSongsTBL currentTag = et.TagsForSongsTBL.Where(t => t != null && t.name == tag).FirstOrDefault();
                    if (currentTag != null)
                    {
                        AddTagToSong(new TagsToSongsTBL { songId = songId, tagId = currentTag.id });
                    }
                }
            }
        }
        public static void UpdateTagsToSong(int songId, List<TagsForSongsTBL> tags)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsToSongsTBL> existTags = et.TagsToSongsTBL
                .Where(tts => tts != null && tts.songId == songId).ToList();
            List<TagsForSongsTBL> existAndSelected = new List<TagsForSongsTBL>();
            if (existTags != null)
            {
                foreach (TagsToSongsTBL item in existTags)
                {
                    TagsForSongsTBL so = tags.Where(tag => tag != null && tag.id == item.tagId).FirstOrDefault();
                    if (so == null)
                    {
                        DeleteTagFromSong(songId, item.tagId);
                    }
                    else
                    {
                        existAndSelected.Add(so);
                    }
                }
            }
            foreach (TagsForSongsTBL tts in tags)
            {
                if (tts != null && existAndSelected.Where(t => t.id == tts.id).FirstOrDefault() == null)
                {
                    AddTagToSong(new TagsToSongsTBL() {  tagId= tts.id, songId = songId });
                }
            }
        }
        public static void DeleteTagFromSong(int? tagId, int? songId)
        {
            if (tagId != null && songId != null)
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                TagsToSongsTBL result = et.TagsToSongsTBL
                    .Where(tts => tts.tagId == tagId && tts.songId == songId).FirstOrDefault();
                if (result != null)
                {
                    et.TagsToSongsTBL.Remove(result);
                    et.SaveChanges();
                }
            }
        }
    }
}
