using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using DTO;

namespace ServerMusicBSD.Controllers
{
    public class SingersController : ApiController
    {
        public static List<string> GetSingers()
        {
            return SingersBL.GetSingers();
        }
        public static void PostSinger([FromBody] string name)
        {
            SingersBL.AddSinger(name);
        }
    }
}