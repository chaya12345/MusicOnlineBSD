using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToSongsToSurveyDTO
    {
        public static SongsToSurveyDTO GetSurvey(SongsToSurveyTBL survey)
        {
            if (survey == null)
                return null;
            SongsToSurveyDTO newSurvey = new SongsToSurveyDTO();
            newSurvey.id = survey.id;
            newSurvey.songId = survey.songId;
            newSurvey.count = survey.count;
            return newSurvey;
        }
        public static List<SongsToSurveyDTO> GetSurveys(List<SongsToSurveyTBL> surveys)
        {
            if (surveys == null)
                return null;
            List<SongsToSurveyDTO> list = new List<SongsToSurveyDTO>();
            foreach (SongsToSurveyTBL item in surveys)
            {
                SongsToSurveyDTO survey = GetSurvey(item);
                if (survey != null)
                    list.Add(survey);
            }
            return list != null ? list : null;
        }
    }
}
