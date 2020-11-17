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
    public class FollowUpBL
    {
        public static bool AddFollowUp(FollowUpTBL followUp)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (followUp != null && (followUp.userId != null || followUp.mail != null) &&
                (followUp.songId != null || followUp.articleId != null) && !isCheck(followUp))
            {
                try
                {
                    et.FollowUpTBL.Add(followUp);
                    et.SaveChanges();
                    return true;
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
            return false;
        }

        private static bool isCheck(FollowUpTBL followUp)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (et.FollowUpTBL.Where(f => ((f.mail != null && f.mail == followUp.mail) ||
            (f.userId != null && f.userId == followUp.userId)) && ((f.songId != null && f.songId == followUp.songId) ||
            (f.articleId != null && f.articleId == followUp.articleId))).FirstOrDefault() != null)
                return true;
            return false;
        }

        public static void DeleteFollowUp(int userId,int id,string type)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (type == "article")
            {
                FollowUpTBL followUp = et.FollowUpTBL.Where(f =>f!=null&& f.userId == userId && f.articleId == id).FirstOrDefault();
                if (followUp != null)
                {
                    et.FollowUpTBL.Remove(followUp);
                    et.SaveChanges();
                }
            }
            if (type == "song")
            {
                FollowUpTBL followUp = et.FollowUpTBL.Where(f =>f!=null&& f.userId == userId && f.songId == id).FirstOrDefault();
                if (followUp != null)
                {
                    et.FollowUpTBL.Remove(followUp);
                    et.SaveChanges();
                }
            }
        }
        public static List<string> GetSongsNameYouFollowUp(int? userId, string mail)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<string> songsName = new List<string>();
            if (userId != null)
            {
                UsersTBL user = et.UsersTBL.Where(u =>u!=null&& u.id == userId).FirstOrDefault();
                List<FollowUpTBL> list = et.FollowUpTBL.Where(f =>f!=null&&user!=null&& f.userId == user.id && f.songId != null).ToList();
                if (list == null)
                    return null;
                foreach (FollowUpTBL item in list)
                {
                    SongsTBL song = et.SongsTBL.Where(s =>s!=null&&item!=null&& s.id == item.songId).FirstOrDefault();
                    if (song.name != null)
                        songsName.Add(song.name);
                }
            }
            else
            {
                if (mail == "")
                    return null;
                List<FollowUpTBL> list = et.FollowUpTBL.Where(f =>f!=null&& f.mail == mail && f.songId != null).ToList();
                if (list == null)
                    return null;
                foreach (FollowUpTBL item in list)
                {
                    SongsTBL song = et.SongsTBL.Where(s =>s!=null&&item!=null&& s.id == item.songId).FirstOrDefault();
                    if (song.name != null)
                        songsName.Add(song.name);
                }
            }
            if (songsName != null)
                return songsName;
            return null;
        }
        public static List<string> GetArticlesNameYouFollowUp(int? userId, string mail)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<string> articlesName = new List<string>();
            if (userId != null)
            {
                UsersTBL user = et.UsersTBL.Where(u =>u!=null&& u.id == userId).FirstOrDefault();
                if (user == null)
                    return null;
                List<FollowUpTBL> list = et.FollowUpTBL.Where(f =>f!=null&& f.userId == user.id && f.articleId != null).ToList();
                if (list == null)
                    return null;
                foreach (FollowUpTBL item in list)
                {
                    ArticlesTBL article = et.ArticlesTBL.Where(a =>a!=null&&item!=null&& a.id == item.articleId).FirstOrDefault();
                    if (article.title != null)
                        articlesName.Add(article.title);
                }
            }
            else
            {
                if (mail == "")
                    return null;
                List<FollowUpTBL> list = et.FollowUpTBL.Where(f =>f!=null&& f.mail == mail && f.articleId != null).ToList();
                if (list == null)
                    return null;
                foreach (FollowUpTBL item in list)
                {
                    ArticlesTBL song = et.ArticlesTBL.Where(s =>s!=null&&item!=null&& s.id == item.id).FirstOrDefault();
                    if (song.title != null)
                        articlesName.Add(song.title);
                }
            }
            if (articlesName != null)
                return articlesName;
            return null;
        }
        public static List<string> GetMailsOfSongFollowUp(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<string> mails = new List<string>();
            List<FollowUpTBL> list = et.FollowUpTBL.Where(f =>f!=null&& f.songId == songId).ToList();
            if (list == null)
                return null;
            foreach (FollowUpTBL item in list)
            {
                if (item.userId != null)
                {
                    UsersTBL user = et.UsersTBL.Where(u =>u!=null&& u.id == item.userId).FirstOrDefault();
                    if (user.mail != null)
                        mails.Add(user.mail);
                }
                else if (item.mail != null)
                    mails.Add(item.mail);
            }
            if (mails != null)
                return mails;
            return null;
        }
        public static List<string> GetMailsOfArticleFollowUp(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<string> mails = new List<string>();
            List<FollowUpTBL> list = et.FollowUpTBL.Where(f =>f!=null&& f.songId == articleId).ToList();
            if (list == null)
                return null;
            foreach (FollowUpTBL item in list)
            {
                if (item.userId != null)
                {
                    UsersTBL user = et.UsersTBL.Where(u =>u!=null&& u.id == item.userId).FirstOrDefault();
                    if (user.mail != null)
                        mails.Add(user.mail);
                }
                else if (item.mail != null)
                    mails.Add(item.mail);
            }
            if (mails != null)
                return mails;
            return null;
        }
        public static Boolean IsUserFollowUpSong(int userId, int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (et.FollowUpTBL.Where(f =>f!=null&& f.userId == userId && f.songId == songId).FirstOrDefault() != null)
                return true;
            return false;
        }
        public static Boolean IsUserFollowUpArticle(int userId, int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (et.FollowUpTBL.Where(f =>f!=null&& f.userId == userId && f.articleId == articleId).FirstOrDefault() != null)
                return true;
            return false;
        }
    }
}
