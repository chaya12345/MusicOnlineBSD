using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class FollowUpBL
    {
        public static void AddFollowUp(FollowUpTBL followUp)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if ((followUp.userId == null && followUp.mail == null))
                return;
            if (followUp.songId == null && followUp.articleId == null)
                return;
            et.FollowUpTBL.Add(followUp);
            et.SaveChanges();
        }
        public static void DeleteFollowUp(int followUpId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            FollowUpTBL followUp = et.FollowUpTBL.Where(f => f.id == followUpId).FirstOrDefault();
            et.FollowUpTBL.Remove(followUp);
            et.SaveChanges();
        }
        public static List<string> GetSongsNameYouFollowUp(int? userId, string mail)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<string> songsName = new List<string>();
            if (userId != null)
            {
                UsersTBL user = et.UsersTBL.Where(u => u.id == userId).FirstOrDefault();
                List<FollowUpTBL> list = et.FollowUpTBL.Where(f => f.userId == user.id && f.songId != null).ToList();
                foreach (FollowUpTBL item in list)
                {
                    SongsTBL song = et.SongsTBL.Where(s => s.id == item.songId).FirstOrDefault();
                    songsName.Add(song.name);
;               }
            }
            else
            {
                if (mail == "")
                    return null;
                List<FollowUpTBL> list = et.FollowUpTBL.Where(f => f.mail == mail && f.songId != null).ToList();
                foreach (FollowUpTBL item in list)
                {
                    SongsTBL song = et.SongsTBL.Where(s => s.id == item.songId).FirstOrDefault();
                    songsName.Add(song.name);
                }
            }
            return songsName;
        }
        public static List<string> GetArticlesNameYouFollowUp(int? userId, string mail)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<string> articlesName = new List<string>();
            if (userId != null)
            {
                UsersTBL user = et.UsersTBL.Where(u => u.id == userId).FirstOrDefault();
                List<FollowUpTBL> list = et.FollowUpTBL.Where(f => f.userId == user.id && f.articleId != null).ToList();
                foreach (FollowUpTBL item in list)
                {
                    ArticlesTBL article = et.ArticlesTBL.Where(a => a.id == item.articleId).FirstOrDefault();
                    articlesName.Add(article.title);
                }
            }
            else
            {
                if (mail == "")
                    return null;
                List<FollowUpTBL> list = et.FollowUpTBL.Where(f => f.mail == mail && f.articleId != null).ToList();
                foreach (FollowUpTBL item in list)
                {
                    ArticlesTBL song = et.ArticlesTBL.Where(s => s.id == item.id).FirstOrDefault();
                    articlesName.Add(song.title);
                }
            }
            return articlesName;
        }
        public static List<string> GetMailsOfSongFollowUp(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<string> mails = new List<string>();
            List<FollowUpTBL> list = et.FollowUpTBL.Where(f => f.songId == songId).ToList();
            foreach (FollowUpTBL item in list)
            {
                if (item.userId != null)
                {
                    UsersTBL user = et.UsersTBL.Where(u => u.id == item.userId).FirstOrDefault();
                    mails.Add(user.mail);
                }
                else if (item.mail != null)
                    mails.Add(item.mail);
            }
            return mails;
        }
        public static List<string> GetMailsOfArticleFollowUp(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<string> mails = new List<string>();
            List<FollowUpTBL> list = et.FollowUpTBL.Where(f => f.songId == articleId).ToList();
            foreach (FollowUpTBL item in list)
            {
                if (item.userId != null)
                {
                    UsersTBL user = et.UsersTBL.Where(u => u.id == item.userId).FirstOrDefault();
                    mails.Add(user.mail);
                }
                else if (item.mail != null)
                    mails.Add(item.mail);
            }
            return mails;
        }
    }
}
