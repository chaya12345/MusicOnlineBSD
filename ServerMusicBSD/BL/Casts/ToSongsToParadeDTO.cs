using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToSongsToParadeDTO
    {
        public static SongsToParadeDTO GetSTP(SongsToParadeTBL Parade)
        {
            if (Parade == null)
                return null;
            SongsToParadeDTO newParade = new SongsToParadeDTO();
            newParade.id = Parade.id;
            newParade.songId = Parade.songId;
            newParade.count = Parade.count;
            return newParade;
        }
        public static List<SongsToParadeDTO> GetSTPs(List<SongsToParadeTBL> Parades)
        {
            if (Parades == null)
                return null;
            List<SongsToParadeDTO> list = new List<SongsToParadeDTO>();
            foreach (SongsToParadeTBL item in Parades)
            {
                SongsToParadeDTO Parade = GetSTP(item);
                if (Parade != null)
                    list.Add(Parade);
            }
            return list != null ? list : null;
        }
    }
}
