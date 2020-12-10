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
            if (article == null)
                return null;
            ArticlesDTO newArticle = new ArticlesDTO();
            newArticle.id = article.id;
            newArticle.title = article.title;
            newArticle.subtitle = article.subtitle;
            newArticle.dateHebrew = article.dateHebrew;
            newArticle.date = article.date;
            newArticle.content = article.content;
            newArticle.image = article.image;
            newArticle.credit = article.credit;
            newArticle.count_views = article.count_views;
            newArticle.count_like = article.count_like;
            newArticle.lastViewingDate = article.lastViewingDate;
            return newArticle;
        }
        public static List<ArticlesDTO> GetArticles(List<ArticlesTBL> articles)
        {
            if (articles == null)
                return null;
            List<ArticlesDTO> newArticles = new List<ArticlesDTO>();
            foreach (ArticlesTBL article in articles)
            {
                newArticles.Add(GetArticle(article));
            }
            return newArticles;
        }
    }
}
