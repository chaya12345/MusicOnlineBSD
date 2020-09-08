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
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static void AddPlaylist(PlaylistsTBL playlist)
        {
            et.PlaylistsTBLs.Add(playlist);
            et.SaveChanges();
        }
        public static void DeletePlaylist(int id)
        {
            PlaylistsTBL playlist = et.PlaylistsTBLs.Where(p => p.id == id).FirstOrDefault();
            if (playlist != null)
            {
                et.PlaylistsTBLs.Remove(playlist);
                et.SaveChanges();
                List<SongsToPlaylistsTBL> songsToDelet = et.SongsToPlaylistsTBLs.Where(s => s.playlistId == id).ToList();
                foreach (SongsToPlaylistsTBL song in songsToDelet)
                {
                    SongsToPlaylistsBL.DeleteSong(song.id);
                }
            }
        }
        public static List<PlaylistsDTO> GetPlaylistsByUserId(int userId)
        {
            return Casts.ToPlaylistsDTO.GetPlaylists(et.PlaylistsTBLs.Where(p => p.userId == userId).ToList());
        }
    }
}
