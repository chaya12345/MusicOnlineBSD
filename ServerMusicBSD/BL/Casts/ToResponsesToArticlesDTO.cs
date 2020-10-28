using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToResponsesToArticlesDTO
    {
        public static ResponsesToArticlesDTO GetResponse(ResponsesToArticlesTBL response)
        {
            if (response == null)
                return null;
            ResponsesToArticlesDTO newResponses = new ResponsesToArticlesDTO();
            newResponses.id = response.id;
            newResponses.articleId = response.articleId;
            newResponses.name = response.name;
            newResponses.title = response.title;
            newResponses.content = response.content;
            newResponses.date = response.date;
            return newResponses;
        }
        public static List<ResponsesToArticlesDTO> GetResponses(List<ResponsesToArticlesTBL> responses)
        {
            if (responses == null)
                return null;
            List<ResponsesToArticlesDTO> newResponses = new List<ResponsesToArticlesDTO>();
            foreach (ResponsesToArticlesTBL res in responses)
            {
                ResponsesToArticlesDTO responsesToArticlesDTO = GetResponse(res);
                if(responsesToArticlesDTO!=null)
                newResponses.Add(responsesToArticlesDTO);
            }
            return newResponses;
        }
    }
}
