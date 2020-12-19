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
    public enum eInfo { SUBSCRIPTION = 1, FOLLOW_UP_SONGS, FOLLOW_UP_ARTICLES };
    public struct simple
    {
        public int id { get; set; }
        public string name { get; set; }
        public string image { get; set; }
    }
    public struct userInfo
    {
        public eInfo name { get; set; }
        public List<simple> list { get; set; }
    }
    public class UsersBL
    {
        private static List<UsersTBL> managers = new List<UsersTBL>() {
            new UsersTBL()
            {
                name = "הודיה עזרן",
                mail = "0504117455h@gmail.com",
                password = "LegGh5QwYGE77@!",
                newsletter = true,
            }
            , new UsersTBL() {
                name = "אודיה אושרי",
                mail = "bsd.odaya@gmail.com",
                password = "7d7vM6@vTPFcsBt",
                newsletter = true,
            }
        };
        public static List<UsersTBL> GetManagers()
        {
            return managers;
        }
        public static void SetManager(UsersTBL manager)
        {
            managers.Add(manager);
        }
        public static void AddUser(UsersTBL user)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                if (user != null)
                {
                    et.UsersTBL.Add(user);
                    et.SaveChanges();
                }
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
        public static bool signUp(UsersTBL user)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (et.UsersTBL.Where(usr => usr != null && usr.mail == user.mail).FirstOrDefault() == null/* && mail is valid... */)
            {
                if (user.newsletter == null)
                {
                    user.newsletter = false;
                }
                try
                {
                    et.UsersTBL.Add(user);
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
                }
            }
            return false;
        }
        public static bool AddToNewsletter(string mail)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (et.UsersTBL.Where(usr => usr != null && usr.mail == mail).FirstOrDefault() == null)
            {
                UsersTBL user = new UsersTBL();
                user.mail = mail;
                user.newsletter = true;
                AddUser(user);
                et.SaveChanges();
                return true;
            }
            else
            {
                UsersTBL currentUser = et.UsersTBL.Where(usr => usr != null && usr.mail == mail).FirstOrDefault();
                if (currentUser.newsletter == null || currentUser.newsletter == false)
                {
                    currentUser.newsletter = true;
                    et.SaveChanges();
                    return true;
                }
            }
            return false;
        }
        public static void RemoveFromNewsletter(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            UsersTBL user = et.UsersTBL.Where(u => u.id == userId).FirstOrDefault();
            if (user != null)
            {
                user.newsletter = false;
                et.SaveChanges();
            }
        }
        public static void UpdatePassword(int userId, string password)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            UsersTBL user = et.UsersTBL.Find(userId);
            if (userId == user.id)
            {
                if (password != null)
                {
                    user.password = password;
                    et.SaveChanges();
                }

            }
        }
        public static void UpdateProfil(int userId, UsersTBL updateUser)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            UsersTBL user = et.UsersTBL.Find(userId);
            if (user != null && userId == user.id)
            {
                if (updateUser.name != null)
                    user.name = updateUser.name;
                if (updateUser.mail != null)
                    user.mail = updateUser.mail;
                if (updateUser.password != null)
                    user.password = updateUser.password;
                if (updateUser.newsletter != null)
                    user.newsletter = updateUser.newsletter;
                if (updateUser.image != null)
                    user.image = updateUser.image;
                et.SaveChanges();
            }
        }
        public static List<UsersDTO> GetUsers()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<UsersTBL> list = et.UsersTBL.ToList();
            if (list != null)
                return Casts.ToUsersDTO.GetUsers(list);
            return null;
        }
        public static UsersDTO GetUser(string userName, string password)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<UsersTBL> users = et.UsersTBL.Where(u => u != null && u.password == password).ToList();
            foreach (UsersTBL user in users)
            {
                if (user != null && (user.name == userName || user.mail == userName))
                    return Casts.ToUsersDTO.GetUser(user);
            }
            return null;
        }
        public static List<songsDetails> GetFollowUpSongs(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<FollowUpTBL> list = et.FollowUpTBL.Where(f => f != null && f.userId == userId && f.articleId == null).ToList();
            if (list == null)
                return null;
            List<SongsTBL> result = new List<SongsTBL>();
            foreach (FollowUpTBL item in list)
            {
                SongsTBL song = et.SongsTBL.Where(s => s != null && s.id == item.songId).FirstOrDefault();
                if (song != null)
                    result.Add(song);
            }
            if (result != null)
                return Casts.ToSongsDTO.GetSongs(result);
            return null;
        }
        public static List<ArticlesDTO> GetFollowUpArticles(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<FollowUpTBL> list = et.FollowUpTBL.Where(f => f != null && f.userId == userId && f.songId == null).ToList();
            if (list == null)
                return null;
            List<ArticlesTBL> result = new List<ArticlesTBL>();
            foreach (FollowUpTBL item in list)
            {
                ArticlesTBL article = et.ArticlesTBL.Where(a => a != null && a.id == item.articleId).FirstOrDefault();
                if (article != null)
                    result.Add(article);
            }
            if (result != null)
                return Casts.ToArticlesDTO.GetArticles(result);
            return null;
        }
        public static List<SingersDTO> GetSubscriptionToSinger(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SubscriptionTBL> list = et.SubscriptionTBL.Where(s => s != null && s.userId == userId).ToList();
            if (list == null)
                return null;
            List<SingersTBL> result = new List<SingersTBL>();
            foreach (SubscriptionTBL item in list)
            {
                SingersTBL singer = et.SingersTBL.Where(s => s != null && s.id == item.singerId).FirstOrDefault();
                if (singer != null)
                    result.Add(singer);
            }
            if (result != null)
                return Casts.ToSingersDTO.GetSingers(result);
            return null;
        }
        public static List<userInfo> GetUserInfo(int? id)
        {
            if (id == null)
                return null;
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<userInfo> userInfo = new List<userInfo>();
            List<FollowUpTBL> follows_s = et.FollowUpTBL.Where(f => f != null && f.userId == id && f.songId != null).ToList();
            List<FollowUpTBL> follows_a = et.FollowUpTBL.Where(f => f != null && f.userId == id && f.articleId != null).ToList();
            List<SubscriptionTBL> subs = et.SubscriptionTBL.Where(sub => sub != null && sub.userId == id).ToList();
            userInfo info = new userInfo();
            info.name = eInfo.FOLLOW_UP_SONGS;
            List<simple> list = new List<simple>();
            foreach (FollowUpTBL follow in follows_s)
            {
                SongsTBL song = et.SongsTBL.Where(s => s != null && s.id == follow.songId).FirstOrDefault();
                if (song != null)
                {
                    list.Add(new simple { id = song.id, name = song.title, image = song.image_location });
                }
            }
            info.list = list;
            userInfo.Add(info);

            info.name = eInfo.FOLLOW_UP_ARTICLES;
            list = new List<simple>();
            foreach (FollowUpTBL follow in follows_a)
            {
                ArticlesTBL article = et.ArticlesTBL.Where(a => a != null && a.id == follow.articleId).FirstOrDefault();
                if (article != null)
                {
                    list.Add(new simple { id = article.id, name = article.title, image = article.image });
                }
            }
            info.list = list;
            userInfo.Add(info);

            info.name = eInfo.SUBSCRIPTION;
            list = new List<simple>();
            foreach (SubscriptionTBL sub in subs)
            {
                SingersTBL singer = et.SingersTBL.Where(s => s != null && s.id == sub.singerId).FirstOrDefault();
                if (singer != null)
                {
                    list.Add(new simple { id = singer.id, name = singer.name, image = singer.image });
                }
            }
            info.list = list;
            userInfo.Add(info);
            return userInfo;
        }
    }
}
