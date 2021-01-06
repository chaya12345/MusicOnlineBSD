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
        public  List<SingersDTO> GetSingerSearchingToUser(int userId)
        {
            return SingerSearchingToUserBL.GetSingerSearchingToUser(userId);
        }
        public void PutSingerSearchingToUser(int userId, string singer)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SingersTBL singerTBL = et.SingersTBL.Where(s => s.name == singer).FirstOrDefault();
            SingerSearchingToUserBL.AddSingerSearchingToUser(userId, singerTBL.id);
        }
    }
}