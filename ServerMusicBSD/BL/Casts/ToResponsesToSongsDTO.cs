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
            List<ResponsesToSongsDTO> newResponses = new List<ResponsesToSongsDTO>();
            foreach (ResponsesToSongsTBL res in responses)
            {
                newResponses.Add(GetResponse(res));
            }
            return newResponses;
        }
    }
}
