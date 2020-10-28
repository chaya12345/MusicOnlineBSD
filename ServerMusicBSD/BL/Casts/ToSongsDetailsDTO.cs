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
            if (songs == null)
                return null;
            MusicOnlineEntities et = new MusicOnlineEntities();
            songsDetails newSong = new songsDetails();
            newSong.id = songs.id;
            newSong.name = songs.name;
            newSong.file_location = songs.file_location;
            newSong.type = songs.type;
            newSong.date = songs.date;
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
            if (songs == null)
                return null;
            List<songsDetails> songsDTO = new List<songsDetails>();
            foreach (SongsDTO song in songs)
            {
                songsDetails songsDetails = comperSongToSongsDetails(song);
                if (songsDetails != null)
                    songsDTO.Add(songsDetails);
            }
            return songsDTO;
        }
    }
}
