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
    public class SingerSearchingToUserBL
    {
        public static List<SingersDTO> GetSingerSearchingToUser(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingerSearchingToUserTBL> list = et.SingerSearchingToUserTBL.Where(s => s != null && s.userId == userId).ToList();
            if (list == null)
                return null;
            List<SingersTBL> singers = new List<SingersTBL>();
            foreach (SingerSearchingToUserTBL item in list)
            {
                SingersTBL singer= et.SingersTBL.Where(s => s.id == item.singerId).FirstOrDefault();
                if (singer != null)
                    singers.Add(singer);
            }
            if (singers != null)
                return Casts.ToSingersDTO.GetSingers(singers);
            return null;
        }
        private static void AddRecord(int userId, int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                SingerSearchingToUserTBL newLine = new SingerSearchingToUserTBL();
                newLine.userId = userId;
                newLine.singerId = singerId;
                newLine.count_searching = 1;
                newLine.last_date = DateTime.Now;
                et.SingerSearchingToUserTBL.Add(newLine);
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
        private static void UpdateRecord(int userId, int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingerSearchingToUserTBL updateLine = et.SingerSearchingToUserTBL.Where(s => s != null && s.userId == userId && s.singerId == singerId).FirstOrDefault();
            if (updateLine == null)
                return;
            updateLine.count_searching++;
            updateLine.last_date = DateTime.Now;
            et.SaveChanges();
        }
        public static void AddSingerSearchingToUser(int userId, int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (et.SingerSearchingToUserTBL.Where(s => s != null && s.userId == userId && s.singerId == singerId).ToList() == null)
                AddRecord(userId, singerId);
            else
                UpdateRecord(userId, singerId);
        }
    }
}
