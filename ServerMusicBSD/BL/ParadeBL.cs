﻿using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BL
{
    public class ParadeBL
    {
        public static ParadeTBL GetActiveParade()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.ParadeTBL.Where(p => p != null && p.dateEnd == null).FirstOrDefault();
        }
        public static ParadeTBL GetParadeByYear(string year)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.ParadeTBL.Where(p => p != null && p.year == year).FirstOrDefault();
        }
        public static bool AddParade(ParadeTBL parade)
        {
            if (parade == null)
                return false;
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                et.ParadeTBL.Add(parade);
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
        public static void FinishedParade()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ParadeTBL parade = et.ParadeTBL.Where(p => p.dateEnd == null).FirstOrDefault();
            parade.dateEnd = DateTime.Now;
            et.SaveChanges();
        }
        public static List<ItemsToParade_Result> GetItemsToParade()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ParadeTBL parade = et.ParadeTBL.Where(p => p != null && p.dateEnd == null).FirstOrDefault();
            if (parade != null)
                return et.ItemsToParade(parade.id).ToList();
            return new List<ItemsToParade_Result>();
        }
    }
}
