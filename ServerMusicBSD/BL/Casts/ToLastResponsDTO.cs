using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToLastResponsDTO
    {
        public static LastResponsDTO GetLastRespons(latestResponses lastRespons)
        {
            LastResponsDTO newRespons = new LastResponsDTO();
            newRespons.id = lastRespons.id;
            newRespons.name = lastRespons.name;
            newRespons.date = lastRespons.date;
            newRespons.topic = lastRespons.topic;
            newRespons.type = lastRespons.type;
            newRespons.topicId = lastRespons.topicId;
            return newRespons;
        }
        public static List<LastResponsDTO> GetLastResponses(List<latestResponses> lastResponses)
        {
            List<LastResponsDTO> list = new List<LastResponsDTO>();
            foreach (latestResponses item in lastResponses)
            {
                list.Add(GetLastRespons(item));
            }
            return list;
        }
    }
}
