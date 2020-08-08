using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;


namespace BL
{
    public class SongsToPlaylistsBL
    {
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static void AddSongToPlaylist(SongsToPlaylistsTBL songToPlaylist)
        {
            et.SongsToPlaylistsTBL.Add(songToPlaylist);
            et.SaveChanges();
        }
        public static void MoveSongToOtherPlaylist(int id, SongsToPlaylistsTBL songsToPlaylists)
        {
            SongsToPlaylistsTBL songsTo = et.SongsToPlaylistsTBL.Where(s => s.id == id).FirstOrDefault();
            if (songsTo != null)
            {
                if (songsToPlaylists.playlistId != null)
                {
                    songsTo.playlistId = songsToPlaylists.playlistId;
                    et.SaveChanges();
                }
            }
        }
        public static void DeleteSong(int id)
        {
            SongsToPlaylistsTBL song = et.SongsToPlaylistsTBL.Where(s => s.id == id).FirstOrDefault();
            et.SongsToPlaylistsTBL.Remove(song);
            et.SaveChanges();
        }
    }
}
