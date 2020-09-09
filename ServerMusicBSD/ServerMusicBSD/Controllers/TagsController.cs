using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DTO;
using DAL;
using BL;
using System.Web.Http.Cors;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class TagsController : ApiController
    {

        public List<TagsDTO> GetTags()
        {
            return TagsBL.GetTags();
        }
        public void PostTag([FromBody] TagsTBL tag)
        {
            TagsBL.AddTag(tag);
        }
    }
}