using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToParadeDTO
    {
        public static ParadeDTO GetParade(ParadeTBL parade)
        {
            if (parade == null)
                return null;
            ParadeDTO newParade = new ParadeDTO();
            newParade.id = parade.id;
            newParade.year = parade.year;
            newParade.dateStart = parade.dateStart;
            newParade.dateEnd = parade.dateEnd;
            newParade.image = parade.image;
            newParade.isActive = parade.isActive;
            return newParade;
        }
    }
}
