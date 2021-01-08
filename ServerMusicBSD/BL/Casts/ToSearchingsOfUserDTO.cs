using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToSearchingsOfUserDTO
    {
        public static SearchingsOfUsersDTO GetSearching(SearchingsOfUsersTBL searching)
        {
            if (searching== null)
                return null;
            SearchingsOfUsersDTO newSearching = new SearchingsOfUsersDTO();
            newSearching.id = searching.id;
            newSearching.userId = searching.userId;
            newSearching.itemId = searching.itemId;
            newSearching.type = searching.type;
            newSearching.count = searching.count;
            newSearching.lastDate = searching.lastDate;
            return newSearching;
        }
        public static List<SearchingsOfUsersDTO> GetSearchings(List<SearchingsOfUsersTBL> searchings)
        {
            if (searchings == null)
                return null;
            List<SearchingsOfUsersDTO> newSearchings = new List<SearchingsOfUsersDTO>();
            foreach (SearchingsOfUsersTBL searching in searchings)
            {
                newSearchings.Add(GetSearching(searching));
            }
            return newSearchings;
        }
    }
}
