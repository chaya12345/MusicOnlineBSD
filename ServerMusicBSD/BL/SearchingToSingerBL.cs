using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class SearchingToSingerBL
    {
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static List<SearchingToSingerDTO> GetAllSearching()
        {
            return Casts.ToSearchingToSingerDTO.GetsearchingToSingers(et.SearchingToSingerTBL.ToList());
        }
        public static long? GetCountOfSearchingToSinger(int singerId)
        {
            return et.SearchingToSingerTBL.Where(s => s.singerId == singerId).FirstOrDefault().count_searching;
        }
        public static void AddSearchingToSinger(int singerId)
        {
            SearchingToSingerTBL newSinger = new SearchingToSingerTBL();
            newSinger.singerId = singerId;
            newSinger.count_searching = 1;
            et.SearchingToSingerTBL.Add(newSinger);
            et.SaveChanges();
        }
        public static void UpdateSearchingToSinger(int singerId)
        {
            SearchingToSingerTBL searchingToSinger = et.SearchingToSingerTBL.Where(s => s.singerId == singerId).FirstOrDefault();
            searchingToSinger.count_searching++;
            et.SaveChanges();
        }
        public static List<SingersDTO> GetPopularSingers()
        {
            List<SearchingToSingerTBL> searchingToSingers = et.SearchingToSingerTBL.OrderByDescending(s => s.count_searching).ToList();
            List<SingersTBL> popularSingers = new List<SingersTBL>();
            foreach (SearchingToSingerTBL sts in searchingToSingers)
            {
                SingersTBL singer = et.SingersTBL.Where(s => s.id == sts.singerId).FirstOrDefault();
                popularSingers.Add(singer);
            }
            return Casts.ToSingersDTO.GetSingers(popularSingers);
        }
    }
}
