using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class ItemsByParameterBL
    {
        public static List<ItemsByParameterDTO> GetItemsByParameter(string parameter)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToItemsByParameterDTO.GetItemsByParameter(et.itemsByParameter(parameter).ToList());
        }
        public static ItemByNameDTO GetItemByName(string name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToItemByNameDTO.GetItemByName(et.itemByName(name).FirstOrDefault());
        }
    }
}
