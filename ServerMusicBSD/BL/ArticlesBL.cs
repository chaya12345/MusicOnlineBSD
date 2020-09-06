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
            return Casts.ToArticlesDTO.GetArticles(et.ArticlesTBL.ToList());
        }
        public static ArticlesDTO GetArticleById(int articleId)
        {
            return Casts.ToArticlesDTO.GetArticle(et.ArticlesTBL.Where(a => a.id == articleId).FirstOrDefault());
        }
        public static void AddArticle(ArticlesTBL article)
        {
            et.ArticlesTBL.Add(article);
            et.SaveChanges();
        }
        public static void DeleteArticle(int articleId)
        {
            ArticlesTBL article = et.ArticlesTBL.Where(a => a.id == articleId).FirstOrDefault();
            et.ArticlesTBL.Remove(article);
            et.SaveChanges();
        }
        //public static void AddTagToAtricle(int articleId, int tagNameId)
        
        //public static List<ArticlesDTO> GetArticlesByTag(string tagName)
        
        //public static List<ArticlesDTO> GetArticlesByTags(List<string> tags)
       
        //public static List<ArticlesDTO> GetArticlesByAllTags(List<string> tags)
       
    }
}
