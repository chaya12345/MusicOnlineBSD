using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class ArtistsBL
    {
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static void AddArtistName(ArtistsTBL artistsName)
        {
            et.ArtistsTBL.Add(artistsName);
            et.SaveChanges();
        }
        public static List<ArtistsDTO> GetArtistsNames()
        {
            return Casts.ToArtistsDTO.GetArtistsNames(et.ArtistsTBL.ToList());
        }
    }
}
