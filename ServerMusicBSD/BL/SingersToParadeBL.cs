using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class SingersToParadeBL
    {
        public static void AddVotingToSinger(int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingersToParadeTBL Parade = et.SingersToParadeTBL.Where(singer => singer != null && singer.singerId == singerId).FirstOrDefault();
            if (Parade != null)
            {
                if (Parade.count == null)
                    Parade.count = 1;
                else Parade.count++;
                et.SaveChanges();
            }
        }
        public static void AddSingerToParade(SingersToParadeTBL singerToParade)
        {
            if (singerToParade != null)
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                singerToParade.count = 0;
                et.SingersToParadeTBL.Add(singerToParade);
                et.SaveChanges();
            }
        }
        public static void AddSingersToParade(List<SingersToParadeTBL> singersToParade)
        {
            if (singersToParade == null)
                return;
            foreach (SingersToParadeTBL singerToParade in singersToParade)
            {
                if (singerToParade != null)
                    AddSingerToParade(singerToParade);
            }
        }
        public static void DeleteSingerFromParade(int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersToParadeTBL> singerToParade = et.SingersToParadeTBL.Where(Parade => Parade.singerId == singerId).ToList();
            if (singerToParade != null)
            {
                et.SingersToParadeTBL.RemoveRange(singerToParade);
                et.SaveChanges();
            }
            
        }
        public static List<ItemsToParade_Result> GetSingersInParade()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ItemsToParade_Result> list = ParadeBL.GetItemsToParade();
            return list.Where(s => s.type == "singer").ToList();
        }
    }
}
