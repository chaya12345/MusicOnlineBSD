using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToArtistsAndSingersDTO
    {
        public static ArtistsAndSingersDTO GetArtist(ArtistsTBL artists)
        {
            ArtistsAndSingersDTO newArtists = new ArtistsAndSingersDTO();
            newArtists.id = artists.id;
            newArtists.name = artists.name;
            newArtists.type = "artist";
            return newArtists;
        }
        public static ArtistsAndSingersDTO GetSinger(SingersTBL singer)
        {
            ArtistsAndSingersDTO newSinger = new ArtistsAndSingersDTO();
            newSinger.id = singer.id;
            newSinger.name = singer.name;
            newSinger.type = "singer";
            return newSinger;
        }
        public static List<ArtistsAndSingersDTO> GetArtistsAndSingers(List<SingersTBL> singers, List<ArtistsTBL> artists)
        {
            List<ArtistsAndSingersDTO> list = new List<ArtistsAndSingersDTO>();
            foreach (ArtistsTBL item in artists)
            {
                list.Add(GetArtist(item));
            }
            foreach (SingersTBL item in singers)
            {
                list.Add(GetSinger(item));
            }
            return list;
        }
    }
}
