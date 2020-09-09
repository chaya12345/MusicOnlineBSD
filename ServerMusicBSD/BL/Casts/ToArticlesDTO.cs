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
            newArticle.subtitle = article.subtitle;
            newArticle.dateHebrew = article.dateHebrew;
            newArticle.date = article.date;
            newArticle.content = article.content;
            newArticle.main_image = article.main_image;
            newArticle.image1 = article.image1;
            newArticle.image2 = article.image2;
            newArticle.image3 = article.image3;
            newArticle.audio1 = article.audio1;
            newArticle.audio2 = article.audio2;
            newArticle.video = article.video;
            newArticle.credit = article.credit;
            newArticle.count_views = article.count_views;
            newArticle.count_like = article.count_like;
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
