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
            if (update == null)
                return null;
            UpdatesDTO newUpdate = new UpdatesDTO();
            newUpdate.id = update.id;
            newUpdate.title = update.title;
            newUpdate.message = update.message;
            newUpdate.status = update.status;
            return newUpdate;
        }
        public static List<UpdatesDTO> GetUpdates(List<UpdatesTBL> updates)
        {
            if (updates == null)
                return null;
            List<UpdatesDTO> list = new List<UpdatesDTO>();
            foreach (UpdatesTBL item in updates)
            {
                UpdatesDTO update = GetUpdate(item);
                if (update != null)
                    list.Add(update);
            }
            return list;
        }
    }
}
