using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class ArtistsAndSingersBL
    {
        public static List<ArtistsAndSingersDTO> GetArtistsAndSingers()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersTBL> singers = et.SingersTBL.ToList();
            List<ArtistsTBL> artists = et.ArtistsTBL.ToList();
            return Casts.ToArtistsAndSingersDTO.GetArtistsAndSingers(singers, artists);
        }
        public static ArtistsAndSingersDTO GetArtistOrSingerByName(string name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ArtistsAndSingersDTO> list = GetArtistsAndSingers();
            return list.Where(artist => artist.name == name).FirstOrDefault();
        }
    }
}
