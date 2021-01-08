using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;
using System.Data.Entity.Validation;

namespace BL
{
    public class UpdatingsToUserBL
    {
        public static List<UpdatingsToUserDTO> GetUpdatings(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToUpdatingsToUserDTO.GetUpdatingsToUser(et.UpdatingsToUser(userId).ToList());
        }
        public static void AddPinnedItem(PinnedItemsTBL pinnedItem)
        {
            try
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                if (pinnedItem != null)
                {
                    et.PinnedItemsTBL.Add(pinnedItem);
                    et.SaveChanges();
                }
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
        }
        public static bool AddPinnedItemToUser(UpdatingsToUserDTO updatingsToUser,int userId)
        {
            if (updatingsToUser == null)
                return false;
            MusicOnlineEntities et = new MusicOnlineEntities();
            PinnedItemsTBL pinnedItem = et.PinnedItemsTBL.Where(p => p.itemId_ == updatingsToUser.id).FirstOrDefault();
            if (pinnedItem == null)
            {
                pinnedItem = new PinnedItemsTBL();
                pinnedItem.itemId_ = updatingsToUser.id;
                pinnedItem.title = updatingsToUser.title;
                pinnedItem.image = updatingsToUser.image;
                pinnedItem.date = updatingsToUser.date;
                pinnedItem.count_like = Convert.ToInt32(updatingsToUser.count_like);
                pinnedItem.count_views = Convert.ToInt32(updatingsToUser.count_views);
                pinnedItem.type = updatingsToUser.type;
                AddPinnedItem(pinnedItem);
                pinnedItem = et.PinnedItemsTBL.Where(p => p.itemId_ == updatingsToUser.id).FirstOrDefault();
            }
            PinnedItemsToUserTBL pitu = new PinnedItemsToUserTBL();
            pitu.pinnedItemId = pinnedItem.id;
            pitu.userId = userId;
            pitu.date = DateTime.Now;
            et.PinnedItemsToUserTBL.Add(pitu);
            et.SaveChanges();
            return true;
        }
        public static bool DeletePinnedItemToUser(int userId, int itemId, string type)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            PinnedItemsTBL pinnedItem = et.PinnedItemsTBL
                .Where(p => p != null && p.itemId_ == itemId && p.type == type).FirstOrDefault();
            if (pinnedItem != null)
            {
                PinnedItemsToUserTBL pinnedItemToUser = et.PinnedItemsToUserTBL
                    .Where(ptu => ptu != null && ptu.userId == userId && ptu.pinnedItemId == pinnedItem.id)
                    .FirstOrDefault();
                if (pinnedItemToUser != null)
                {
                    et.PinnedItemsToUserTBL.Remove(pinnedItemToUser);
                    et.SaveChanges();
                    return true;
                }
            }
            return false;
        }
    }
}
