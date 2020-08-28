using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;

namespace BL.Casts
{
    public class ToArtistsNameDTO
    {
        public static ArtistsNamesDTO GetArtistsName(ArtistsNameTBL artistsName) 
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
                newArtists.Add(GetArtistsName(art));
            }
            return newArtists;
        }
    }
}
