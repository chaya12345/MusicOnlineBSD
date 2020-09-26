using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToSongsDetailsDTO
    {
        public static songsDetails comperSongToSongsDetails(SongsDTO songs)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            songsDetails newSong = new songsDetails();
            newSong.id = songs.id;
            newSong.name = songs.name;
            newSong.file_location = songs.file_location;
            newSong.type = songs.type;
            newSong.date = songs.date;
            newSong.count_responses = songs.count_responses;
            SingersTBL s1 = et.SingersTBL.Where(s => s.id == songs.singerId).FirstOrDefault();
            newSong.singerName = s1 != null ? s1.name : null;
            newSong.count_like = songs.count_like;
            newSong.count_views = songs.count_views;
            newSong.albumId = songs.albumId;
            newSong.title = songs.title;
            newSong.subtitle = songs.subtitle;
            newSong.image_location = songs.image_location;
            newSong.content = songs.content;
            return newSong;
        }
        public static List<songsDetails> GetSongsDetails(List<SongsDTO> songs)
        {
            List<songsDetails> songsDTO = new List<songsDetails>();
            foreach (SongsDTO song in songs)
            {
                songsDTO.Add(comperSongToSongsDetails(song));
            }
            return songsDTO;
        }
    }
}
