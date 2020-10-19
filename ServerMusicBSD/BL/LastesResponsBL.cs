using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class LastesResponsBL
    {
        public static List<LastesResponsDTO> GetLastResponsesToArticlesAndSongs()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToLastesResponsDTO.GetLastResponses(et.latestResponses.ToList());
        }
    }
}
