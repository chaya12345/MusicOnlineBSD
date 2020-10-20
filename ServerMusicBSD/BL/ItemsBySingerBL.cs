using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class ItemsBySingerBL
    {
        public static List<ItemsBySingerDTO> GetItemsBySinger(string singerName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToItemsBySingerDTO.GetItemsBySinger(et.itemsBySinger(singerName).ToList());
        }
    }
}
