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
        public static List<songsDetails> GetSongsToPlaylist(int playlistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (playlistId != 33 && playlistId != 34)
            {
                List<SongsToPlaylistsTBL> rellevantSTP = et.SongsToPlaylistsTBL.Where(stp => stp.playlistId == playlistId).ToList();
                List<songsDetails> songs = new List<songsDetails>();
                foreach (SongsToPlaylistsTBL stp in rellevantSTP)
                {
                    songsDetails song = et.songsDetails.Where(s => s.id == stp.songId).FirstOrDefault();
                    if (song != null)
                    {
                        songs.Add(song);
                    }
                }
                return songs;
            }
            if (playlistId == 33)
            {
                return Casts.ToSongsDTO.GetSongs(et.getFavoriteSongs.ToList());
            }
            return Casts.ToSongsDTO.GetSongs(et.GetNewSong.ToList());
        }
        public static void AddSongToPlaylist(SongsToPlaylistsTBL stp)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                if (stp != null)
                {
                    et.SongsToPlaylistsTBL.Add(stp);
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
        public static void AddSongsToPlaylist(string[] songs, int? playlistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                if (songs != null && playlistId != null)
                {
                    foreach (string songName in songs)
                    {
                        SongsTBL song = et.SongsTBL.Where(s => s != null && s.name == songName).FirstOrDefault();
                        if (song != null)
                        {
                            SongsToPlaylistsTBL newStp = new SongsToPlaylistsTBL();
                            newStp.playlistId = playlistId;
                            newStp.songId = song.id;
                            et.SongsToPlaylistsTBL.Add(newStp);
                            et.SaveChanges();
                        }
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
        }
        public static void AddSongsToPlaylist(List<SongsToPlaylistsTBL> stpList)
        {
            if (stpList != null)
            {
                foreach (SongsToPlaylistsTBL stp in stpList)
                {
                    AddSongToPlaylist(stp);
                }
            }
        }
        public static bool UpdateSongsToPlaylist(int playlistId, List<SongsTBL> songs)
        {

        }
        public static void DeleteSongFromPlaylist(int? playlistId, int? songId)
        {
            if (playlistId != null && songId != null)
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                SongsToPlaylistsTBL result = et.SongsToPlaylistsTBL
                    .Where(stp => stp.playlistId == playlistId && stp.songId == songId).FirstOrDefault();
                if (result != null)
                {
                    et.SongsToPlaylistsTBL.Remove(result);
                }
            }
        }
    }
}
