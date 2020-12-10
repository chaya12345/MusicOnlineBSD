using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class SingersToSongsBL
    {
        public static List<string> GetSingersToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersToSongsTBL> list = et.SingersToSongsTBL.Where(s => s.songId == songId).ToList();
            if (list == null)
                return null;
            List<string> result = new List<string>();
            foreach(SingersToSongsTBL item in list)
            {
                SingersTBL singer = et.SingersTBL.Where(s => s.id == item.singerId).FirstOrDefault();
                if (singer != null)
                    result.Add(singer.name);
            }
            return result;
        }
    }
}
