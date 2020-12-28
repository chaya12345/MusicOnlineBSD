using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using DAL;
using BL;
using DTO;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class SingersToParadeController : ApiController
    {
        public List<ItemsToParade_Result> GetSingersInParade()
        {
            return SingersToParadeBL.getSingersInParade();
        }
        public void PutVotingToSinger(int singerId)
        {
            SingersToParadeBL.AddVotingToSinger(singerId);
        }
        public void PostSingerToParade([FromBody] SingersToParadeTBL parade)
        {
            SingersToParadeBL.AddSingerToParade(parade);
        }
        public void PostSingersToParade([FromBody] List<SingersToParadeTBL> parades)
        {
            SingersToParadeBL.AddSingersToParade(parades);
        }
        public void DeleteSingerFromParade(int singerId)
        {
            SingersToParadeBL.DeleteSingerFromParade(singerId);
        }
    }
}