using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToSingerSearchingToUserDTO
    {
        public static SingerSearchingToUserDTO
            GetSearchingToUser(SingerSearchingToUserTBL searching)
        {
            SingerSearchingToUserDTO newSearching = new SingerSearchingToUserDTO();
            newSearching.id = searching.id;
            newSearching.userId = searching.userId;
            newSearching.singerId = searching.singerId;
            newSearching.count_searching = searching.count_searching;
            newSearching.last_date = searching.last_date;
            return newSearching;
        }
        public static List<SingerSearchingToUserDTO>
            GetSearchingsToUser(List<SingerSearchingToUserTBL> searchings)
        {
            List<SingerSearchingToUserDTO> newSearchings = new List<SingerSearchingToUserDTO>();
            foreach (SingerSearchingToUserTBL searching in searchings)
            {
                newSearchings.Add(GetSearchingToUser(searching));
            }
            return newSearchings;
        }
    }
}
