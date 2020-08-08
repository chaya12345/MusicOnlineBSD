using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BL
{
    public class PlaylistBL
    {
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static void AddPlaylist(PlaylistsTBL playlist)
        {
            et.PlaylistsTBL.Add(playlist);
            et.SaveChanges();
        }
        public static void DeletePlaylist(int id)
        {
            PlaylistsTBL playlist = et.PlaylistsTBL.Where(p => p.id == id).FirstOrDefault();
            if (playlist != null)
            {
                et.PlaylistsTBL.Remove(playlist);
                et.SaveChanges();
            }
            List<SongsToPlaylistsTBL> songsToDelet = et.SongsToPlaylistsTBL.Where(s => s.playlistId == id).ToList();
            foreach (SongsToPlaylistsTBL song in songsToDelet)
            {
                SongsToPlaylistsBL.DeleteSong(song.id);
            }
            

        }
    }
}
