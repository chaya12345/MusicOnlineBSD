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
        public static ArticlesDTO GetArticle(ArticlesTBL article)
        {
            ArticlesDTO newArticle = new ArticlesDTO();
            newArticle.id = article.id;
            newArticle.title = article.title;
            newArticle.files = article.files;
            newArticle.content = article.content;
            newArticle.date = article.date;
            newArticle.tagsId = article.tagsId;
            newArticle.subtitle = article.subtitle;
            newArticle.credit = article.credit;
            return newArticle;
        }
        public static List<ArticlesDTO> GetArticles(List<ArticlesTBL> articles)
        {
            List<ArticlesDTO> newArticles = new List<ArticlesDTO>();
            foreach (ArticlesTBL article in articles)
            {
                newArticles.Add(GetArticle(article));
            }
            return newArticles;
        }
    }
}
