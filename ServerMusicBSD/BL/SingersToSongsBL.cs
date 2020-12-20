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
        public static void UpdateSingersToSong(int songId, List<SingersTBL> singers)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersToSongsTBL> existSingers = et.SingersToSongsTBL
                .Where(sts => sts != null && sts.songId == songId).ToList();
            List<SingersTBL> existAndSelected = new List<SingersTBL>();
            if (existSingers != null)
            {
                foreach (SingersToSongsTBL item in existSingers)
                {
                    SingersTBL so = singers.Where(s => s != null && s.id == item.songId).FirstOrDefault();
                    if (so == null)
                    {
                        DeleteSingerFromSong(songId, item.singerId);
                    }
                    else
                    {
                        existAndSelected.Add(so);
                    }
                }
            }
            foreach (SingersTBL sin in singers)
            {
                if (sin != null && existAndSelected.Where(s => s.id == sin.id).FirstOrDefault() == null)
                {
                    AddSingerToSong(new SingersToSongsTBL() { singerId = sin.id, songId = songId });
                }
            }
        }
        public static void DeleteSingerFromSong(int? songId, int? singerId)
        {
            if (singerId != null && songId != null)
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                SingersToSongsTBL result = et.SingersToSongsTBL
                    .Where(sts => sts.songId == songId && sts.singerId == singerId).FirstOrDefault();
                if (result != null)
                {
                    et.SingersToSongsTBL.Remove(result);
                    et.SaveChanges();
                }
            }
        }
    }
}
