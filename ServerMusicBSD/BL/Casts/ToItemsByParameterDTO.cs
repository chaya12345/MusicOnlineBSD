using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToItemsByParameterDTO
    {
        public static ItemsByParameterDTO GetItemByParameter(itemsByParameter_Result item)
        {
            ItemsByParameterDTO newItem = new ItemsByParameterDTO();
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
        public static List<ItemsByParameterDTO> GetItemsByParameter(List<itemsByParameter_Result> items)
        {
            List<ItemsByParameterDTO> list = new List<ItemsByParameterDTO>();
            foreach (itemsByParameter_Result item in items)
            {
                list.Add(GetItemByParameter(item));
            }
            return list;
        }
    }
}
