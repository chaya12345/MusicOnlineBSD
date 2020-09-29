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
    public class SearchingToSingerBL
    {
        public static List<SearchingToSingerDTO> GetAllSearching()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToSearchingToSingerDTO.GetsearchingToSingers(et.SearchingToSingerTBL.ToList());
        }
        public static long? GetCountOfSearchingToSinger(int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.SearchingToSingerTBL.Where(s => s.singerId == singerId).FirstOrDefault().count_searching;
        }
        public static void AddSearchingToSinger(int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try { 
                SearchingToSingerTBL newSinger = new SearchingToSingerTBL();
                newSinger.singerId = singerId;
                newSinger.count_searching = 1;
                et.SearchingToSingerTBL.Add(newSinger);
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
        public static void UpdateSearchingToSinger(int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SearchingToSingerTBL searchingToSinger = et.SearchingToSingerTBL.Where(s => s.singerId == singerId).FirstOrDefault();
            searchingToSinger.count_searching++;
            et.SaveChanges();
        }
        public static List<SingersDTO> GetPopularSingers()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SearchingToSingerTBL> searchingToSingers = et.SearchingToSingerTBL.OrderByDescending(s => s.count_searching).ToList();
            List<SingersTBL> popularSingers = new List<SingersTBL>();
            foreach (SearchingToSingerTBL sts in searchingToSingers)
            {
                if (sts.count_searching > 1000)
                {
                    SingersTBL singer = et.SingersTBL.Where(s => s.id == sts.singerId).FirstOrDefault();
                    popularSingers.Add(singer);
                }

            }
            if (popularSingers != null)
                return Casts.ToSingersDTO.GetSingers(popularSingers);
            return null;
        }
    }
}
