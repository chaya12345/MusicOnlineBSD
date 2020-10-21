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
    public class ItemsByParameterController : ApiController
    {
        public List<ItemsByParameterDTO> GetItemsBySinger(string parameter)
        {
            return ItemsByParameterBL.GetItemsByParameter(parameter);
        }
    }
}