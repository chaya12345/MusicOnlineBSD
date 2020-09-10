using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class PlaylistBL
    {
        public static void AddPlaylist(PlaylistsTBL playlist)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            et.PlaylistsTBL.Add(playlist);
            et.SaveChanges();
        }
        public static void DeletePlaylist(int id)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            PlaylistsTBL playlist = et.PlaylistsTBL.Where(p => p.id == id).FirstOrDefault();
            if (playlist != null)
            {
                et.PlaylistsTBL.Remove(playlist);
                et.SaveChanges();
                List<SongsToPlaylistsTBL> songsToDelet = et.SongsToPlaylistsTBL.Where(s => s.playlistId == id).ToList();
                foreach (SongsToPlaylistsTBL song in songsToDelet)
                {
                    SongsToPlaylistsBL.DeleteSong(song.id);
                }
            }
        }
        public static List<PlaylistsDTO> GetPlaylistsByUserId(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToPlaylistsDTO.GetPlaylists(et.PlaylistsTBL.Where(p => p.userId == userId).ToList());
        }
    }
}
