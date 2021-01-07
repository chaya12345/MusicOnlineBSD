using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;

namespace BL.Casts
{
    public class ToPinnedItemsToUserDTO
    {
        public static PinnedItemsToUserDTO GetPinnedItemToUser(PinnedItemsToUserTBL pinnedItem)
        {
            if (pinnedItem == null)
                return null;
            PinnedItemsToUserDTO newPinnedItem = new PinnedItemsToUserDTO();
            newPinnedItem.id = pinnedItem.id;
            newPinnedItem.userId = pinnedItem.userId;
            newPinnedItem.title = pinnedItem.title;
            newPinnedItem.image = pinnedItem.image;
            newPinnedItem.date = pinnedItem.date;
            newPinnedItem.count_like = pinnedItem.count_like;
            newPinnedItem.count_views = pinnedItem.count_views;
            return newPinnedItem;
        }
        public static List<PinnedItemsToUserDTO> GetPinnedItemsToUser(List<PinnedItemsToUserTBL> pinnedItems)
        {
            if (pinnedItems.Count == 0)
                return null;
            List<PinnedItemsToUserDTO> list = new List<PinnedItemsToUserDTO>();
            foreach (PinnedItemsToUserTBL item in pinnedItems)
            {
                if (item != null)
                {
                    PinnedItemsToUserDTO pinnedItemsToUserDTO = GetPinnedItemToUser(item);
                    if (pinnedItemsToUserDTO != null)
                        list.Add(pinnedItemsToUserDTO);
                }
            }
            return list;
        }
    }
}
