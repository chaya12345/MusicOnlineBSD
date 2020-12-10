using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

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
            newPlaylist.name = playlist.name;
            newPlaylist.title = playlist.title;
            newPlaylist.count_views = playlist.count_views;
            newPlaylist.image = playlist.image;
            return newPlaylist;
        }
        public static List<PlaylistsDTO> GetPlaylists(List<PlaylistsTBL> playlists)
        {
            if (playlists == null)
                return null;
            List<PlaylistsDTO> newPlaylists = new List<PlaylistsDTO>();
            foreach (PlaylistsTBL playlist in playlists)
            {
                newPlaylists.Add(GetPlaylist(playlist));
            }
            return newPlaylists;
        }
    }
}
