using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;

namespace BL.Casts
{
    public class ToUpdatingsToUserDTO
    {
        public static UpdatingsToUserDTO GetUpdatingToUser(UpdatingsToUser_Result updatingToUser)
        {
            if (updatingToUser == null)
                return null;
            UpdatingsToUserDTO newUpdatingToUser = new UpdatingsToUserDTO();
            newUpdatingToUser.id = (int)updatingToUser.id;
            newUpdatingToUser.title = updatingToUser.title;
            newUpdatingToUser.image = updatingToUser.image;
            newUpdatingToUser.date = updatingToUser.date;
            newUpdatingToUser.count_like = updatingToUser.count_like;
            newUpdatingToUser.count_views = updatingToUser.count_views;
            newUpdatingToUser.type = updatingToUser.type;
            newUpdatingToUser.isPinned = updatingToUser.isPinned;
            return newUpdatingToUser;
        }
        public static List<UpdatingsToUserDTO> GetUpdatingsToUser(List<UpdatingsToUser_Result> updatingsToUser)
        {
            if (updatingsToUser == null)
                return null;
            List<UpdatingsToUserDTO> newUpdatingsToUser = new List<UpdatingsToUserDTO>();
            foreach (UpdatingsToUser_Result updating in updatingsToUser)
            {
                newUpdatingsToUser.Add(GetUpdatingToUser(updating));
            }
            return newUpdatingsToUser;
        }
    }
}
