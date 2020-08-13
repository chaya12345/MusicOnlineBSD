using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToArticlesDTO
    {
        public static ArticlesDTO GetArticle(ArticlesBTL article)
        {
            ArticlesDTO newArticle = new ArticlesDTO();
            newArticle.id = article.id;
            newArticle.title = article.title;
            newArticle.files = article.files;
            newArticle.content = article.content;
            newArticle.date = article.date;
            newArticle.tagsId = article.tagsId;
            return newArticle;
        }
        public static List<ArticlesDTO> GetArticles(List<ArticlesBTL> articles)
        {
            List<ArticlesDTO> newArticles = new List<ArticlesDTO>();
            foreach (ArticlesBTL article in articles)
            {
                newArticles.Add(GetArticle(article));
            }
            return newArticles;
        }
    }
}
