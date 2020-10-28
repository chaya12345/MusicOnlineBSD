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
        public static LastesResponsDTO GetLastRespons(latestResponses lastRespons)
        {
            if (lastRespons == null)
                return null;
            LastesResponsDTO newRespons = new LastesResponsDTO();
            newRespons.id = lastRespons.id;
            newRespons.name = lastRespons.name;
            newRespons.date = lastRespons.date;
            newRespons.topic = lastRespons.topic;
            newRespons.type = lastRespons.type;
            newRespons.topicId = lastRespons.topicId;
            return newRespons;
        }
        public static List<LastesResponsDTO> GetLastResponses(List<latestResponses> lastResponses)
        {
            if (lastResponses == null)
                return null;
            List<LastesResponsDTO> list = new List<LastesResponsDTO>();
            foreach (latestResponses item in lastResponses)
            {
                LastesResponsDTO lastesResponsDTO = GetLastRespons(item);
                if (lastesResponsDTO != null)
                    list.Add(lastesResponsDTO);
            }
            return list;
        }
    }
}
