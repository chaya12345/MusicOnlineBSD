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
    public class PlaylistsSystemBL
    {
        public static List<PlaylistsSystemDTO> GetPlaylists()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToPlaylistsSystemDTO.GetPlaylistsSystem(
                et.PlaylistsSystemTBL.ToList());
        }
        public static PlaylistsSystemDTO GetPlaylistById(int playlistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToPlaylistsSystemDTO.GetPlaylistSystem(
                et.PlaylistsSystemTBL.Where(p => p.id == playlistId).FirstOrDefault());
        }
        public static void AddPlaylistSystem(PlaylistsSystemTBL playlistsSystem)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try { 
                et.PlaylistsSystemTBL.Add(playlistsSystem);
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
    }
}
