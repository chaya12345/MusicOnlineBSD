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
        public static SongsDTO GetSong(SongsTBL song)
        {
            if (song != null)
            {
                SongsDTO newSong = new SongsDTO();
                newSong.id = song.id;
                newSong.name = song.name;
                newSong.file_location = song.file_location;
                newSong.type = song.type;
                newSong.date = song.date;
                newSong.count_responses = song.count_responses;
                newSong.singerId = song.singerId;
                newSong.count_like = song.count_like;
                newSong.count_views = song.count_views;
                newSong.albumId = song.albumId;
                newSong.title = song.title;
                newSong.subtitle = song.subtitle;
                newSong.image_location = song.image_location;
                newSong.content = song.content;
                return newSong;
            }
            return null;
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

        public static similarSongs comperSongToSimilarSong(SongsTBL songs)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            similarSongs newSong = new similarSongs();
            newSong.id = songs.id;
            newSong.name = songs.name;
            newSong.file_location = songs.file_location;
            newSong.type = songs.type;
            newSong.date = songs.date;
            newSong.count_responses = songs.count_responses;
            SingersTBL s1 = et.SingersTBL.Where(s => s.id == songs.singerId).FirstOrDefault();
            newSong.singerName = s1!=null?s1.name:null;
            newSong.count_like = songs.count_like;
            newSong.count_views = songs.count_views;
            newSong.albumId = songs.albumId;
            newSong.title = songs.title;
            newSong.subtitle = songs.subtitle;
            newSong.image_location = songs.image_location;
            newSong.content = songs.content;
            return newSong;
        }
    }
}
