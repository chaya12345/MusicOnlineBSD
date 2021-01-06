using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;
using BL;
using DTO;
using System.Web.Http.Cors;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ParadeController : ApiController
    {
        public ParadeTBL GetLastParade()
        {
            return ParadeBL.GetLastParade();
        }
        public ParadeDTO GetParadeByYear(string year)
        {
            return ParadeBL.GetParadeByYear(year);
        }
        public bool PostParade([FromBody] ParadeTBL parade)
        {
            return ParadeBL.AddParade(parade);
        }
        public void PutFinishedParade()
        {
            ParadeBL.FinishedParade();
        }
    }
}