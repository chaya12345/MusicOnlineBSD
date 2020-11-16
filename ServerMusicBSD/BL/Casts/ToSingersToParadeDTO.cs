using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToSingersToParadeDTO
    {
        public static SingersToParadeDTO GetParade(SingersToParadeTBL Parade)
        {
            if (Parade == null)
                return null;
            SingersToParadeDTO newParade = new SingersToParadeDTO();
            newParade.id = Parade.id;
            newParade.singerId = Parade.singerId;
            newParade.count = Parade.count;
            return newParade;
        }
        public static List<SingersToParadeDTO> GetParades(List<SingersToParadeTBL> Parades)
        {
            if (Parades == null)
                return null;
            List<SingersToParadeDTO> list = new List<SingersToParadeDTO>();
            foreach (SingersToParadeTBL item in Parades)
            {
                SingersToParadeDTO Parade = GetParade(item);
                if (Parade != null)
                    list.Add(Parade);
            }
            return list != null ? list : null;
        }
    }
}
