using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToLastesResponsDTO
    {
        public static LastestResponsesDTO GetLastRespons(latestResponses lastRespons)
        {
            if (lastRespons == null)
                return null;
            LastestResponsesDTO newRespons = new LastestResponsesDTO();
            newRespons.id = lastRespons.id;
            newRespons.name = lastRespons.name;
            newRespons.date = lastRespons.date;
            newRespons.topic = lastRespons.topic;
            newRespons.type = lastRespons.type;
            newRespons.topicId = lastRespons.topicId;
            newRespons.title_res = lastRespons.title_res;
            newRespons.content_res = lastRespons.content_res;
            return newRespons;
        }
        public static List<LastestResponsesDTO> GetLastResponses(List<latestResponses> lastResponses)
        {
            if (lastResponses == null)
                return null;
            List<LastestResponsesDTO> list = new List<LastestResponsesDTO>();
            foreach (latestResponses item in lastResponses)
            {
                LastestResponsesDTO lastesResponsDTO = GetLastRespons(item);
                if (lastesResponsDTO != null)
                    list.Add(lastesResponsDTO);
            }
            return list;
        }
    }
}
