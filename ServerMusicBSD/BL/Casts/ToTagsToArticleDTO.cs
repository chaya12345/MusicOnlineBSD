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
            TagsToAtriclesDTO newTagsToArticle = new TagsToAtriclesDTO();
            newTagsToArticle.id = tagsToArticle.id;
            newTagsToArticle.articleId = tagsToArticle.articleId;
            newTagsToArticle.tagId = tagsToArticle.tagId;
            return newTagsToArticle;
        }
        public static List<TagsToAtriclesDTO> GetTagsToArticles(List<TagsToArticlesTBL> tagsToArticles)
        {
            List<TagsToAtriclesDTO> newTagsToArticles = new List<TagsToAtriclesDTO>();
            foreach (TagsToArticlesTBL tagsToArticle in tagsToArticles)
            {
                newTagsToArticles.Add(GetTagsToArticle(tagsToArticle));
            }
            return newTagsToArticles;
        }
    }
}
