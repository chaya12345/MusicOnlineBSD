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
    public class SongsToPlaylistsBL
    {
        public static void AddSongToPlaylist(SongsToPlaylistsTBL songToPlaylist)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try { 
            et.SongsToPlaylistsTBL.Add(songToPlaylist);
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
        public static void MoveSongToOtherPlaylist(int id, int playlistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsToPlaylistsTBL songsTo = et.SongsToPlaylistsTBL.Where(s => s.id == id).FirstOrDefault();
            if (songsTo != null)
            {
                songsTo.playlistId = playlistId;
                et.SaveChanges();
            }
        }
        public static void DeleteSong(int id)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsToPlaylistsTBL song = et.SongsToPlaylistsTBL.Where(s => s.id == id).FirstOrDefault();
            et.SongsToPlaylistsTBL.Remove(song);
            et.SaveChanges();
        }
        public static List<SongsToPlaylistsDTO> GetSongsToPlaylists(int playlistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToSongsToPlaylistsDTO.GetSongsToPlaylists(et.SongsToPlaylistsTBL
                .Where(s => s.playlistId == playlistId).ToList());
        }
    }
}
