using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToResponsesToSongsDTO
    {
        public static ResponsesToSongsDTO GetResponse(ResponsesToSongsTBL response)
        {
            if (response == null)
                return null;
            ResponsesToSongsDTO newResponses = new ResponsesToSongsDTO();
            newResponses.id = response.id;
            newResponses.songId = response.songId;
            newResponses.name = response.name;
            newResponses.title = response.title;
            newResponses.content = response.content;
            newResponses.date = response.date;
            return newResponses;
        }
        public static List<ResponsesToSongsDTO> GetResponses(List<ResponsesToSongsTBL> responses)
        {
            if (responses == null)
                return null;
            List<ResponsesToSongsDTO> newResponses = new List<ResponsesToSongsDTO>();
            foreach (ResponsesToSongsTBL res in responses)
            {
                ResponsesToSongsDTO responsesToSongsDTO = GetResponse(res);
                if(responsesToSongsDTO!=null)
                newResponses.Add(responsesToSongsDTO);
            }
            return newResponses;
        }
    }
}
