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
        public static LastestCommitsDTO GetLastRespons(latestResponses lastRespons)
        {
            if (lastRespons == null)
                return null;
            LastestCommitsDTO newRespons = new LastestCommitsDTO();
            newRespons.id = lastRespons.id;
            newRespons.name = lastRespons.name;
            newRespons.date = lastRespons.date;
            newRespons.topic = lastRespons.topic;
            newRespons.type = lastRespons.type;
            newRespons.topicId = lastRespons.topicId;
            newRespons.title_res = lastRespons.title_res;
            newRespons.content_res = lastRespons.content_res;
            newRespons.tested = lastRespons.tested;
            return newRespons;
        }
        public static List<LastestCommitsDTO> GetLastCommits(List<latestResponses> lastCommits)
        {
            if (lastCommits == null)
                return null;
            List<LastestCommitsDTO> list = new List<LastestCommitsDTO>();
            foreach (latestResponses item in lastCommits)
            {
                LastestCommitsDTO lastesResponsDTO = GetLastRespons(item);
                if (lastesResponsDTO != null)
                    list.Add(lastesResponsDTO);
            }
            return list;
        }
    }
}
