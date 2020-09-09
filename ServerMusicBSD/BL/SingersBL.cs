using System;
using System.Collections.Generic;
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
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static List<SingersDTO> GetSingers()
        {
            return Casts.ToSingersDTO.GetSingers(et.SingersTBL.ToList());
        }
        public static void AddSinger(SingersTBL name)
        {
            et.SingersTBL.Add(name);
            et.SaveChanges();
        }
    }
}
