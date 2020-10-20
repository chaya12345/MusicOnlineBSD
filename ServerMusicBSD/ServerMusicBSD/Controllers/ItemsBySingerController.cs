using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DTO;
using BL;

namespace ServerMusicBSD.Controllers
{
    public class ItemsBySingerController : ApiController
    {
        public List<ItemsBySingerDTO> GetItemsBySinger(string singerName)
        {
            return ItemsBySingerBL.GetItemsBySinger(singerName);
        }
    }
}