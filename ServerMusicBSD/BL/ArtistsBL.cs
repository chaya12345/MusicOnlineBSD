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
        public static void AddArtistName(ArtistsTBL artistsName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            et.ArtistsTBL.Add(artistsName);
            et.SaveChanges();
        }
        public static List<ArtistsDTO> GetArtistsNames()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToArtistsDTO.GetArtistsNames(et.ArtistsTBL.ToList());
        }
    }
}
