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
        public static List<SingersDTO> GetSingersInParade()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersToParadeTBL> list = et.SingersToParadeTBL.ToList();
            List<SingersDTO> singers = SingersBL.GetSingers();
            List<SingersDTO> result = new List<SingersDTO>();
            if (list == null || singers == null)
                return null;
            foreach (SingersToParadeTBL item in list)
            {
                SingersDTO relevantsinger = singers.Where(s => s != null && s.id == item.singerId).FirstOrDefault();
                if (relevantsinger != null)
                    result.Add(relevantsinger);
            }
            return result != null ? result : null;
        }
        public static void AddVotingToSinger(int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingersToParadeTBL Parade = et.SingersToParadeTBL.Where(s => s != null && s.singerId == singerId).FirstOrDefault();
            if (Parade != null)
            {
                if (Parade.count == null)
                    Parade.count = 1;
                else Parade.count++;
                et.SaveChanges();
            }
        }
        public static void AddSingerToParade(SingersToParadeTBL Parade)
        {
            if (Parade != null)
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                et.SingersToParadeTBL.Add(Parade);
                et.SaveChanges();
            }
        }
        public static void AddSingersToParade(List<SingersToParadeTBL> Parades)
        {
            if (Parades == null)
                return;
            foreach (SingersToParadeTBL item in Parades)
            {
                if (item != null)
                    AddSingerToParade(item);
            }
        }
        public static void DeleteSingerFromParade(int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingersToParadeTBL singerToParade = et.SingersToParadeTBL.Where(Parade => Parade.singerId == singerId).FirstOrDefault();
            et.SingersToParadeTBL.Remove(singerToParade);
            et.SaveChanges();
        }
    }
}
