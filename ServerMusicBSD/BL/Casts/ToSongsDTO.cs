using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToSongsDTO
    {
        public static SongsDTO GetSong(SongsTBL songs)
        {
            SongsDTO newSong = new SongsDTO();
            newSong.id = songs.id;
            newSong.name = songs.name;
            newSong.file_location = songs.file_location;
            newSong.type = songs.type;
            newSong.date = songs.date;
            newSong.count = songs.count;
            newSong.singerId = songs.singerId;
            newSong.count_like = songs.count_like;
            newSong.count_views = songs.count_views;
            newSong.tagsId = songs.tagsId;
            newSong.albumId = songs.albumId;
            newSong.title = songs.title;
            newSong.subtitle = songs.subtitle;
            newSong.image_location = songs.image_location;
            newSong.content = songs.content;
            return newSong;
        }

        public static List<SongsDTO> GetSongs(List<SongsTBL> songs)
        {
            List<SongsDTO> songsDTO = new List<SongsDTO>();
            foreach (SongsTBL song in songs)
            {
                songsDTO.Add(GetSong(song));
            }
            return songsDTO;
        }
    }
}
