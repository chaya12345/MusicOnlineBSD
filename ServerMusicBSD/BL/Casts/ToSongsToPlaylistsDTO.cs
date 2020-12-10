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
        public static SongsToUserPlaylistsDTO GetSongsToPlaylist(SongsToPlaylistsTBL songsToPlaylists)
        {
            if (songsToPlaylists == null)
                return null;
            SongsToUserPlaylistsDTO song = new SongsToUserPlaylistsDTO();
            song.id = songsToPlaylists.id;
            song.playlistId = songsToPlaylists.playlistId;
            song.songId = songsToPlaylists.songId;
            return song;
        }
        public static List<SongsToUserPlaylistsDTO> GetSongsToPlaylists(List<SongsToPlaylistsTBL> songs)
        {
            if (songs == null)
                return null;
            List<SongsToUserPlaylistsDTO> list = new List<SongsToUserPlaylistsDTO>();
            foreach (SongsToPlaylistsTBL s in songs)
            {
                SongsToUserPlaylistsDTO songsToPlaylists= GetSongsToPlaylist(s);
                if(songsToPlaylists!=null)
                list.Add(songsToPlaylists);
            }
            return list;
        }
    }
}
