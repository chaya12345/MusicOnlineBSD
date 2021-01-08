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
    public class SearchingsOfUserController : ApiController
    {
        public List<SearchingsOfUsersDTO> GetSearchingsOfUser(int userId)
        {
            return SearchingsOfUserBL.GetSearchingsOfUser(userId);
        }
        [HttpPost]
        public bool AddSearchingsToUser(int? userId, string itemName)
        {
            return SearchingsOfUserBL.CheckIsExist(userId, itemName);
        }
    }
}