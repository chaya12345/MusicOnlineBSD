using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToitemsWithPinnedToUserDTO
    {
        public static itemsWithPinnedToUserDTO GetItemWithPinned(itemsWithPinnedToUser_Result item)
        {
            if (item == null)
                return null;
            itemsWithPinnedToUserDTO newItem = new itemsWithPinnedToUserDTO();
            newItem.id = item.id;
            newItem.title = item.title;
            newItem.image = item.image;
            newItem.date = item.date;
            newItem.type = item.type;
            newItem.isPinned = item.isPinned;
            return newItem;
        }
        public static List<itemsWithPinnedToUserDTO> GetItemsWithPinned(List<itemsWithPinnedToUser_Result> items)
        {
            if (items.Count == 0)
                return null;
            List<itemsWithPinnedToUserDTO> list = new List<itemsWithPinnedToUserDTO>();
            foreach (itemsWithPinnedToUser_Result item in items)
            {
                if (item != null)
                {
                    itemsWithPinnedToUserDTO newItem = GetItemWithPinned(item);
                    if (newItem != null)
                        list.Add(newItem);
                }
            }
            if (list != null)
                list = list.OrderByDescending(i => i.date).ToList();
            return list;
        }
    }
}
