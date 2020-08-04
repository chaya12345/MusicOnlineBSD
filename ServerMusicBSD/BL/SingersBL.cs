using System;
using System.Collections.Generic;
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
            SingersTBL newSinger = new SingersTBL();
            newSinger.name = name;
            et.SingersTBL.Add(newSinger);
        }
    }
}
