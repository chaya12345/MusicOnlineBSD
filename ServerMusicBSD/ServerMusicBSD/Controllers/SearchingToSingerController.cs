using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;
using DTO;
using BL;
using System.Web.Http.Cors;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class SearchingToSingerController : ApiController
    {
        public  List<SearchingToSingerDTO> GetAllSearching()
        {
            return SearchingToSingerBL.GetAllSearching();
        }
        public  long? GetCountOfSearchingToSinger(int singerId)
        {
            return SearchingToSingerBL.GetCountOfSearchingToSinger(singerId);
        }
        public  void PostSearchingToSinger(int singerId)
        {
            SearchingToSingerBL.AddSearchingToSinger(singerId);
        }
        public  void PutSearchingToSinger(int singerId)
        {
            SearchingToSingerBL.UpdateSearchingToSinger(singerId);
        }
        public List<SingersDTO> GetPopularSingers()
        {
            return SearchingToSingerBL.GetPopularSingers();
        }
    }
}