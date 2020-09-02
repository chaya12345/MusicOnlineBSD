using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToSearchingToSingerDTO
    {
        public static SearchingToSingerDTO
            GetSearchingToSinger(SearchingToSingerTBL searching)
        {
            SearchingToSingerDTO newSearching = new SearchingToSingerDTO();
            newSearching.id = searching.id;
            newSearching.singerId = searching.singerId;
            newSearching.count_searching = searching.count_searching;
            return newSearching;
        }
        public static List<SearchingToSingerDTO>
            GetsearchingToSingers(List<SearchingToSingerTBL> searchings)
        {
            List<SearchingToSingerDTO> newSearchings = new List<SearchingToSingerDTO>();
            foreach (SearchingToSingerTBL searching in searchings)
            {
                newSearchings.Add(GetSearchingToSinger(searching));
            }
            return newSearchings;
        }
    }
}
