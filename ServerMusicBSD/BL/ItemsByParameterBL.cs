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
            List<itemsByParameter_Result> list = et.itemsByParameter(parameter).ToList();
            if (list != null)
                return Casts.ToItemsByParameterDTO.GetItemsByParameter(list);
            return null;
        }
        public static ItemByNameDTO GetItemByName(string name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            itemByName_Result itemByName = et.itemByName(name).FirstOrDefault();
            if(itemByName!=null)
            return Casts.ToItemByNameDTO.GetItemByName(itemByName);
            return null;
        }
    }
}
