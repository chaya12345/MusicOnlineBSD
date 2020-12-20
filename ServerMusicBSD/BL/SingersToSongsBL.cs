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
    public class SingersToSongsBL
    {
        public static List<string> GetSingersToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersToSongsTBL> list = et.SingersToSongsTBL.Where(s => s.songId == songId).ToList();
            if (list == null)
                return null;
            List<string> result = new List<string>();
            foreach (SingersToSongsTBL item in list)
            {
                SingersTBL singer = et.SingersTBL.Where(s => s.id == item.singerId).FirstOrDefault();
                if (singer != null)
                    result.Add(singer.name);
            }
            return result;
        }
        public static void AddSingerToSong(SingersToSongsTBL singersToSongs)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try
            {
                if (singersToSongs != null)
                {
                    et.SingersToSongsTBL.Add(singersToSongs);
                    et.SaveChanges();
                }
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
        public static void AddSingersToSong(string[] singers, int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            foreach (string singer in singers)
            {
                SingersTBL singerTBL = et.SingersTBL.Where(s => s != null && singer != null && s.name == singer).FirstOrDefault();
                if (singer != null)
                {
                    AddSingerToSong(new SingersToSongsTBL { singerId = singerTBL.id, songId = songId });
                }
            }
        }
        public static void UpdateSingersToSong(int songId,string[] singers)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (singers == null || singers.Length == 0)
                return;
            List<SingersToSongsTBL> list = et.SingersToSongsTBL.Where(s => s.songId == songId).ToList();
            et.SingersToSongsTBL.RemoveRange(list);
            et.SaveChanges();
            AddSingersToSong(singers, songId);
        }
    }
}
