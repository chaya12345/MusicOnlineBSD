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
            return Casts.ToSingersDTO.GetSingers(et.SingersTBL.ToList());
        }
        public static SingersDTO GetSingerByName(string name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToSingersDTO.GetSinger(et.SingersTBL.Where(singer => singer.name == name).FirstOrDefault());
        }
        public static void AddSinger(SingersTBL name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try { 
                et.SingersTBL.Add(name);
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
    }
}
