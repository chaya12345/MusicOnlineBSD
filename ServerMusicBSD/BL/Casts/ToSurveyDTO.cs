using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToSurveyDTO
    {
        public static SurveyDTO GetSurvey(SurveyTBL survey)
        {
            if (survey == null)
                return null;
            SurveyDTO newSurvey = new SurveyDTO();
            newSurvey.id = survey.id;
            newSurvey.songId = survey.songId;
            newSurvey.count = survey.count;
            return newSurvey;
        }
        public static List<SurveyDTO> GetSurveys(List<SurveyTBL> surveys)
        {
            if (surveys == null)
                return null;
            List<SurveyDTO> list = new List<SurveyDTO>();
            foreach (SurveyTBL item in surveys)
            {
                SurveyDTO survey = GetSurvey(item);
                if (survey != null)
                    list.Add(survey);
            }
            return list != null ? list : null;
        }
    }
}
