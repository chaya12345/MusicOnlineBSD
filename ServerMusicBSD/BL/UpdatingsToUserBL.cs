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
        public static List<PinnedItemsToUserDTO> GetPinnedItemsToUser(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<PinnedItemsToUserTBL> list = et.PinnedItemsToUserTBL.Where(p => p.userId == userId).ToList();
            if (list.Count == 0)
                return null;
            return Casts.ToPinnedItemsToUserDTO.GetPinnedItemsToUser(list);
        }
        public static void AddPinnedItemToUser(PinnedItemsToUserTBL pinnedItem)
        {
            try
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                if (pinnedItem != null)
                {
                    et.PinnedItemsToUserTBL.Add(pinnedItem);
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
        public static void DeletePinnedItemToUser(int pinnedItemId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            PinnedItemsToUserTBL pinnedItemsToUserTBL = et.PinnedItemsToUserTBL.Where(p => p.id == pinnedItemId).FirstOrDefault();
            if (pinnedItemsToUserTBL != null)
            {
                et.PinnedItemsToUserTBL.Remove(pinnedItemsToUserTBL);
                et.SaveChanges();
            }
        }
    }
}
