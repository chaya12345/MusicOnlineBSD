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
        public static List<string> GetTagsNamesToArticle(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsToAtriclesDTO> tagsToArticle = GetTagsToArticle(articleId);
            List<string> tags = new List<string>();
            foreach (TagsToAtriclesDTO tag in tagsToArticle)
            {
                try
                {
                    tags.Add(et.TagsTBL.Where(t => t.id == tag.tagId && t.isShow == true).FirstOrDefault().name);
                } catch { }
            }
            return tags;
        }

        public static List<TagsToAtriclesDTO> GetTagsToArticle(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToTagsToArticleDTO.GetTagsToArticles(et.TagsToArticlesTBL.Where(t => t.articleId == articleId).ToList());
        }
        public static void AddTagToArticle(TagsToArticlesTBL tagsToArticle)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try { 
            et.TagsToArticlesTBL.Add(tagsToArticle);
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
