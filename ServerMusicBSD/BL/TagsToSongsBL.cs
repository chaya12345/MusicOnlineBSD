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
            foreach (TagsToSongsDTO tag in tagsToSong)
            {
                TagsTBL x = et.TagsTBL.Where(t => t.id == tag.tagId && t.isShow == true).FirstOrDefault();
                if(x!=null)
                tags.Add(x.name);
            }
            return tags;
        }
        public static List<string> GetTagsIncludeArtistsToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<string> tagsIncludeArtists = new List<string>();
            tagsIncludeArtists.AddRange(GetTagsNamesToSong(songId));
            tagsIncludeArtists.AddRange(ArtistsToSongsBL.GetArtistsNamesToSong(songId));
            return tagsIncludeArtists;
        }
        public static List<TagsToSongsDTO> GetTagsToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToTagsToSongsDTO.GetTagsToSongs(et.TagsToSongsTBL
                .Where(t => t.songId == songId).ToList());
        }
        public static void AddTagToSong(TagsToSongsTBL tagToSong)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try {
                et.TagsToSongsTBL.Add(tagToSong);
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
    }
}
