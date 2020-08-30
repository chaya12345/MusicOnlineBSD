using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;
using DTO;
using BL;

namespace ServerMusicBSD.Controllers
{
    public class ArtistsNamesController : ApiController
    {
       public void PostArtistName([FromBody] ArtistsNameTBL artistsName)
       {
            ArtistsNamesBL.AddArtistName(artistsName);
       }
       public List<ArtistsNamesDTO> GetArtistsNames()
       {
            return ArtistsNamesBL.GetArtistsNames();
       }


    }
}