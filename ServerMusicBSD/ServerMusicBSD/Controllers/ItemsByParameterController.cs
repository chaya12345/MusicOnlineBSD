using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DTO;
using BL;
using System.Web.Http.Cors;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ItemsByParameterController : ApiController
    {
        public List<ItemsByParameterDTO> GetItemsByParameter(string parameter)
        {
            return ItemsByParameterBL.GetItemsByParameter(parameter);
        }
        public  ItemByNameDTO GetItemsByName(string name)
        {
            return ItemsByParameterBL.GetItemByName(name);
        }
    }
}