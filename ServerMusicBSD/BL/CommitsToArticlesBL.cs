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
    public class CommitsToArticlesBL
    {
        public static void AddResponse(CommitsToArticlesTBL commit)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (commit == null)
                return;
            if (commit.content == "")
            {
                commit.content = null;
                commit.tested = false;
            }
            try { 
                et.CommitsToArticlesTBL.Add(commit);
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
        public static List<CommitsToArticlesDTO> GetArticleCommits(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<CommitsToArticlesTBL> list = et.CommitsToArticlesTBL.Where(r =>r!=null&& r.articleId == articleId).ToList();
            if(list!=null)
            return Casts.ToCommitsToArticlesDTO.GetCommits(list);
            return null;
        }
        public static int GetCountCommitsToArticle(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.CommitsToArticlesTBL.Count(res => res!=null&& res.articleId == articleId);
        }
        public static bool DeleteResponse(int responseId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            CommitsToArticlesTBL response = et.CommitsToArticlesTBL.Where(r => r != null && r.id == responseId).FirstOrDefault();
            if (response != null)
            {
                et.CommitsToArticlesTBL.Remove(response);
                et.SaveChanges();
                return true;
            }
            else return false;
        }
        public static List<CommitsToArticlesDTO> GetLastCommits()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<CommitsToArticlesTBL> list = et.CommitsToArticlesTBL.Where(r =>r!=null&& r.date != null).OrderBy(r=>r.date).Distinct().ToList();
            if (list != null)
                return Casts.ToCommitsToArticlesDTO.GetCommits(list);
            return null;
        }
        public static bool UpdateIsTested(int commitId,bool isTested)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            CommitsToArticlesTBL commit = et.CommitsToArticlesTBL.Where(c => c != null && c.id == commitId).FirstOrDefault();
            if (commit != null)
            {
                commit.tested = isTested;
                et.SaveChanges();
                return true;
            }
            return false;
        }
    }
}
