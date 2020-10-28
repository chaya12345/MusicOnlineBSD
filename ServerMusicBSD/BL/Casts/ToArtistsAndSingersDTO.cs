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
            if (artists == null)
                return null;
            ArtistsAndSingersDTO newArtists = new ArtistsAndSingersDTO();
            newArtists.id = artists.id;
            newArtists.name = artists.name;
            newArtists.type = "artist";
            return newArtists;
        }
        public static ArtistsAndSingersDTO GetSinger(SingersTBL singer)
        {
            if (singer == null)
                return null;
            ArtistsAndSingersDTO newSinger = new ArtistsAndSingersDTO();
            newSinger.id = singer.id;
            newSinger.name = singer.name;
            newSinger.type = "singer";
            return newSinger;
        }
        public static List<ArtistsAndSingersDTO> GetArtistsAndSingers(List<SingersTBL> singers, List<ArtistsTBL> artists)
        {
            if (singers == null)
                return null;
            List<ArtistsAndSingersDTO> list = new List<ArtistsAndSingersDTO>();
            foreach (ArtistsTBL item in artists)
            {
                ArtistsAndSingersDTO artistsAndSingersDTO = GetArtist(item);
                if (artistsAndSingersDTO != null)
                    list.Add(artistsAndSingersDTO);
            }
            foreach (SingersTBL item in singers)
            {
                ArtistsAndSingersDTO artistsAndSingersDTO = GetSinger(item);
                if (artistsAndSingersDTO != null)
                    list.Add(artistsAndSingersDTO);
            }
            return clearDuplicate(list);
        }
        public static List<ArtistsAndSingersDTO> clearDuplicate(List<ArtistsAndSingersDTO> artistsAndSingers)
        {
            if (artistsAndSingers == null)
                return null;
            List<ArtistsAndSingersDTO> clearList = new List<ArtistsAndSingersDTO>();
            foreach (ArtistsAndSingersDTO item in artistsAndSingers)
            {
                if (item != null)
                {
                    if (clearList.Where(a => a != null && a.name == item.name).FirstOrDefault() == null)
                    {
                        clearList.Add(item);
                        bool b = clearList.Contains(item);
                    }
                }
                
            }
            return clearList;
        }
    }
}
