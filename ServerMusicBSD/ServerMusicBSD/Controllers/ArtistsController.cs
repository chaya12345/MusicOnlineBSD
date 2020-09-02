using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;
using DTO;
using BL;
using System.Web.Http.Cors;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ArtistsController : ApiController
    {
       public void PostArtistName([FromBody] ArtistsTBL artistsName)
       {
            ArtistsBL.AddArtistName(artistsName);
       }
       public List<ArtistsDTO> GetArtistsNames()
       {
            return ArtistsBL.GetArtistsNames();
       }


    }
}