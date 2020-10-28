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
        public static List<SongsDTO> GetSongsInSurvey()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SurveyTBL> list = et.SurveyTBL.ToList();
            List<SongsDTO> songs = SongsBL.GetSongs();
            List<SongsDTO> result = new List<SongsDTO>();
            if (list == null|| songs==null)
                return null;
            foreach (SurveyTBL item in list)
            {
                SongsDTO songsDTO = songs.Where(s => s != null && s.id == item.songId).FirstOrDefault();
                if (songsDTO != null)
                    result.Add(songsDTO);
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
