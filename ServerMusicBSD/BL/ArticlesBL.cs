using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;

namespace BL
{
    public class ArticlesBL
    {
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static List<ArticlesDTO> GetArticles()
        {
            return Casts.ToArticlesDTO.GetArticles(et.ArticlesBTL.ToList());
        }
        public static ArticlesDTO GetArticleById(int articleId)
        {
            return Casts.ToArticlesDTO.GetArticle(et.ArticlesBTL.Where(a => a.id == articleId).FirstOrDefault());
        }
        public static void AddArticle(ArticlesBTL article)
        {
            et.ArticlesBTL.Add(article);
            et.SaveChanges();
        }
        public static void DeleteArticle(int articleId)
        {
            if (articleId != null)
            {
                ArticlesBTL article = et.ArticlesBTL.Where(a => a.id == articleId).FirstOrDefault();
                et.ArticlesBTL.Remove(article);
                et.SaveChanges();
            }
        }
    }
}
