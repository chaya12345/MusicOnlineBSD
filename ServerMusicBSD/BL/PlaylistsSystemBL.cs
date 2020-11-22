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
            List<PlaylistsSystemTBL> list = et.PlaylistsSystemTBL.ToList();
            if (list != null)
                return Casts.ToPlaylistsSystemDTO.GetPlaylistsSystem(list);
            return null;
        }
        public static PlaylistsSystemDTO GetPlaylistById(int playlistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            PlaylistsSystemTBL playlistsSystem = et.PlaylistsSystemTBL.Where(p => p.id == playlistId).FirstOrDefault();
            if (playlistsSystem != null)
                return Casts.ToPlaylistsSystemDTO.GetPlaylistSystem(playlistsSystem);
            return null;
        }
        public static PlaylistsSystemDTO GetPlaylistByName(string playlistName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            PlaylistsSystemTBL playlistsSystem = et.PlaylistsSystemTBL.Where(p => p.name == playlistName).FirstOrDefault();
            if (playlistsSystem != null)
                return Casts.ToPlaylistsSystemDTO.GetPlaylistSystem(playlistsSystem);
            return null;
        }
        public static void AddPlaylistSystem(PlaylistsSystemTBL playlistsSystem)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try {
                if (playlistsSystem != null)
                {
                    et.PlaylistsSystemTBL.Add(playlistsSystem);
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
        public static void AddPlaylistSystemWithSongs(PlaylistsSystemTBL playlistSystem, string[] songs)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            AddPlaylistSystem(playlistSystem);
            PlaylistsSystemTBL currentPlaylist = et.PlaylistsSystemTBL
                .Where(playlist => playlist != null && playlist.name == playlistSystem.name).FirstOrDefault();
            if (currentPlaylist != null)
            {
                SongsToPlaylistsSystemBL.AddSongsToPlaylistSystem(songs, currentPlaylist.id);
            }
        }
    }
}
