using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class SingerSearchingToUserBL
    {
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static List<SingerSearchingToUserDTO> GetAllSingerSearching()
        {
            return Casts.ToSingerSearchingToUserDTO.GetSearchingsToUser(et.SingerSearchingToUserTBLs.ToList());
        }
        public static List<SingerSearchingToUserDTO> GetSingerSearchingToUser(int userId)
        {
            return Casts.ToSingerSearchingToUserDTO.GetSearchingsToUser(et.SingerSearchingToUserTBLs.Where(s => s.userId == userId).ToList());
        }
        private static void AddLineToTable(int userId,int singerId)
        {
            SingerSearchingToUserTBL newLine = new SingerSearchingToUserTBL();
            newLine.userId = userId;
            newLine.singerId = singerId;
            newLine.count_searching = 1;
            newLine.last_date = DateTime.Today;
            et.SingerSearchingToUserTBLs.Add(newLine);
            et.SaveChanges();
        }
        private static void UpdateLineInTable(int userId, int singerId)
        {
            SingerSearchingToUserTBL updateLine= et.SingerSearchingToUserTBLs.Where(s => s.userId == userId && s.singerId == singerId).FirstOrDefault();
            updateLine.count_searching++;
            updateLine.last_date = DateTime.Today;
            et.SaveChanges();
        }
        public static void AddSingerSearchingToUser(int userId,int singerId)
        {
            if (et.SingerSearchingToUserTBLs.Where(s => s.userId == userId && s.singerId == singerId).ToList() == null)
                AddLineToTable(userId, singerId);
            else
                UpdateLineInTable(userId, singerId);
        }
    }
}
