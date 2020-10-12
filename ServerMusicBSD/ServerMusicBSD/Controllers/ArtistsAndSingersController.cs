using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using BL;
using DAL;
using DTO;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ArtistsAndSingersController : ApiController
    {
        public  List<ArtistsAndSingersDTO> GetArtistsAndSingers()
        {
            return ArtistsAndSingersBL.GetArtistsAndSingers();
        }
        public ArtistsAndSingersDTO GetArtistOrSingerByName(string name)
        {
            return ArtistsAndSingersBL.GetArtistOrSingerByName(name);
        }
    }
}