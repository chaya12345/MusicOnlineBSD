using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class SingersBL
    {
        public static List<SingersDTO> GetSingers()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersTBL> list = et.SingersTBL.ToList();
            if (list != null)
                return Casts.ToSingersDTO.GetSingers(list);
            return null;
        }
        public static SingersDTO GetSingerByName(string name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingersTBL singer1 = et.SingersTBL.Where(singer => singer != null && singer.name == name).FirstOrDefault();
            if (singer1 != null)
                return Casts.ToSingersDTO.GetSinger(singer1);
            return null;
        }
        public static void AddSinger(SingersTBL name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try {
                if (name != null)
                {
                    et.SingersTBL.Add(name);
                    et.SaveChanges();
                }
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
        public static void AddSinger(string name, string image)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                if (name != null)
                {
                    if (image == null)
                    {
                        image = "";
                    }
                    SingersTBL singer = new SingersTBL();
                    singer.name = name;
                    singer.image = image;
                    et.SingersTBL.Add(singer);
                    et.SaveChanges();
                }
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
        public static void AddSearchingToSinger(string singerName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingersTBL singer= et.SingersTBL.Where(s => s.name == singerName).FirstOrDefault();
            if (singer == null)
                return;
            if (singer.searchings == null)
                singer.searchings = 1;
            else singer.searchings++;
            et.SaveChanges();
        }
        public static bool UpdateSinger(SingersTBL updatedSinger)
        {
            if (updatedSinger == null)
                return false;
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingersTBL currentSinger = et.SingersTBL
                .Where(singer => singer != null && singer.id == updatedSinger.id).FirstOrDefault();
            if (currentSinger != null)
            {
                currentSinger.name = updatedSinger.name;
                currentSinger.image = updatedSinger.image;
                et.SaveChanges();
                return true;
            }
            return false;
        }
        public static void DeleteSinger(int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingersTBL singer = et.SingersTBL.Where(s => s.id == singerId).FirstOrDefault();
            if (singer == null)
                return;
            SingersToSongsBL.DeleteSingerFromSongs(singerId);
            SingersToArticlesBL.DeleteSingerFronArticles(singerId);
            SingersToParadeBL.DeleteSingerFromParade(singerId);
            et.SingersTBL.Remove(singer);
            et.SaveChanges();
        }
    }
}
