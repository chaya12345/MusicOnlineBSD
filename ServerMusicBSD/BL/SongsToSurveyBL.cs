using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class SongsToSurveyBL
    {
        public static List<songsDetails> GetSongsInSurvey()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SongsToSurveyTBL> list = et.SongsToSurveyTBL.ToList();
            List<songsDetails> songs = SongsBL.GetSongsIncludePerformances();
            List<songsDetails> result = new List<songsDetails>();
            if (list == null || songs == null)
                return null;
            foreach (SongsToSurveyTBL item in list)
            {
                songsDetails songsDetails = songs.Where(s => s != null && s.id == item.songId).FirstOrDefault();
                if (songsDetails != null)
                    result.Add(songsDetails);
            }
            return result != null ? result : null;
        }
        public static void AddVotingToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsToSurveyTBL survey = et.SongsToSurveyTBL.Where(s => s != null && s.songId == songId).FirstOrDefault();
            if (survey != null)
            {
                if (survey.count == null)
                    survey.count = 1;
                else survey.count++;
                et.SaveChanges();
            }
        }
        public static void AddVotingToSongs(SongsTBL[] selectoinSongs)
        {
            if (selectoinSongs != null)
            {
                foreach (SongsTBL item in selectoinSongs)
                {
                    AddVotingToSong(item.id);
                }
            }
        }
        public static void AddSongToSurvey(SongsToSurveyTBL survey)
        {
            if (survey != null)
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                et.SongsToSurveyTBL.Add(survey);
                et.SaveChanges();
            }
        }
        public static void AddSongsToSurvey(List<SongsToSurveyTBL> surveys)
        {
            if (surveys == null)
                return;
            foreach (SongsToSurveyTBL item in surveys)
            {
                if (item != null)
                    AddSongToSurvey(item);
            }
        }
        public static void DeleteSongFromSurvey(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsToSurveyTBL songToSurvey = et.SongsToSurveyTBL.Where(survey => survey.songId == songId).FirstOrDefault();
            et.SongsToSurveyTBL.Remove(songToSurvey);
            et.SaveChanges();
        }
    }
}
