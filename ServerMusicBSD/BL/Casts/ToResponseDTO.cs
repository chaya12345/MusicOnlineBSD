using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToResponseDTO
    {
        public static ResponsesDTO GetResponse(ResponsesTBL response)
        {
            ResponsesDTO newResponses = new ResponsesDTO();
            newResponses.id = response.id;
            newResponses.articleId = response.articleId;
            newResponses.name = response.name;
            newResponses.title = response.title;
            newResponses.content = response.content;
            newResponses.date = response.date;
            return newResponses;
        }
        public static List<ResponsesDTO> GetResponses(List<ResponsesTBL> responses)
        {
            List<ResponsesDTO> newResponses = new List<ResponsesDTO>();
            foreach (ResponsesTBL res in responses)
            {
                newResponses.Add(GetResponse(res));
            }
            return newResponses;
        }
    }
}
