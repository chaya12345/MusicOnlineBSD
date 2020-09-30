using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using DAL;
using DTO;

namespace BL
{
    public class ResponsesToArticlesBL
    {
        public static void AddResponse(ResponsesToArticlesTBL response)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try { 
                et.ResponsesToArticlesTBL.Add(response);
                ArticlesTBL article = et.ArticlesTBL.Where(a => a.id == response.articleId).FirstOrDefault();
                if (article.count_responses == null)
                    article.count_responses = 1;
                else article.count_responses++;
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
        public static List<ResponsesToArticlesDTO> GetArticleResponses(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToResponsesToArticlesDTO.GetResponses(et.ResponsesToArticlesTBL.Where(r => r.articleId == articleId).ToList());
        }
        public static int GetCountResponsesToArticle(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.ResponsesToArticlesTBL.Count(res => res.articleId == articleId);
        }
        public static void DeleteResponse(int responseId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ResponsesToArticlesTBL response = et.ResponsesToArticlesTBL.Where(r => r.id == responseId).FirstOrDefault();
            ArticlesTBL article = et.ArticlesTBL.Where(a => a.id == response.articleId).FirstOrDefault();
            if (article.count_responses == null || article.count_responses <= 0)
                article.count_responses = 0;
            else article.count_responses--;
            et.ResponsesToArticlesTBL.Remove(response);
            et.SaveChanges();
        }
        public static List<ResponsesToArticlesDTO> GetLastResponses()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ResponsesToArticlesTBL> list = et.ResponsesToArticlesTBL.Where(r => r.date != null).OrderBy(r=>r.date).Distinct().ToList();
            return Casts.ToResponsesToArticlesDTO.GetResponses(list);
        }
        public static List<LastResponsDTO> GetLast5Responses()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToLastResponsDTO.GetLastResponses(et.LastResponses.ToList());
        }
    }
}
