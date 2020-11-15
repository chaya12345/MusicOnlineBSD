using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class SingersToSurveyBL
    {
        public static List<SingersDTO> GetSingersInSurvey()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersToSurveyTBL> list = et.SingersToSurveyTBL.ToList();
            List<SingersDTO> singers = SingersBL.GetSingers();
            List<SingersDTO> result = new List<SingersDTO>();
            if (list == null || singers == null)
                return null;
            foreach (SingersToSurveyTBL item in list)
            {
                SingersDTO relevantsinger = singers.Where(s => s != null && s.id == item.singerId).FirstOrDefault();
                if (relevantsinger != null)
                    result.Add(relevantsinger);
            }
            return result != null ? result : null;
        }
        public static void AddVotingToSinger(int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingersToSurveyTBL survey = et.SingersToSurveyTBL.Where(s => s != null && s.singerId == singerId).FirstOrDefault();
            if (survey != null)
            {
                if (survey.count == null)
                    survey.count = 1;
                else survey.count++;
                et.SaveChanges();
            }
        }
        public static void AddVotingToSingers(SingersTBL[] selectoinSingers)
        {
            if (selectoinSingers != null)
            {
                foreach (SingersTBL item in selectoinSingers)
                {
                    AddVotingToSinger(item.id);
                }
            }
        }
        public static void AddSingerToSurvey(SingersToSurveyTBL survey)
        {
            if (survey != null)
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                et.SingersToSurveyTBL.Add(survey);
                et.SaveChanges();
            }
        }
        public static void AddSingersToSurvey(List<SingersToSurveyTBL> surveys)
        {
            if (surveys == null)
                return;
            foreach (SingersToSurveyTBL item in surveys)
            {
                if (item != null)
                    AddSingerToSurvey(item);
            }
        }
        public static void DeleteSingerFromSurvey(int singerId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingersToSurveyTBL singerToSurvey = et.SingersToSurveyTBL.Where(survey => survey.singerId == singerId).FirstOrDefault();
            et.SingersToSurveyTBL.Remove(singerToSurvey);
            et.SaveChanges();
        }
    }
}
