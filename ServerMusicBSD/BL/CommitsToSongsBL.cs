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
    public class CommitsToSongsBL
    {
        public static void AddResponse(CommitsToSongsTBL response)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (response == null)
                return;
            if (response.content == "") {
                response.content = null;
            }
            try
            {
                et.CommitsToSongsTBL.Add(response);
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
        public static List<CommitsToSongsDTO> GetSongCommits(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<CommitsToSongsTBL> list = et.CommitsToSongsTBL.Where(r => r != null && r.songId == songId).ToList();
            if (list != null)
                return Casts.ToCommitsToSongsDTO.GetCommits(list);
            return null;
        }
        public static int GetCountCommitsToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.CommitsToSongsTBL.Count(res => res!=null&& res.songId == songId);
        }
        public static void DeleteResponse(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            CommitsToSongsTBL response = et.CommitsToSongsTBL.Where(r =>r!=null&& r.id == songId).FirstOrDefault();
            if (response != null)
            {
                et.CommitsToSongsTBL.Remove(response);
                et.SaveChanges();
            }
        }
        public static List<CommitsToSongsDTO> GetLastCommits()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<CommitsToSongsTBL> list = et.CommitsToSongsTBL.Where(r =>r!=null&& r.date != null).OrderBy(r => r.date).Distinct().ToList();
            if (list != null)
                return Casts.ToCommitsToSongsDTO.GetCommits(list);
            return null;
        }
        public static bool UpdateIsTested(int commitId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            CommitsToSongsTBL commit = et.CommitsToSongsTBL.Where(c => c != null && c.id == commitId).FirstOrDefault();
            if (commit != null)
            {
                commit.tested = true;
                et.SaveChanges();
                return true;
            }
            return false;
        }
    }
}
