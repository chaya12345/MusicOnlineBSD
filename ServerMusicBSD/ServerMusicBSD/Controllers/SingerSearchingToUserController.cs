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
    public class SingerSearchingToUserController : ApiController
    {
        public  List<SingerSearchingToUserDTO> GetAllSingerSearching()
        {
            return SingerSearchingToUserBL.GetAllSingerSearching();
        }
        public  List<SingerSearchingToUserDTO> GetSingerSearchingToUser(int userId)
        {
            return SingerSearchingToUserBL.GetSingerSearchingToUser(userId);
        }
        public void PutSingerSearchingToUser(int userId, int singerId)
        {
            SingerSearchingToUserBL.AddSingerSearchingToUser(userId, singerId);
        }
        public  SingerSearchingToUserDTO GetLastSearchingToUser(int userId)
        {
            return SingerSearchingToUserBL.GetLastSearchingToUser(userId);
        }
    }
}