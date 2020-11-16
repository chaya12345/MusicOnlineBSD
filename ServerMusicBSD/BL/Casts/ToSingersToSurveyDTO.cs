using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToSingersToSurveyDTO
    {
        public static SingersToSurveyDTO GetSurvey(SingersToSurveyTBL survey)
        {
            if (survey == null)
                return null;
            SingersToSurveyDTO newSurvey = new SingersToSurveyDTO();
            newSurvey.id = survey.id;
            newSurvey.singerId = survey.singerId;
            newSurvey.count = survey.count;
            return newSurvey;
        }
        public static List<SingersToSurveyDTO> GetSurveys(List<SingersToSurveyTBL> surveys)
        {
            if (surveys == null)
                return null;
            List<SingersToSurveyDTO> list = new List<SingersToSurveyDTO>();
            foreach (SingersToSurveyTBL item in surveys)
            {
                SingersToSurveyDTO survey = GetSurvey(item);
                if (survey != null)
                    list.Add(survey);
            }
            return list != null ? list : null;
        }
    }
}
