using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class ArtistsNamesBL
    {
        static MusicOnlineEntities1 et = new MusicOnlineEntities1();
        public static void AddArtistName(ArtistsNameTBL artistsName)
        {
            et.ArtistsNameTBL.Add(artistsName);
            et.SaveChanges();
        }
        public static List<ArtistsNamesDTO> GetArtistsNames()
        {
            return Casts.ToArtistsNameDTO.GetArtistsNames(et.ArtistsNameTBL.ToList());
        }
    }
}
