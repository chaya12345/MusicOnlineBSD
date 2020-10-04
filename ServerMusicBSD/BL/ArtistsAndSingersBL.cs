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
            return Casts.ToArtistsAndSingersDTO.GetArtistsAndSingers();
        }
    }
}
