using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using DTO;
using DAL;
using System.Web.Http.Cors;
using System.Web;
using System.IO;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class SingersController : ApiController
    {
        public List<SingersDTO> GetSingers()
        {
            return SingersBL.GetSingers();
        }
        public SingersDTO GetSingerByName(string name)
        {
            return SingersBL.GetSingerByName(name);
        }
        public bool PostSinger([FromBody]SingersTBL singer)
        {
           return SingersBL.AddSinger(singer);
        }
        [HttpPost]
        public bool AddSinger(string name, string image)
        {
            bool result = SingersBL.AddSinger(name, image);
            var httpRequest = HttpContext.Current.Request;
            SavingFilesBL.SaveFile(httpRequest.Files[0], "images\\singers");
            return result;
        }
        public void PutSearchingToSinger(string singerName)
        {
            SingersBL.AddSearchingToSinger(singerName);
        }
        [HttpPut]
        public bool UpdateSinger([FromBody] SingersTBL singer)
        {
            return SingersBL.UpdateSinger(singer);
        }
        public bool DeleteSinger(int singerId)
        {
            return SingersBL.DeleteSinger(singerId);
        }
    }
}