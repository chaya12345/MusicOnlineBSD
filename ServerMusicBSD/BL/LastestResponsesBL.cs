using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class LastestResponsesBL
    {
        public static List<LastestResponsesDTO> GetLastResponsesToArticlesAndSongs()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<latestResponses> list = et.latestResponses.ToList();
            if (list != null)
                return Casts.ToLastesResponsDTO.GetLastResponses(list);
            return null;
        }
    }
}
