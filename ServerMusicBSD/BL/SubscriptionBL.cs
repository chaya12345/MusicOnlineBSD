﻿using System;
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
        public static void AddSubscription(SubscriptionTBL subscription)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                et.SubscriptionTBL.Add(subscription);
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

        public static void DeleteSubscription(int subscriptionId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SubscriptionTBL subscription = et.SubscriptionTBL.Where(s => s.id == subscriptionId).FirstOrDefault();
            et.SubscriptionTBL.Remove(subscription);
            et.SaveChanges();
        }
        public static List<string> GetMailsOfSingerSubscription(int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SubscriptionTBL> list = et.SubscriptionTBL.Where(s => s.singerId == singerId).ToList();
            List<string> mails = new List<string>();
            foreach (SubscriptionTBL item in list)
            {
                UsersTBL user = et.UsersTBL.Where(u => u.id == item.userId).FirstOrDefault();
                if (user.mail != null)
                    mails.Add(user.mail);
            }
            return mails;
        }
        public static List<string> GetYourSingersNameSubscription(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SubscriptionTBL> list = et.SubscriptionTBL.Where(s => s.userId == userId).ToList();
            List<string> names = new List<string>();
            foreach (SubscriptionTBL item in list)
            {
                SingersTBL singer = et.SingersTBL.Where(s => s.id == item.singerId).FirstOrDefault();
                if (singer.name != null)
                    names.Add(singer.name);
            }
            return names;
        }
    }
}