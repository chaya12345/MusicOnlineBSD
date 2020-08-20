using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToSongsToPlaylistsDTO
    {
        public static SongsToPlaylistsDTO GetSongsToPlaylist(SongsToPlaylistsTBL songsToPlaylists)
        {
            SongsToPlaylistsDTO song = new SongsToPlaylistsDTO();
            song.id = songsToPlaylists.id;
            song.playlistId = songsToPlaylists.playlistId;
            song.songId = songsToPlaylists.songId;
            return song;
        }
        public static List<SongsToPlaylistsDTO> GetSongsToPlaylists(List<SongsToPlaylistsTBL> songs)
        {
            List<SongsToPlaylistsDTO> list = new List<SongsToPlaylistsDTO>();
            foreach (SongsToPlaylistsTBL s in songs)
            {
                list.Add(GetSongsToPlaylist(s));
            }
            return list;
        }
    }
}
