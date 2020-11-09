using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToPlaylistsSystemDTO
    {
        public static PlaylistsSystemDTO GetPlaylistSystem(PlaylistsSystemTBL playlist)
        {
            if (playlist == null)
                return null;
            PlaylistsSystemDTO newPlaylist = new PlaylistsSystemDTO();
            newPlaylist.id = playlist.id;
            newPlaylist.name = playlist.name;
            newPlaylist.title = playlist.title;
            newPlaylist.count_views = playlist.count_views;
            newPlaylist.image = playlist.image;
            return newPlaylist;
        }
        public static List<PlaylistsSystemDTO> GetPlaylistsSystem(List<PlaylistsSystemTBL> playlists)
        {
            if (playlists == null)
                return null;
            List<PlaylistsSystemDTO> newPlaylists = new List<PlaylistsSystemDTO>();
            foreach (PlaylistsSystemTBL playlist in playlists)
            {
                PlaylistsSystemDTO playlistsSystemDTO = GetPlaylistSystem(playlist);
                if (playlistsSystemDTO != null)
                    newPlaylists.Add(playlistsSystemDTO);
            }
            return newPlaylists;
        }
    }
}
