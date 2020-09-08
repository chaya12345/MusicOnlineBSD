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
        //public static List<ArticlesDTO> GetArticlesByTag(string tagName)
        //{
        //    List<ArticlesTBL> list = GetArticleInListByTag(et.ArticlesTBL.ToList(), tagName);
        //    if (list != null)
        //        return Casts.ToArticlesDTO.GetArticles(list);
        //    return null;

        //}
        //private static List<ArticlesTBL> GetArticleInListByTag(List<ArticlesTBL> articles, string tagName)
        //{
            //TagsTBL tag = et.TagsTBL.Where(t => t.name == tagName).FirstOrDefault();
            //List<ArticlesTBL> result = new List<ArticlesTBL>();
            //if (tag != null && articles != null)
            //{
            //    List<TagsToSongsTBL> tagToArticles = et.TagsToSongsTBL.Where(t => t.tagId == tag.id).ToList();
            //    foreach (TagsToSongsTBL artic in tagToArticles)
            //    {
            //        ArticlesTBL articleIn = articles.Where(a => a.id == artic.articleId).FirstOrDefault();
            //        if (articleIn != null)
            //            result.Add(articleIn);
            //    }
            //    return result;
            //}
            //return null;
        //}
        //public static List<ArticlesDTO> GetArticlesByTags(List<string> tags)
        //{
        //    List<ArticlesDTO> articles = new List<ArticlesDTO>();
        //    foreach (string tag in tags)
        //    {
        //        articles.AddRange(GetArticlesByTag(tag));
        //    }
        //    return articles;
        //}
        //public static List<ArticlesDTO> GetArticlesByAllTags(List<string> tags)
        //{
        //    List<ArticlesTBL> articles = et.ArticlesTBL.ToList();
        //    List<ArticlesTBL> flag = et.ArticlesTBL.ToList();
        //    foreach (string tag in tags)
        //    {
        //        flag = GetArticleInListByTag(articles, tag);
        //        if (flag != null)
        //            articles = flag;
        //        else
        //            break;
        //    }
        //    if (flag != null)
        //        return Casts.ToArticlesDTO.GetArticles(articles);
        //    return null;
        //}

    }
}
