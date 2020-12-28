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
            List<SingersDTO> result = new List<SingersDTO>();
            ParadeTBL parade = ParadeBL.GetActiveParade();
            if (parade != null)
            {
                List<SingersToParadeTBL> list = et.SingersToParadeTBL
                    .Where(singer => singer != null && singer.paradeId == parade.id).ToList();
                List<SingersDTO> singers = SingersBL.GetSingers();
                if (list == null || singers == null)
                    return null;
                foreach (SingersToParadeTBL item in list)
                {
                    SingersDTO rellevantsinger = singers.Where(s => s != null && s.id == item.singerId).FirstOrDefault();
                    if (rellevantsinger != null)
                        result.Add(rellevantsinger);
                }
            }
            return result;
        }
        public static List<SingersToParadeDTO> GetSingersToParade()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToSingersToParadeDTO.GetSTPs(et.SingersToParadeTBL.ToList());
        }
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
            List<SingersToParadeTBL> singerToParade = et.SingersToParadeTBL.Where(Parade => Parade.singerId == singerId).ToList();
            if (singerToParade != null)
            {
                et.SingersToParadeTBL.RemoveRange(singerToParade);
                et.SaveChanges();
            }
            
        }
    }
}
