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
    public class ArtistsToSongsController : ApiController
    {
        public List<ArtistsToSongsDTO> GetArtistsToSong(int songId)
        {
            return ArtistsToSongsBL.GetArtistsToSong(songId);
        }
        public  List<ArtistsToSongsDTO> GetSongsToArtist(int artistId)
        {
            return ArtistsToSongsBL.GetSongsToArtist(artistId);
        }
        public  void PostArtistToSong([FromBody] ArtistsToSongsTBL artistToSong)
        {
            ArtistsToSongsBL.AddArtistToSong(artistToSong);
        }
    }
}