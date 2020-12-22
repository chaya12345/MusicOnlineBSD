using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class SingersToArticlesBL
    {
        public static List<string> GetSingersToArticle(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersToArticlesTBL> singers = et.SingersToArticlesTBL.Where(s => s.articleId == articleId).ToList();
            if (singers == null)
                return null;
            List<string> result = new List<string>();
            foreach (SingersToArticlesTBL item in singers)
            {
                SingersTBL singer = et.SingersTBL.Where(s => s.id == item.singerId).FirstOrDefault();
                if (singer != null)
                    result.Add(singer.name);
            }
            return result;
        }
        public static void AddSingersToArticle(string[] singers,int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            foreach (string item in singers)
            {
                SingersTBL singer = et.SingersTBL.Where(s => s != null && item != null && s.name == item).FirstOrDefault();
                if (singer != null)
                    AddSingerToArticle(new SingersToArticlesTBL() { articleId = articleId, singerId = singer.id });
            }
        }
        public static void AddSingerToArticle(SingersToArticlesTBL singerToArticle)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                if (singerToArticle != null)
                    et.SingersToArticlesTBL.Add(singerToArticle);
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
        public static void DeleteSingerFromArticle(int singerId,int? articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingersToArticlesTBL singersToArticles= et.SingersToArticlesTBL.Where(sta => sta.articleId == articleId && sta.singerId == singerId).FirstOrDefault();
            if (singersToArticles != null)
            {
                et.SingersToArticlesTBL.Remove(singersToArticles);
                et.SaveChanges();
            }
        }
        public static void DeleteSingerFronArticles(int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersToArticlesTBL> list = et.SingersToArticlesTBL.Where(sta => sta.singerId == singerId).ToList();
            if (list == null)
                return;
            foreach (SingersToArticlesTBL item in list)
            {
                if (item != null)
                    DeleteSingerFromArticle(singerId, item.articleId);
            }
        }
    }
}
