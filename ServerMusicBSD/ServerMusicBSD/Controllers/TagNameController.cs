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
    public class TagNameController : ApiController
    {

        public List<TagNameDTO> GetTagNames()
        {
            return TagNameBL.GetTagNames();
        }
        public void PostTag([FromBody] TagNameTBL tag)
        {
            TagNameBL.AddTagName(tag);
        }
    }
}