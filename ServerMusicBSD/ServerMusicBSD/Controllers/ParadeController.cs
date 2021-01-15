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
using System.Web;
using System.IO;

namespace ServerMusicBSD.Controllers
{
    public class ParadeObj
    {
        public ParadeTBL parade { get; set; }
        public string[] songs { get; set; }
        public string[] singers { get; set; }
    }
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ParadeController : ApiController
    {
        public ParadeDTO GetLastParade()
        {
            return ParadeBL.GetLastParade();
        }
        public ParadeDTO GetParadeByYear(string year)
        {
            return ParadeBL.GetParadeByYear(year);
        }
        public bool PostParade([FromBody] ParadeObj paradeObj)
        {
            bool flag = true;
            if (ParadeBL.AddParade(paradeObj.parade))
            {
                ParadeDTO parade = ParadeBL.GetLastParade();
                if (SingersToParadeBL.AddSingersToParade(paradeObj.singers, parade.id) == false)
                    flag = false;
                if (SongsToParadeBL.AddSongsToParade(paradeObj.songs, parade.id) == false)
                    flag = false;
            }
            return flag;
        }
        public void PutFinishedParade()
        {
            ParadeBL.FinishedParade();
        }
        [HttpPut]
        public void RestartParade()
        {
            ParadeBL.RestartParade();
        }
    }
}