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
        public static bool AddPinnedItemToUser(int userId,int itemId,string type)
        {
            //if (updatingsToUser == null)
               // return false;
            MusicOnlineEntities et = new MusicOnlineEntities();
            PinnedItemsTBL pinnedItem = et.PinnedItemsTBL.Where(p => p.itemId_==itemId&&p.type==type).FirstOrDefault();
            if (pinnedItem == null)
            {
                pinnedItem = new PinnedItemsTBL();
                pinnedItem = GetPinnedItem(itemId, type);
                AddPinnedItem(pinnedItem);
                pinnedItem = et.PinnedItemsTBL.Where(p => p.itemId_ == itemId&&p.type==type).FirstOrDefault();
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
        public static PinnedItemsTBL GetPinnedItem(int itemId, string type)
        {
            PinnedItemsTBL item = new PinnedItemsTBL();
            item.type = type;
            if (type == "song")
            {
                songsDetails song = SongsBL.GetSongById(itemId);
                item.itemId_ = song.id;
                item.title = song.title;
                item.image = song.image_location;
                item.date = song.date;
                item.count_like = Convert.ToInt32(song.count_like);
                item.count_views = Convert.ToInt32(song.count_views);
                return item;
            }
            else if (type == "article")
            {
                ArticlesDTO article = ArticlesBL.GetArticleById(itemId);
                item.itemId_ = article.id;
                item.title = article.title;
                item.image = article.image;
                item.date = article.date;
                item.count_like = Convert.ToInt32(article.count_like);
                item.count_views = Convert.ToInt32(article.count_views);
                return item;
            }
            return null;
        }
    }
}
