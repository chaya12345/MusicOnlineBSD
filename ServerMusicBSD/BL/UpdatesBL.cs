using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class UpdatesBL
    {
        public static List<UpdatesDTO> GetUpdates()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<UpdatesTBL> list = et.UpdatesTBL.ToList();
            if (list != null)
                return Casts.ToUpdatesDTO.GetUpdates(list);
            return null;
        }
        public static UpdatesDTO GetUpdate(int updateId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            UpdatesTBL update = et.UpdatesTBL.Where(u =>u!=null&& u.id == updateId).FirstOrDefault();
            if (update != null)
                return Casts.ToUpdatesDTO.GetUpdate(update);
            return null;
        }
        public static void AddUpdate(UpdatesTBL update)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (update != null)
            {
                et.UpdatesTBL.Add(update);
                et.SaveChanges();
            }
        }
        public static void DeleteUpdate(int updateId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            UpdatesTBL update = et.UpdatesTBL.Where(u =>u!=null&& u.id == updateId).FirstOrDefault();
            if (update != null)
            {
                et.UpdatesTBL.Remove(update);
                et.SaveChanges();
            }
        }
        public static List<UpdatesDTO> GetInProcessUpdates()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToUpdatesDTO.GetUpdates(et.UpdatesTBL.Where(u=>u!=null&&u.status!="טופל").ToList());
        }
    }
}
