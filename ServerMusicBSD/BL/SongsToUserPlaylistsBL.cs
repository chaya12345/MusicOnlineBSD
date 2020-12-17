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
    public class SongsToUserPlaylistsBL
    {
        public static void AddSongToUserPlaylist(SongsToUserPlaylistsTBL songToUserPlaylist)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                if (songToUserPlaylist != null)
                {
                    et.SongsToUserPlaylistsTBL.Add(songToUserPlaylist);
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
        public static void AddSongToUserPlaylist(UserPlaylistsTBL playlist, SongsTBL song)
        {
            SongsToUserPlaylistsTBL stp = new SongsToUserPlaylistsTBL();
            stp.songId = song.id;
            stp.playlistId = playlist.id;
            AddSongToUserPlaylist(stp);
        }
        public static bool MoveSongToOtherUserPlaylist(int songId, int prevUserPlaylistId, int currentUserPlaylistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsToUserPlaylistsTBL currentStp = et.SongsToUserPlaylistsTBL.Where(stp => stp != null &&
            stp.songId == songId && stp.playlistId == prevUserPlaylistId).FirstOrDefault();
            if (currentStp != null)
            {
                currentStp.playlistId = currentUserPlaylistId;
                et.SaveChanges();
                return true;
            }
            return false;
        }
        public static void DeleteSong(int? songId,int playlistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsToUserPlaylistsTBL song = et.SongsToUserPlaylistsTBL.Where(s => s != null && s.songId == songId&&s.playlistId==playlistId).FirstOrDefault();
            if (song != null)
            {
                et.SongsToUserPlaylistsTBL.Remove(song);
                et.SaveChanges();
            }
        }
        public static List<songsDetails> GetSongsToUserPlaylists(int userPlaylistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsToUserPlaylistsTBL> list = et.SongsToUserPlaylistsTBL
                .Where(s => s != null && s.playlistId == userPlaylistId).ToList();
            if (list == null)
                return null;
            List<SongsTBL> result = new List<SongsTBL>();
            foreach (SongsToUserPlaylistsTBL item in list)
            {
                SongsTBL song = et.SongsTBL.Where(s => s.id == item.songId).FirstOrDefault();
                if (song != null)
                    result.Add(song);
            }
            if (result != null)
                return Casts.ToSongsDTO.GetSongs(result);
            return null;
        }
        public static void AddLikedSong(int songId, int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            UserPlaylistsTBL playlist = et.UserPlaylistsTBL
                .Where(p => p != null && p.userId == userId && p.name == "שירים שאהבתי").FirstOrDefault();
            if (playlist == null)
            {
                UserPlaylistBL.AddUserPlaylist(new UserPlaylistsTBL() { name = "שירים שאהבתי", userId = userId });
                playlist = et.UserPlaylistsTBL
                    .Where(p => p != null && p.userId == userId && p.name == "שירים שאהבתי").FirstOrDefault();
            }
            if (playlist != null)
            {
                SongsToUserPlaylistsTBL songsToUserPlaylist = new SongsToUserPlaylistsTBL();
                songsToUserPlaylist.playlistId = playlist.id;
                songsToUserPlaylist.songId = songId;
                AddSongToUserPlaylist(songsToUserPlaylist);
            }

        }
    }
}
