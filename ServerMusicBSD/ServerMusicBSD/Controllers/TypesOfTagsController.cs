using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using DAL;
using DTO;
using BL;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class TypesOfTagsController : ApiController
    {
        public List<TypesOfTagsDTO> GetTypesOfTags()
        {
            return TypesOfTagsBL.GetTypesOfTags();
        }
        [HttpPost]
        public void AddTypesOfTag([FromBody]TypesOfTagsTBL typesOfTags)
        {
            TypesOfTagsBL.AddTypesOfTag(typesOfTags);
        }
    }
}