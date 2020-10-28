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
            if (tagsToArticle == null)
                return null;
            foreach (TagsToAtriclesDTO tag in tagsToArticle)
            {
                TagsTBL currentTag = et.TagsTBL.Where(t =>t!=null&& t.id == tag.tagId && (t.isShow == true || all == true)).FirstOrDefault();
                if (currentTag != null)
                {
                    tags.Add(currentTag.name);
                }
            }
            return tags==null?null:tags;
        }
        public static List<TagsToAtriclesDTO> GetTagsToArticle(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsToArticlesTBL> list = et.TagsToArticlesTBL.Where(t => t.articleId == articleId).ToList();
            if (list != null)
                return Casts.ToTagsToArticleDTO.GetTagsToArticles(list);
            return null;
        }
        public static void AddTagToArticle(TagsToArticlesTBL tagsToArticle)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try 
            {
                if (tagsToArticle != null)
                {
                    et.TagsToArticlesTBL.Add(tagsToArticle);
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
