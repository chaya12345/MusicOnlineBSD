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
        public static List<SingersDTO> GetSingers()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToSingersDTO.GetSingers(et.SingersTBL.ToList());
        }
        public static void AddSinger(SingersTBL name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            et.SingersTBL.Add(name);
            et.SaveChanges();
        }
    }
}
