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
                TagsTBL x = et.TagsTBL.Where(t =>t!=null&& t.id == tag.tagId && t.isShow == true).FirstOrDefault();
                if(x!=null)
                tags.Add(x.name);
            }
            return tags!=null?tags:null;
        }
        public static List<string> GetTagsIncludeArtistsToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<string> tagsIncludeArtists = new List<string>();
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
    }
}
