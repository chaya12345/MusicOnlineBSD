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
    public class UserPlaylistBL
    {
        public static bool AddUserPlaylist(UserPlaylistsTBL playlist)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try {
                if (playlist != null)
                {
                    if (et.UserPlaylistsTBL.Where(p => p.userId == playlist.userId && p.name == playlist.name).FirstOrDefault() != null)
                        return false;
                    et.UserPlaylistsTBL.Add(playlist);
                    et.SaveChanges();
                    return true;
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
        public static bool AddUserPlaylistWithSong(UserPlaylistsTBL playlist, SongsTBL song)
        {
            bool created = AddUserPlaylist(playlist);
            if (created == true)
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                UserPlaylistsTBL currentPlaylist =
                    et.UserPlaylistsTBL.Where(p => p.userId == playlist.userId && p.name == playlist.name).FirstOrDefault();
                if (currentPlaylist != null)
                {
                    SongsToUserPlaylistsBL.AddSongToUserPlaylist(currentPlaylist, song);
                }
                return true;
            }
            return false;
        }
        public static void DeleteUserPlaylist(int id)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            UserPlaylistsTBL playlist = et.UserPlaylistsTBL.Where(p =>p!=null&& p.id == id).FirstOrDefault();
            if (playlist != null)
            {
                List<SongsToUserPlaylistsTBL> songsToDelet = et.SongsToUserPlaylistsTBL.Where(s => s!=null&&s.playlistId == playlist.id).ToList();
                if (songsToDelet == null)
                    return;
                foreach (SongsToUserPlaylistsTBL song in songsToDelet)
                {
                    if (song != null)
                        et.SongsToUserPlaylistsTBL.Remove(song);
                        //SongsToUserPlaylistsBL.DeleteSong(song.songId,playlist.id);
                }
                et.UserPlaylistsTBL.Remove(playlist);
                et.SaveChanges();
            }
        }
        public static List<UserPlaylistsDTO> GetUserPlaylistsByUserId(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<UserPlaylistsTBL> list = et.UserPlaylistsTBL.Where(p =>p!=null&& p.userId == userId).ToList();
            if (list != null)
                return Casts.ToUserPlaylistsDTO.GetUserPlaylists(list);
            return null;
        }
    }
}
