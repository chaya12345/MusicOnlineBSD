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
            PlaylistsSystemDTO newPlaylist = new PlaylistsSystemDTO();
            newPlaylist.id = playlist.id;
            newPlaylist.name = playlist.name;
            newPlaylist.title = playlist.title;
            newPlaylist.count_views = playlist.count_views;
            newPlaylist.image = playlist.image;
            newPlaylist.tagId = playlist.tagId;
            return newPlaylist;
        }
        public static List<PlaylistsSystemDTO> GetPlaylistsSystem
            (List<PlaylistsSystemTBL> playlists)
        {
            List<PlaylistsSystemDTO> newPlaylists = new List<PlaylistsSystemDTO>();
            foreach (PlaylistsSystemTBL playlist in playlists)
            {
                newPlaylists.Add(GetPlaylistSystem(playlist));
            }
            return newPlaylists;
        }
    }
}
