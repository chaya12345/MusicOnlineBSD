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
    }
}
