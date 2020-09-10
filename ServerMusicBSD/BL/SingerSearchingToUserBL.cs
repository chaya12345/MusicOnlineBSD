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
        public static List<SingerSearchingToUserDTO> GetAllSingerSearching()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToSingerSearchingToUserDTO.GetSearchingsToUser(et.SingerSearchingToUserTBL.ToList());
        }
        public static List<SingerSearchingToUserDTO> GetSingerSearchingToUser(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToSingerSearchingToUserDTO.GetSearchingsToUser(et.SingerSearchingToUserTBL.Where(s => s.userId == userId).ToList());
        }
        private static void AddLineToTable(int userId,int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingerSearchingToUserTBL newLine = new SingerSearchingToUserTBL();
            newLine.userId = userId;
            newLine.singerId = singerId;
            newLine.count_searching = 1;
            newLine.last_date = DateTime.Today;
            et.SingerSearchingToUserTBL.Add(newLine);
            et.SaveChanges();
        }
        private static void UpdateLineInTable(int userId, int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingerSearchingToUserTBL updateLine= et.SingerSearchingToUserTBL.Where(s => s.userId == userId && s.singerId == singerId).FirstOrDefault();
            updateLine.count_searching++;
            updateLine.last_date = DateTime.Today;
            et.SaveChanges();
        }
        public static void AddSingerSearchingToUser(int userId,int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (et.SingerSearchingToUserTBL.Where(s => s.userId == userId && s.singerId == singerId).ToList() == null)
                AddLineToTable(userId, singerId);
            else
                UpdateLineInTable(userId, singerId);
        }
        public static SingerSearchingToUserDTO GetLastSearchingToUser(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingerSearchingToUserTBL lastSearching= et.SingerSearchingToUserTBL.Where(s => s.userId == userId).OrderByDescending(s => s.last_date).FirstOrDefault();
            return Casts.ToSingerSearchingToUserDTO.GetSearchingToUser(lastSearching);
        }
    }
}
