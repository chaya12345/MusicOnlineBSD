using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BL
{
    public class SongsDetailsBL
    {
        public static List<songsDetails> GetSongs()
        {
            List<DTO.SongsDTO> list = SongsBL.GetSongs();
            if (list != null)
                return Casts.ToSongsDetailsDTO.GetSongsDetails(list);
            return null;
        }
    }
}
