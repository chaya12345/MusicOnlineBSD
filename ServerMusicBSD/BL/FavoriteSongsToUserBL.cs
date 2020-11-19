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
    public class FavoriteSongsToUserBL
    {
        public static List<songsDetails> GetFavoriteSongsToUser(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<FavoriteSongsToUserTBL> list = et.FavoriteSongsToUserTBL.Where(f => f != null && f.userId == userId).ToList();
            List<SongsTBL> result = new List<SongsTBL>();
            if (list == null)
                return null;
            foreach (FavoriteSongsToUserTBL item in list)
            {
                SongsTBL relevantSong = et.SongsTBL.Where(song => song != null && song.id == item.songId).FirstOrDefault();
                if (relevantSong != null)
                    result.Add(relevantSong);
            }
            if (result != null)
               return Casts.ToSongsDTO.GetSongs(result);
            return null;
        }
        public static void AddFavoriteSongToUser(FavoriteSongsToUserTBL favoriteSongsToUser)
        {
            try
            {
                if (favoriteSongsToUser == null)
                    return;
                MusicOnlineEntities et = new MusicOnlineEntities();
                et.FavoriteSongsToUserTBL.Add(favoriteSongsToUser);
                et.SaveChanges();
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
        public static void DeleteFavoriteSongFromUser(int userId,int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            FavoriteSongsToUserTBL favorite = et.FavoriteSongsToUserTBL.Where(f => f != null && f.songId == songId && f.userId == userId).FirstOrDefault();
            et.FavoriteSongsToUserTBL.Remove(favorite);
            et.SaveChanges();
        }
    }
}
