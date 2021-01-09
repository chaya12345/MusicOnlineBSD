using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class SearchingsOfUserBL
    {
        public static List<SearchingsOfUsersDTO> GetSearchingsOfUser(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToSearchingsOfUserDTO.GetSearchings(
                et.SearchingsOfUsersTBL.Where(s => s != null && s.userId == userId).ToList());
        }
        private static bool AddSearchingsToUser(int? userId, string itemName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                if (userId != null && itemName != null)
                {
                    itemByName_Result item = et.itemByName(itemName).FirstOrDefault();
                    if (item != null)
                    {
                        SearchingsOfUsersTBL searching = new SearchingsOfUsersTBL();
                        searching.userId = userId;
                        searching.itemId = item.id;
                        searching.type = item.type;
                        searching.lastDate = DateTime.Now;
                        searching.count = 1;
                        et.SearchingsOfUsersTBL.Add(searching);
                        et.SaveChanges();
                        return true;
                    }
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
            return false;
        }
        public static bool CheckIsExist(int? userId, string itemName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (userId != null && itemName != null)
            {
                itemByName_Result item = et.itemByName(itemName).FirstOrDefault();
                if (item != null)
                {
                    SearchingsOfUsersTBL searching = et.SearchingsOfUsersTBL
                        .Where(s => s != null && s.userId == userId && s.itemId == item.id
                    && s.type == item.type).FirstOrDefault();
                    if (searching == null)
                    {
                        return AddSearchingsToUser(userId, itemName);
                    }
                    else
                    {
                        searching.count++;
                        et.SaveChanges();
                        return true;
                    }
                }
            }
            return false;
        }
        public static List<itemsWithPinnedToUserDTO> GetUpdatingsToUser‏(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToitemsWithPinnedToUserDTO.GetItemsWithPinned(et.itemsWithPinnedToUser(userId).ToList());
        }
    }
}
