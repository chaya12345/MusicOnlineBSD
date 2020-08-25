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
            ArticlesBTL article = et.ArticlesBTL.Where(a => a.id == articleId).FirstOrDefault();
            et.ArticlesBTL.Remove(article);
            et.SaveChanges();
        }
        public static void AddTagToAtricle(int articleId, int tagNameId)
        {
            ArticlesBTL arti = et.ArticlesTBL.Where(a => a.id == articleId).FirstOrDefault();
            TagsTBL tags = et.TagsTBL.Where(t => t.id == arti.tagsId).FirstOrDefault();
            if (tags.tag1 == null)
            {
                tags.tag1 = tagNameId;
                return;
            }
            if (tags.tag2 == null)
            {
                tags.tag2 = tagNameId;
                return;
            }
            if (tags.tag3 == null)
            {
                tags.tag3 = tagNameId;
                return;
            }
            if (tags.tag4 == null)
            {
                tags.tag4 = tagNameId;
                return;
            }
            if (tags.tag5 == null)
            {
                tags.tag5 = tagNameId;
                return;
            }
            if (tags.tag6 == null)
            {
                tags.tag6 = tagNameId;
                return;
            }
            if (tags.tag7 == null)
            {
                tags.tag7 = tagNameId;
                return;
            }
            if (tags.tag8 == null)
            {
                tags.tag8 = tagNameId;
                return;
            }
            if (tags.tag9 == null)
            {
                tags.tag9 = tagNameId;
                return;
            }
            if (tags.tag10 == null)
            {
                tags.tag10 = tagNameId;
                return;
            }
            if (tags.tag11 == null)
            {
                tags.tag11 = tagNameId;
                return;
            }
            if (tags.tag12 == null)
            {
                tags.tag12 = tagNameId;
                return;
            }
            if (tags.tag13 == null)
            {
                tags.tag13 = tagNameId;
                return;
            }
            if (tags.tag14 == null)
            {
                tags.tag14 = tagNameId;
                return;
            }
            if (tags.tag15 == null)
            {
                tags.tag15 = tagNameId;
                return;
            }
            if (tags.tag16 == null)
            {
                tags.tag16 = tagNameId;
                return;
            }
            if (tags.tag17 == null)
            {
                tags.tag17 = tagNameId;
                return;
            }
            if (tags.tag18 == null)
            {
                tags.tag18 = tagNameId;
                return;
            }
            if (tags.tag19 == null)
            {
                tags.tag19 = tagNameId;
                return;
            }
            if (tags.tag20 == null)
            {
                tags.tag20 = tagNameId;
                return;
            }
        }
        public static List<ArticlesDTO> GetArticlesByTag(string tagName)
        {
            int tagId = et.TagNameTBL.Where(t => t.name == tagName).FirstOrDefault().id;
            List<ArticlesDTO> AllArticles = GetArticles();
            List<ArticlesDTO> result = new List<ArticlesDTO>();
            foreach (ArticlesDTO article in AllArticles)
            {
                if (IsArticleContainTag(article.tagsId, tagId))
                {
                    result.Add(article);
                }
            }
            return result;
        }
        public static bool IsArticleContainTag(Nullable<int> tagsId, int Tag)
        {
            TagsTBL tags = et.TagsTBL.Where(t => t.id == tagsId).FirstOrDefault();
            if (tags.tag1 != null && tags.tag1 == Tag)
                return true;
            if (tags.tag2 != null && tags.tag2 == Tag)
                return true;
            if (tags.tag3 != null && tags.tag3 == Tag)
                return true;
            if (tags.tag4 != null && tags.tag4 == Tag)
                return true;
            if (tags.tag5 != null && tags.tag5 == Tag)
                return true;
            if (tags.tag6 != null && tags.tag6 == Tag)
                return true;
            if (tags.tag7 != null && tags.tag7 == Tag)
                return true;
            if (tags.tag8 != null && tags.tag8 == Tag)
                return true;
            if (tags.tag9 != null && tags.tag9 == Tag)
                return true;
            if (tags.tag10 != null && tags.tag10 == Tag)
                return true;
            if (tags.tag11 != null && tags.tag11 == Tag)
                return true;
            if (tags.tag12 != null && tags.tag12 == Tag)
                return true;
            if (tags.tag13 != null && tags.tag13 == Tag)
                return true;
            if (tags.tag14 != null && tags.tag14 == Tag)
                return true;
            if (tags.tag15 != null && tags.tag15 == Tag)
                return true;
            if (tags.tag16 != null && tags.tag16 == Tag)
                return true;
            if (tags.tag17 != null && tags.tag17 == Tag)
                return true;
            if (tags.tag18 != null && tags.tag18 == Tag)
                return true;
            if (tags.tag19 != null && tags.tag19 == Tag)
                return true;
            if (tags.tag20 != null && tags.tag20 == Tag)
                return true;
            return false;
        }
        public static List<ArticlesDTO> GetArticlesByTags(List<string> tags)
        {
            List<ArticlesDTO> Articles = new List<ArticlesDTO>();
            foreach (string tag in tags)
            {
                Articles.AddRange(GetArticlesByTag(tag));
            }
            return Articles;
        }
        public static List<ArticlesDTO> GetArticlesByAllTags(List<string> tags)
        {
            int mutchTag = 0;
            List<ArticlesDTO> allArticles = GetArticles();
            List<ArticlesDTO> result = new List<ArticlesDTO>();
            foreach (ArticlesDTO song in allArticles)
            {
                //בדיקה עבור כל שיר אם הוא מכיל את כל התגיות
                foreach (string t in tags)
                {
                    int tag = et.TagNameTBL.Where(a => a.name == t).FirstOrDefault();
                    if (IsArticleContainTag(song.tagsId, tag))
                        mutchTag++;
                }
                if (mutchTag == tags.Count())
                    result.Add(song);
            }
            return result;
        }
    }
}
