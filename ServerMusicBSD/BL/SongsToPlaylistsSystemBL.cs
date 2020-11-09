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
    public class SongsToPlaylistsSystemBL
    {
        public static List<songsDetails> GetSongsToPlaylistSystem(int playlistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsToPlaylistsSystemTBL> rellevantSTP = et.SongsToPlaylistsSystemTBL.Where(stp => stp.playlistId == playlistId).ToList();
            List<songsDetails> songs = new List<songsDetails>();
            foreach (SongsToPlaylistsSystemTBL stp in rellevantSTP)
            {
                songsDetails song = et.songsDetails.Where(s => s.id == stp.songId).FirstOrDefault();
                if (song != null)
                {
                    songs.Add(song);
                }
            }
            return songs;
        }
        public static void AddSongToPlaylistSystem(SongsToPlaylistsSystemTBL stp)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                if (stp != null)
                {
                    et.SongsToPlaylistsSystemTBL.Add(stp);
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
        public static void AddSongsToPlaylistSystem(List<SongsToPlaylistsSystemTBL> stpList)
        {
            if (stpList != null)
            {
                foreach (SongsToPlaylistsSystemTBL stp in stpList)
                {
                    AddSongToPlaylistSystem(stp);
                }
            }
        }
        public static void DeleteSongFromPlaylistSystem(int? playlistId, int? songId)
        {
            if (playlistId != null && songId != null)
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                SongsToPlaylistsSystemTBL result = et.SongsToPlaylistsSystemTBL
                    .Where(stp => stp.playlistId == playlistId && stp.songId == songId).FirstOrDefault();
                if (result != null)
                {
                    et.SongsToPlaylistsSystemTBL.Remove(result);
                }
            }
        }
    }
}
