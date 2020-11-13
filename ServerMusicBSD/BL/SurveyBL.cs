using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class SurveyBL
    {
        public static List<songsDetails> GetSongsInSurvey()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SurveyTBL> list = et.SurveyTBL.ToList();
            List<songsDetails> songs = SongsBL.GetSongsIncludePerformances();
            List<songsDetails> result = new List<songsDetails>();
            if (list == null|| songs==null)
                return null;
            foreach (SurveyTBL item in list)
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
            SurveyTBL survey = et.SurveyTBL.Where(s => s != null && s.songId == songId).FirstOrDefault();
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
        public static void AddSongToSurvey(SurveyTBL survey)
        {
            if (survey != null)
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                et.SurveyTBL.Add(survey);
                et.SaveChanges();
            }
        }
        public static void AddSongsToSurvey(List<SurveyTBL> surveys)
        {
            if (surveys == null)
                return;
            foreach (SurveyTBL item in surveys)
            {
                if (item != null)
                    AddSongToSurvey(item);
            }
        }
    }
}
