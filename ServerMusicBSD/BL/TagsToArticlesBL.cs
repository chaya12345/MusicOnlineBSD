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
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static List<string> GetTagsNamesToArticle(int articleId)
        {
            List<TagsToAtriclesDTO> tagsToArticle = GetTagsToArticle(articleId);
            List<string> tags = new List<string>();
            foreach (TagsToAtriclesDTO tag in tagsToArticle)
            {
                tags.Add(et.TagsTBLs.Where(t => t.id == tag.tagId).FirstOrDefault().name);
            }
            return tags;
        }

        public static List<TagsToAtriclesDTO> GetTagsToArticle(int articleId)
        {
            return Casts.ToTagsToArticleDTO.GetTagsToArticles(et.TagsToArticlesTBLs.Where(t => t.articleId == articleId).ToList());
        }
        public static void AddTagToArticle(TagsToArticlesTBL tagsToArticle)
        {
            et.TagsToArticlesTBLs.Add(tagsToArticle);
            et.SaveChanges();
        }
    }
}
