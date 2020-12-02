using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BL
{
    public class LastViewsBL
    {
        public static List<lastViews> GetLastViews()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.lastViews.ToList();
        }
    }
}
