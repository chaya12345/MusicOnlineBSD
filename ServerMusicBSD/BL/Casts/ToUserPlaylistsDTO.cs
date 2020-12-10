using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;

namespace BL.Casts
{
    public class ToUserPlaylistsDTO
    {
        public static UserPlaylistsDTO GetUserPlaylist(UserPlaylistsTBL playlist)
        {
            if (playlist == null)
                return null;
            UserPlaylistsDTO newPlaylist = new UserPlaylistsDTO();
            newPlaylist.id = playlist.id;
            newPlaylist.userId = playlist.userId;
            newPlaylist.name = playlist.name;
            return newPlaylist;
        }
        public static List<UserPlaylistsDTO> GetUserPlaylists(List<UserPlaylistsTBL> playlists)
        {
            if (playlists == null)
                return null;
            List<UserPlaylistsDTO> newPlaylists = new List<UserPlaylistsDTO>();
            foreach (UserPlaylistsTBL play in playlists)
            {
                UserPlaylistsDTO playlistsDTO = GetUserPlaylist(play);
                if (playlistsDTO != null)
                    newPlaylists.Add(playlistsDTO);
            }
            return newPlaylists;
        }
    }
}
