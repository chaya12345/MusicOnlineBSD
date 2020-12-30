using System;
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
            return et.ParadeTBL.Where(p => p != null && p.isActive == true).FirstOrDefault();
        }
        public static ParadeTBL GetParadeByYear(string year)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.ParadeTBL.Where(p => p != null && p.year == year).FirstOrDefault();
        }
        public static bool AddParade(ParadeTBL parade)
        {
            if (parade == null || GetActiveParade() != null)
                return false;
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                parade.dateStart = DateTime.Now;
                parade.isActive = true;
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
            ParadeTBL parade = GetActiveParade();
            parade.dateEnd = DateTime.Now;
            parade.isActive = false;
            et.SaveChanges();
        }
        public static List<ItemsToParade_Result> GetItemsToParade()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ParadeTBL parade = GetActiveParade();
            if (parade != null)
                return et.ItemsToParade(parade.id).ToList();
            return new List<ItemsToParade_Result>();
        }
    }
}
