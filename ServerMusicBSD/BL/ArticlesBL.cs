using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;
using System.Data.Entity.Validation;

namespace BL
{
    public class ArticlesBL
    {
        public static List<ArticlesDTO> GetArticles()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToArticlesDTO.GetArticles(et.ArticlesTBL.ToList());
        }
        public static ArticlesDTO GetArticleById(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToArticlesDTO.GetArticle(et.ArticlesTBL.Where(a => a.id == articleId).FirstOrDefault());
        }
        public static void AddArticle(ArticlesTBL article)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try { 
            et.ArticlesTBL.Add(article);
            et.SaveChanges();
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
        }
        public static void DeleteArticle(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ArticlesTBL article = et.ArticlesTBL.Where(a => a.id == articleId).FirstOrDefault();
            et.ArticlesTBL.Remove(article);
            et.SaveChanges();
        }
        public static List<ArticlesDTO> GetArticlesByTag(string tagName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ArticlesTBL> list = GetArticleInListByTag(et.ArticlesTBL.ToList(), tagName);
            if (list != null)
                return Casts.ToArticlesDTO.GetArticles(list);
            return null;

        }
        private static List<ArticlesTBL> GetArticleInListByTag(List<ArticlesTBL> articles, string tagName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            TagsTBL tag = et.TagsTBL.Where(t => t.name == tagName).FirstOrDefault();
            List<ArticlesTBL> result = new List<ArticlesTBL>();
            if (tag != null && articles != null)
            {
                List<TagsToArticlesTBL> tagToArticles = et.TagsToArticlesTBL.Where(t => t.tagId == tag.id).ToList();
                foreach (TagsToArticlesTBL artic in tagToArticles)
                {
                    ArticlesTBL articleIn = articles.Where(a => a.id == artic.articleId).FirstOrDefault();
                    if (articleIn != null)
                        result.Add(articleIn);
                }
                return result;
            }
            return null;
        }
        public static List<ArticlesDTO> GetArticlesByTags(List<string> tags)
        {
            List<ArticlesDTO> articles = new List<ArticlesDTO>();
            foreach (string tag in tags)
            {
                articles.AddRange(GetArticlesByTag(tag));
            }
            return articles;
        }
        public static List<ArticlesDTO> GetArticlesByAllTags(List<string> tags)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ArticlesTBL> articles = et.ArticlesTBL.ToList();
            List<ArticlesTBL> flag = et.ArticlesTBL.ToList();
            foreach (string tag in tags)
            {
                flag = GetArticleInListByTag(articles, tag);
                if (flag != null)
                    articles = flag;
                else
                    break;
            }
            if (flag != null)
                return Casts.ToArticlesDTO.GetArticles(articles);
            return null;
        }
        public static void InreaseLike(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ArticlesTBL article = et.ArticlesTBL.Where(a => a.id == articleId).FirstOrDefault();
            if (article != null)
            {
                if (article.count_like == null)
                {
                    article.count_like = 1;
                    et.SaveChanges();
                }
                else
                {
                    article.count_like++;
                    et.SaveChanges();
                }
                
            }
        }
        public static void DecreaseLike(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ArticlesTBL article = et.ArticlesTBL.Where(a => a.id == articleId).FirstOrDefault();
            if (article != null)
            {
                if (article.count_like == null)
                {
                    article.count_like = 0;
                    et.SaveChanges();
                }
                else
                {
                    article.count_like--;
                    et.SaveChanges();
                }
            }
        }
    }
}
