using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;

namespace BL
{
    public class UpdatingsToUserBL
    {
        public static List<UpdatingsToUserDTO> GetUpdatings(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToUpdatingsToUserDTO.GetUpdatingsToUser(et.UpdatingsToUser(userId).ToList());
        }
    }
}
