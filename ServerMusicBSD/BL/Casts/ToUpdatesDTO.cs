using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;

namespace BL.Casts
{
    public class ToUpdatesDTO
    {
        public static UpdatesDTO GetUpdate(UpdatesTBL update)
        {
            UpdatesDTO newUpdate = new UpdatesDTO();
            newUpdate.id = update.id;
            newUpdate.title = update.title;
            newUpdate.message = update.message;
            newUpdate.status = update.status;
            return newUpdate;
        }
        public static List<UpdatesDTO> GetUpdates(List<UpdatesTBL> updates)
        {
            List<UpdatesDTO> list = new List<UpdatesDTO>();
            foreach (UpdatesTBL item in updates)
            {
                list.Add(GetUpdate(item));
            }
            return list;
        }
    }
}
