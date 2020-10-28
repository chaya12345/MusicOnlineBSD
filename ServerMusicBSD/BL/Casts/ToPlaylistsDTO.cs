using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;

namespace BL.Casts
{
    public class ToPlaylistsDTO
    {
        public static PlaylistsDTO GetPlaylist(PlaylistsTBL playlist)
        {
            if (playlist == null)
                return null;
            PlaylistsDTO newPlaylist = new PlaylistsDTO();
            newPlaylist.id = playlist.id;
            newPlaylist.userId = playlist.userId;
            newPlaylist.name = playlist.name;
            return newPlaylist;
        }
        public static List<PlaylistsDTO> GetPlaylists(List<PlaylistsTBL> playlists)
        {
            if (playlists == null)
                return null;
            List<PlaylistsDTO> newPlaylists = new List<PlaylistsDTO>();
            foreach (PlaylistsTBL play in playlists)
            {
                PlaylistsDTO playlistsDTO = GetPlaylist(play);
                if (playlistsDTO != null)
                    newPlaylists.Add(playlistsDTO);
            }
            return newPlaylists;
        }
    }
}
