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
    public class TagsToArticlesBL
    {
        public static List<string> GetTagsNamesToArticle(int articleId, bool? all)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsToAtriclesDTO> tagsToArticle = GetTagsToArticle(articleId);
            List<string> tags = new List<string>();
            List<string> singers = SingersToArticlesBL.GetSingersToArticle(articleId);
            if (singers.Count>0)
                tags.AddRange(singers);
            if (tagsToArticle.Count>0)
                foreach (TagsToAtriclesDTO tag in tagsToArticle)
                {
                    TagsForArticlesTBL currentTag = et.TagsForArticlesTBL.Where(t => t != null && t.id == tag.tagId && all == true).FirstOrDefault();
                    if (currentTag != null)
                    {
                        tags.Add(currentTag.name);
                    }
                }

            return tags == null ? null : tags;
        }
        public static List<TagsToAtriclesDTO> GetTagsToArticle(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsToArticlesTBL> list = et.TagsToArticlesTBL.Where(t => t.articleId == articleId).ToList();
            if (list != null)
                return Casts.ToTagsToArticleDTO.GetTagsToArticles(list);
            return null;
        }
        public static bool AddTagToArticle(TagsToArticlesTBL tagsToArticle)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                if (tagsToArticle != null)
                {
                    et.TagsToArticlesTBL.Add(tagsToArticle);
                    et.SaveChanges();
                    return true;
                }
                return false;
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
            return false;
        }
        public static bool AddTagToArticle(string[] tags,int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            bool flag = true;
            foreach (string item in tags)
            {
                TagsForArticlesTBL tag = et.TagsForArticlesTBL.Where(t => t != null && item != null && t.name == item).FirstOrDefault();
                if (tag != null)
                   if( AddTagToArticle(new TagsToArticlesTBL() { tagId = tag.id, articleId = articleId })==false)
                      flag=false;
            }
            return flag;
        }
        public static void DeleteTagFromArticles(int tagId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsToArticlesTBL> list = et.TagsToArticlesTBL.Where(tta => tta.tagId == tagId).ToList();
            if (list != null)
            {
                et.TagsToArticlesTBL.RemoveRange(list);
                et.SaveChanges();
            }
        }
        public static void DeleteTagFromArticle(int? articleId, int? tagId)
        {
            if (articleId != null && tagId != null)
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                TagsToArticlesTBL result = et.TagsToArticlesTBL
                    .Where(tta => tta.tagId == tagId && tta.articleId == articleId).FirstOrDefault();
                if (result != null)
                {
                    et.TagsToArticlesTBL.Remove(result);
                    et.SaveChanges();
                }
            }
        }
        public static void DeleteTagsOfArticle(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsToArticlesTBL> tags = et.TagsToArticlesTBL
                .Where(tts => tts != null && tts.articleId == articleId).ToList();
            if (tags != null)
            {
                et.TagsToArticlesTBL.RemoveRange(tags);
                et.SaveChanges();
            }
        }
        public static void UpdateTagsToArticle(int articleId, List<TagsForArticlesTBL> tags)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsToArticlesTBL> existTags = et.TagsToArticlesTBL
                .Where(tta => tta != null && tta.articleId == articleId).ToList();
            List<TagsForArticlesTBL> existAndSelected = new List<TagsForArticlesTBL>();
            if (existTags != null)
            {
                foreach (TagsToArticlesTBL item in existTags)
                {
                    TagsForArticlesTBL so = tags.Where(tag => tag != null && tag.id == item.tagId).FirstOrDefault();
                    if (so == null)
                    {
                        DeleteTagFromArticle(articleId, item.tagId);
                    }
                    else
                    {
                        existAndSelected.Add(so);
                    }
                }
            }
            foreach (TagsForArticlesTBL tta in tags)
            {
                if (tta != null && existAndSelected.Where(t => t.id == tta.id).FirstOrDefault() == null)
                {
                    AddTagToArticle(new TagsToArticlesTBL() { tagId = tta.id, articleId = articleId });
                }
            }
        }
    }
}
