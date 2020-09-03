﻿using System;
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
    }
}
