using System;
using System.Collections.Generic;
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
                tags.Add(et.TagsTBL.Where(t => t.id == tag.tagId).FirstOrDefault().name);
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
            et.TagsToArticlesTBL.Add(tagsToArticle);
            et.SaveChanges();
        }
    }
}
