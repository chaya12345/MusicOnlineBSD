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
            if (artistsName == null)
                return null;
            ArtistsDTO newArtist = new ArtistsDTO();
            newArtist.id = artistsName.id;
            newArtist.name = artistsName.name;
            return newArtist;
        }
        public static List<ArtistsDTO> GetArtistsNames(List<ArtistsTBL> artistsNames)
        {
            if (artistsNames == null)
                return null;
            List<ArtistsDTO> newArtists = new List<ArtistsDTO>();
            foreach (ArtistsTBL art in artistsNames)
            {
                ArtistsDTO artistsDTO = GetArtistName(art);
                if (artistsDTO != null)
                    newArtists.Add(artistsDTO);
            }
            return newArtists;
        }
    }
}
