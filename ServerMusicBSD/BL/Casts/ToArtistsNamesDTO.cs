using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToArtistsNamesDTO
    {
        public static ArtistsNamesDTO GetArtistName(ArtistsNameTBL artistsName)
        {
            ArtistsNamesDTO newArtist = new ArtistsNamesDTO();
            newArtist.id = artistsName.id;
            newArtist.name = artistsName.name;
            return newArtist;
        }
        public static List<ArtistsNamesDTO> GetArtistsNames(List<ArtistsNameTBL> artistsNames)
        {
            List<ArtistsNamesDTO> newArtists = new List<ArtistsNamesDTO>();
            foreach (ArtistsNameTBL art in artistsNames)
            {
                newArtists.Add(GetArtistName(art));
            }
            return newArtists;
        }
    }
}
