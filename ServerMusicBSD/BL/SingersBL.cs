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
        public static List<string> GetSingers()
        {
            return et.getSingers().ToList();
        }
        public static void AddSinger(string name)
        {
            et.addSinger(name);
            et.SaveChanges();
        }
    }
}
