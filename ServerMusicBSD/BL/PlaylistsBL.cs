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
    public class PlaylistsBL
    {
        public static List<PlaylistsDTO> GetPlaylists()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<PlaylistsTBL> list = et.PlaylistsTBL.ToList();
            if (list != null)
                return Casts.ToPlaylistsDTO.GetPlaylists(list);
            return null;
        }
        public static PlaylistsDTO GetPlaylistById(int playlistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            PlaylistsTBL playlistsSystem = et.PlaylistsTBL.Where(p => p.id == playlistId).FirstOrDefault();
            if (playlistsSystem != null)
                return Casts.ToPlaylistsDTO.GetPlaylist(playlistsSystem);
            return null;
        }
        public static PlaylistsDTO GetPlaylistByName(string playlistName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            PlaylistsTBL playlists = et.PlaylistsTBL.Where(p => p.name == playlistName).FirstOrDefault();
            if (playlists != null)
                return Casts.ToPlaylistsDTO.GetPlaylist(playlists);
            return null;
        }
        public static void AddPlaylist(PlaylistsTBL playlists)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try {
                if (playlists != null)
                {
                    et.PlaylistsTBL.Add(playlists);
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
        public static void AddPlaylistWithSongs(PlaylistsTBL playlist, string[] songs)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            AddPlaylist(playlist);
            PlaylistsTBL currentPlaylist = et.PlaylistsTBL
                .Where(p => p != null && p.name == playlist.name).FirstOrDefault();
            if (currentPlaylist != null)
            {
                SongsToPlaylistsBL.AddSongsToPlaylist(songs, currentPlaylist.id);
            }
        }
        public static bool UpdatePlaylistWithSongs(PlaylistsTBL playlist, string[] songs)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            PlaylistsTBL currentPlaylist = et.PlaylistsTBL
                .Where(p => p != null && p.id == playlist.id).FirstOrDefault();
            if (currentPlaylist != null)
            {
                currentPlaylist.name = playlist.name;
                currentPlaylist.title = playlist.title;
                currentPlaylist.image = playlist.image;
                if (songs != null && songs.Length > 0)
                {
                    List<SongsTBL> fullSongs = new List<SongsTBL>();
                    foreach (string song in songs)
                    {
                        SongsTBL so = et.SongsTBL.Where(s => s != null && s.name == song).FirstOrDefault();
                        if (so != null)
                        {
                            fullSongs.Add(so);
                        }
                    }
                    SongsToPlaylistsBL.UpdateSongsToPlaylist(playlist.id, fullSongs);
                }
                return true;
            }
            return false;
        }
    }
}
