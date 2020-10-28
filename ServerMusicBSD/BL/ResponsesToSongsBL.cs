using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class ResponsesToSongsBL
    {
        public static void AddResponse(ResponsesToSongsTBL response)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (response == null)
                return;
            if (response.content == "") {
                response.content = null;
            }
            try
            {
                et.ResponsesToSongsTBL.Add(response);
                et.SaveChanges();
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
        }
        public static List<ResponsesToSongsDTO> GetSongResponses(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ResponsesToSongsTBL> list = et.ResponsesToSongsTBL.Where(r => r != null && r.songId == songId).ToList();
            if (list != null)
                return Casts.ToResponsesToSongsDTO.GetResponses(list);
            return null;
        }
        public static int GetCountResponsesToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.ResponsesToSongsTBL.Count(res => res!=null&& res.songId == songId);
        }
        public static void DeleteResponse(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ResponsesToSongsTBL response = et.ResponsesToSongsTBL.Where(r =>r!=null&& r.id == songId).FirstOrDefault();
            if (response != null)
            {
                et.ResponsesToSongsTBL.Remove(response);
                et.SaveChanges();
            }
        }
        public static List<ResponsesToSongsDTO> GetLastResponses()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ResponsesToSongsTBL> list = et.ResponsesToSongsTBL.Where(r =>r!=null&& r.date != null).OrderBy(r => r.date).Distinct().ToList();
            if (list != null)
                return Casts.ToResponsesToSongsDTO.GetResponses(list);
            return null;
        }
    }
}
