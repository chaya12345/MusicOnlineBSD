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
    public class SubscriptionBL
    {
        public static bool AddSubscription(SubscriptionTBL subscription)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                if (subscription != null && et.SubscriptionTBL
                    .Where(sub => sub.userId == subscription.userId &&
                    sub.singerId == subscription.singerId).FirstOrDefault() == null)
                {
                    et.SubscriptionTBL.Add(subscription);
                    et.SaveChanges();
                    return true;
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
            return false;
        }

        public static bool DeleteSubscription(int userId, int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SubscriptionTBL subscription = et.SubscriptionTBL
                .Where(s => s != null && s.userId == userId && s.singerId == singerId).FirstOrDefault();
            if (subscription == null)
                return false;
            et.SubscriptionTBL.Remove(subscription);
            et.SaveChanges();
            return true;
        }
        public static List<string> GetMailsOfSingerSubscription(int? singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SubscriptionTBL> list = et.SubscriptionTBL.Where(s => s != null && s.singerId == singerId).ToList();
            List<string> mails = new List<string>();
            if (list == null)
                return null;
            foreach (SubscriptionTBL item in list)
            {
                UsersTBL user = et.UsersTBL.Where(u => u != null && u.id == item.userId).FirstOrDefault();
                if (user != null && user.mail != null)
                    mails.Add(user.mail);
            }
            if (mails != null)
                return mails;
            return null;
        }
        public static List<string> GetMailsOfSingerSubscriptionToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersToSongsTBL> stsList = et.SingersToSongsTBL.Where(sts => sts != null && sts.songId == songId).ToList();
            if (stsList == null)
                return new List<string>();
            List<string> mailAddresses = new List<string>();
            foreach(SingersToSongsTBL sts in stsList)
            {
                mailAddresses.AddRange(GetMailsOfSingerSubscription(sts.singerId));
            }
            return mailAddresses;
        }
        public static List<string> GetYourSingersNameSubscription(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SubscriptionTBL> list = et.SubscriptionTBL.Where(s => s != null && s.userId == userId).ToList();
            List<string> names = new List<string>();
            foreach (SubscriptionTBL item in list)
            {
                SingersTBL singer = et.SingersTBL.Where(s => s != null && s.id == item.singerId).FirstOrDefault();
                if (singer.name != null)
                    names.Add(singer.name);
            }
            if (names != null)
                return names;
            return null;
        }
    }
}
