using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;

namespace BL.Casts
{
    public class ToTagsToArticleDTO
    {
        public static TagsToAtriclesDTO GetTagsToArticle(TagsToArticlesTBL tagsToArticle)
        {
            if (tagsToArticle == null)
                return null;
            TagsToAtriclesDTO newTagsToArticle = new TagsToAtriclesDTO();
            newTagsToArticle.id = tagsToArticle.id;
            newTagsToArticle.articleId = tagsToArticle.articleId;
            newTagsToArticle.tagId = tagsToArticle.tagId;
            return newTagsToArticle;
        }
        public static List<TagsToAtriclesDTO> GetTagsToArticles(List<TagsToArticlesTBL> tagsToArticles)
        {
            if (tagsToArticles == null)
                return null;
            List<TagsToAtriclesDTO> newTagsToArticles = new List<TagsToAtriclesDTO>();
            foreach (TagsToArticlesTBL tagsToArticle in tagsToArticles)
            {
                TagsToAtriclesDTO tagsToAtricles = GetTagsToArticle(tagsToArticle);
                if (tagsToAtricles != null)
                    newTagsToArticles.Add(tagsToAtricles);
            }
            return newTagsToArticles;
        }
    }
}
