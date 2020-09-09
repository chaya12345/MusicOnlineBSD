using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToArtistsDTO
    {
        public static ArtistsDTO GetArtistName(ArtistsTBL artistsName)
        {
            ArtistsDTO newArtist = new ArtistsDTO();
            newArtist.id = artistsName.id;
            newArtist.name = artistsName.name;
            return newArtist;
        }
        public static List<ArtistsDTO> GetArtistsNames(List<ArtistsTBL> artistsNames)
        {
            List<ArtistsDTO> newArtists = new List<ArtistsDTO>();
            foreach (ArtistsTBL art in artistsNames)
            {
                newArtists.Add(GetArtistName(art));
            }
            return newArtists;
        }
    }
}
