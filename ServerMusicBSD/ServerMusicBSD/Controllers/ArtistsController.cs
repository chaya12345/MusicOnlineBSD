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
        public bool PostArtist([FromBody] ArtistsTBL artistsName)
        {
            return ArtistsBL.AddArtistName(artistsName);
        }
       public List<ArtistsDTO> GetArtists()
       {
            return ArtistsBL.GetArtistsNames();
       }
        [HttpPut]
       public void UpdateArtist(ArtistsTBL artist)
        {
            ArtistsBL.UpdateArtist(artist);
        }
        public bool DeleteArtist(int artistId)
        {
            return ArtistsBL.DeleteArtist(artistId);
        }
    }
}