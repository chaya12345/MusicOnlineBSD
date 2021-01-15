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
        public static bool AddSingerToParade(SingersToParadeTBL singerToParade)
        {
            try
            {
                if (singerToParade != null)
                {
                    MusicOnlineEntities et = new MusicOnlineEntities();
                    singerToParade.count = 0;
                    et.SingersToParadeTBL.Add(singerToParade);
                    et.SaveChanges();
                    return true;
                }
                return false;
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
            return false;
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
        public static bool AddSingersToParade(string[] singersToParade,int paradeId)
        {
            if (singersToParade.Length == 0)
                return false;
            bool flag = true;
            MusicOnlineEntities et = new MusicOnlineEntities();
            foreach(string singer in singersToParade)
            {
                if (singer != null)
                {
                    SingersTBL singerTBL = et.SingersTBL.Where(s => s.name == singer).FirstOrDefault();
                    if (singerTBL != null)
                        if (AddSingerToParade(new SingersToParadeTBL() { singerId = singerTBL.id, paradeId = paradeId, count = 0 }) == false)
                            flag = false;
                }
            }
            return flag;
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
