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
        public static List<SingerSearchingToUserDTO> GetAllSingerSearching()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingerSearchingToUserTBL> list = et.SingerSearchingToUserTBL.ToList();
            if (list != null)
                return Casts.ToSingerSearchingToUserDTO.GetSearchingsToUser(list);
            return null;
        }
        public static List<SingerSearchingToUserDTO> GetSingerSearchingToUser(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingerSearchingToUserTBL> list = et.SingerSearchingToUserTBL.Where(s =>s!=null&& s.userId == userId).ToList();
            if (list != null)
                return Casts.ToSingerSearchingToUserDTO.GetSearchingsToUser(list);
            return null;
        }
        private static void AddRecord(int userId,int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try { 
                SingerSearchingToUserTBL newLine = new SingerSearchingToUserTBL();
                newLine.userId = userId;
                newLine.singerId = singerId;
                newLine.count_searching = 1;
                newLine.last_date = DateTime.Today;
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
            SingerSearchingToUserTBL updateLine= et.SingerSearchingToUserTBL.Where(s =>s!=null&& s.userId == userId && s.singerId == singerId).FirstOrDefault();
            if (updateLine == null)
                return;
            updateLine.count_searching++;
            updateLine.last_date = DateTime.Today;
            et.SaveChanges();
        }
        public static void AddSingerSearchingToUser(int userId,int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (et.SingerSearchingToUserTBL.Where(s =>s!=null&& s.userId == userId && s.singerId == singerId).ToList() == null)
                AddRecord(userId, singerId);
            else
                UpdateRecord(userId, singerId);
        }
        public static SingerSearchingToUserDTO GetLastSearchingToUser(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingerSearchingToUserTBL lastSearching= et.SingerSearchingToUserTBL.Where(s =>s!=null&& s.userId == userId).OrderByDescending(s => s.last_date).FirstOrDefault();
            if (lastSearching != null)
                return Casts.ToSingerSearchingToUserDTO.GetSearchingToUser(lastSearching);
            return null;
        }
    }
}
