using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;
using System.Data.Entity.Validation;
using System.Globalization;

namespace BL
{
    public class ArticlesBL
    {
        public static List<ArticlesDTO> GetArticles()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ArticlesTBL> list = et.ArticlesTBL.ToList();
            if (list != null)
                return Casts.ToArticlesDTO.GetArticles(list);
            return null;
        }
        public static ArticlesDTO GetArticleById(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ArticlesTBL article = et.ArticlesTBL.Where(a => a != null && a.id == articleId).FirstOrDefault();
            if (article != null)
                return Casts.ToArticlesDTO.GetArticle(article);
            return null;
        }
        public static bool AddArticle(ArticlesTBL article)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                if (article != null)
                {
                    article.date = DateTime.Now;
                    article.dateHebrew = ToJewishDateString(DateTime.Now, "D");
                    article.count_views = 0;
                    article.count_like = 0;
                    et.ArticlesTBL.Add(article);
                    et.SaveChanges();
                    return true;
                }
                return false;

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
                return false;
            }
        }
        public static void UpdateArticle(ArticlesTBL article, string[] singers, string[] tags)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (article == null)
                return;
            ArticlesTBL newArticle = et.ArticlesTBL.Where(a => a.id == article.id).FirstOrDefault();
            newArticle.title = article.title;
            newArticle.subtitle = article.subtitle;
            newArticle.image = article.image;
            newArticle.content = article.content;
            et.SaveChanges();

            List<SingersTBL> singersList = new List<SingersTBL>();
            foreach (string item in singers)
            {
                SingersTBL singerTBL = et.SingersTBL.Where(s => s.name == item).FirstOrDefault();
                if (singerTBL != null)
                    singersList.Add(singerTBL);
            }
            SingersToArticlesBL.UpdateSingersToArticle(article.id, singersList);

            List<TagsForArticlesTBL> tagsList = new List<TagsForArticlesTBL>();
            foreach (string item in tags)
            {
                TagsForArticlesTBL tagTBL = et.TagsForArticlesTBL.Where(t => t.name == item).FirstOrDefault();
                if (tagTBL != null)
                    tagsList.Add(tagTBL);
            }
            TagsToArticlesBL.UpdateTagsToArticle(article.id, tagsList);
        }
        public static string ToJewishDateString(DateTime value, string format)
        {
            var ci = CultureInfo.CreateSpecificCulture("he-IL");
            ci.DateTimeFormat.Calendar = new HebrewCalendar();
            return value.ToString(format, ci);
        }
        public static bool DeleteArticle(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ArticlesTBL article = et.ArticlesTBL.Where(a => a != null && a.id == articleId).FirstOrDefault();
            if (article != null)
            {
                SingersToArticlesBL.DeleteSingersOfArticle(article.id);
                TagsToArticlesBL.DeleteTagsOfArticle(article.id);
                et.ArticlesTBL.Remove(article);
                et.SaveChanges();
                return true;
            }
            return false;
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
            TagsForArticlesTBL tag = et.TagsForArticlesTBL.Where(t => t != null && t.name == tagName).FirstOrDefault();
            List<ArticlesTBL> result = new List<ArticlesTBL>();
            if (tag != null && articles != null)
            {
                List<TagsToArticlesTBL> tagToArticles = et.TagsToArticlesTBL.Where(t => t != null && t.tagId == tag.id).ToList();
                foreach (TagsToArticlesTBL artic in tagToArticles)
                {
                    ArticlesTBL articleIn = articles.Where(a => a != null && artic != null && a.id == artic.articleId).FirstOrDefault();
                    if (articleIn != null)
                        result.Add(articleIn);
                }
                if (result != null)
                    return result;
            }
            return null;
        }
        public static List<ArticlesDTO> GetArticlesByTags(List<string> tags)
        {
            if (tags == null)
                return null;
            List<ArticlesDTO> articles = new List<ArticlesDTO>();
            foreach (string tag in tags)
            {
                List<ArticlesDTO> list = GetArticlesByTag(tag);
                if (list != null)
                    articles.AddRange(list);
            }
            if (articles != null)
                return articles;
            return null;
        }
        public static List<ArticlesDTO> GetArticlesByAllTags(List<string> tags)
        {
            if (tags == null)
                return null;
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
            ArticlesTBL article = et.ArticlesTBL.Where(a => a != null && a.id == articleId).FirstOrDefault();
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
            ArticlesTBL article = et.ArticlesTBL.Where(a => a != null && a.id == articleId).FirstOrDefault();
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
        public static void AddViewToArticle(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ArticlesTBL article = et.ArticlesTBL.Where(a => a != null && a.id == articleId).FirstOrDefault();
            if (article == null)
                return;
            if (article.count_views == null)
                article.count_views = 1;
            else
                article.count_views++;
            article.lastViewingDate = DateTime.Now;
            et.SaveChanges();
        }
        public static ArticlesDTO GetArticleByTitle(string title)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToArticlesDTO.GetArticle(et.ArticlesTBL.Where(a => a != null && a.title == title).FirstOrDefault());
        }
    }
}
