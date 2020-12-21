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
    public class TagsBL
    {
        public static List<TagsForSongsDTO> GetTagsForSongs()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsForSongsTBL> list = et.TagsForSongsTBL.ToList();
            if (list != null)
                return Casts.ToTagsDTO.GetTagsForSongs(list);
            return null;
        }
        public static List<TagsForSongsDTO> GetTagsForSongs(List<TagsToSongsDTO> tagsToSongs)
        {
            return Casts.ToTagsDTO.GetTagsForSongs(tagsToSongs);
        }
        public static void AddTagForSong(TagsForSongsTBL tag)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try {
                if (tag != null)
                {
                    et.TagsForSongsTBL.Add(tag);
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
        public static string GetTagNameForSong(int id)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            string name = "";
            var currentTag = et.TagsForSongsTBL.Where(tag =>tag!=null&& tag.id == id).FirstOrDefault();
            if (currentTag != null)
            {
                name = currentTag.name;
            }
            if (name != null)
                return name;
            return null;
        }
        public static void UpdateTagForSong(TagsForSongsTBL tag)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            TagsForSongsTBL tagsForSong = et.TagsForSongsTBL.Where(t => t.id == tag.id).FirstOrDefault();
            if (tagsForSong != null)
            {
                tagsForSong.name = tag.name;
                tagsForSong.typeId = tag.typeId;
                et.SaveChanges();
            }

        }
        //------------------------------------------------------------------------
        //------------------------------------------------------------------------
        //------------------------------------------------------------------------
        public static List<TagsForArticlesDTO> GetTagsForArticles()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsForArticlesTBL> list = et.TagsForArticlesTBL.ToList();
            if (list != null)
                return Casts.ToTagsDTO.GetTagsForArticles(list);
            return null;
        }
        public static void AddTagForArticle(TagsForArticlesTBL tag)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                if (tag != null)
                {
                    et.TagsForArticlesTBL.Add(tag);
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
        public static string GetTagNameForArticle(int id)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            string name = "";
            var currentTag = et.TagsForArticlesTBL.Where(tag => tag != null && tag.id == id).FirstOrDefault();
            if (currentTag != null)
            {
                name = currentTag.name;
            }
            if (name != null)
                return name;
            return null;
        }
        public static List<TagsForArticlesDTO> GetTagsForArticles(List<TagsToAtriclesDTO> tagsToAtricles)
        {
            return Casts.ToTagsDTO.GetTagsForArticles(tagsToAtricles);
        }
        public static void UpdateTagForArticle(TagsForArticlesTBL tag)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            TagsForArticlesTBL tagsForArticle = et.TagsForArticlesTBL.Where(t => t.id == tag.id).FirstOrDefault();
            if (tagsForArticle != null)
            {
                tagsForArticle.name = tag.name;
                et.SaveChanges();
            }

        }
    }
}
