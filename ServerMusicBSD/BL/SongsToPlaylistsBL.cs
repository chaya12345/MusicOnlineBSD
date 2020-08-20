using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;


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
        public static void MoveSongToOtherPlaylist(int id, int playlistId)
        {
            SongsToPlaylistsTBL songsTo = et.SongsToPlaylistsTBL.Where(s => s.id == id).FirstOrDefault();
            if (songsTo != null)
            {
                if (playlistId != null)
                {
                    songsTo.playlistId = playlistId;
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
        public static List<SongsToPlaylistsDTO> GetSongsToPlaylists(int playlistId)
        {
            return Casts.ToSongsToPlaylistsDTO.GetSongsToPlaylists(et.SongsToPlaylistsTBL.Where(s => s.playlistId == playlistId).ToList());
        }
    }
}
