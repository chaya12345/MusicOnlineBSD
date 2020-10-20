using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToItemsBySingerDTO
    {
        public static ItemsBySingerDTO GetItemBySinger(itemsBySinger_Result item)
        {
            ItemsBySingerDTO newItem = new ItemsBySingerDTO();
            newItem.id = item.id;
            newItem.title = item.title;
            newItem.subtitle = item.subtitle;
            if (!item.date.HasValue)
                newItem.date = new DateTime();
            else newItem.date = item.date.Value;
            newItem.dateHebrew = item.dateHebrew;
            newItem.image = item.image;
            newItem.type = item.type;
            return newItem;
        }
        public static List<ItemsBySingerDTO> GetItemsBySinger(List<itemsBySinger_Result> items)
        {
            List<ItemsBySingerDTO> list = new List<ItemsBySingerDTO>();
            foreach (itemsBySinger_Result item in items)
            {
                list.Add(GetItemBySinger(item));
            }
            return list;
        }
    }
}
