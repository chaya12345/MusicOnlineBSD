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
            if (songsToPlaylists == null)
                return null;
            SongsToPlaylistsDTO song = new SongsToPlaylistsDTO();
            song.id = songsToPlaylists.id;
            song.playlistId = songsToPlaylists.playlistId;
            song.songId = songsToPlaylists.songId;
            return song;
        }
        public static List<SongsToPlaylistsDTO> GetSongsToPlaylists(List<SongsToPlaylistsTBL> songs)
        {
            if (songs == null)
                return null;
            List<SongsToPlaylistsDTO> list = new List<SongsToPlaylistsDTO>();
            foreach (SongsToPlaylistsTBL s in songs)
            {
                SongsToPlaylistsDTO songsToPlaylists= GetSongsToPlaylist(s);
                if(songsToPlaylists!=null)
                list.Add(songsToPlaylists);
            }
            return list;
        }
    }
}
