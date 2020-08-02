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
        public static SongsDTO GetSong(getSongs_Result songs)
        {
            SongsDTO newSong = new SongsDTO();
            newSong.id = songs.id;
            newSong.name = songs.name;
            newSong.fileLocation = songs.fileLocation;
            newSong.type = songs.type;
            newSong.date = songs.date;
            newSong.count = songs.count;
            newSong.singerId = songs.singerId;
            newSong.liked = songs.liked;
            newSong.unliked = songs.unliked;
            newSong.tagsId = songs.tagsId;
            newSong.albumId = songs.albumId;
            return newSong;
        }

        public static List<SongsDTO> GetSongs(List<getSongs_Result> songs)
        {
            List<SongsDTO> songsDTO = new List<SongsDTO>();
            foreach (getSongs_Result song in songs)
            {
                songsDTO.Add(GetSong(song));
            }
            return songsDTO;
        }
    }
}
