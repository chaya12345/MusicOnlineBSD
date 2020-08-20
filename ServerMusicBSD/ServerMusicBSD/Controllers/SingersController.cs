using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using DTO;
using DAL;

namespace ServerMusicBSD.Controllers
{
    public class SingersController : ApiController
    {
        public List<SingersDTO> GetSingers()
        {
            return SingersBL.GetSingers();
        }
        public void PostSinger([FromBody]SingersTBL name)
        {
            SingersBL.AddSinger(name);
        }
    }
}