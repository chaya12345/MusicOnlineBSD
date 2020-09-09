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
    public class ResponsesToSongsController : ApiController
    {
        public void PostResponse(ResponsesToSongsTBL response)
        {
            response.date = DateTime.Today;
            ResponsesToSongsBL.AddResponse(response);
        }
        public List<ResponsesToSongsDTO> GetSongResponses(int songId)
        {
            return ResponsesToSongsBL.GetSongResponses(songId);
        }
        public void DeleteResponse(int responseId)
        {
            ResponsesToSongsBL.DeleteResponse(responseId);
        }
        public List<ResponsesToSongsDTO> GetLastResponses()
        {
            return ResponsesToSongsBL.GetLastResponses();
        }
    }
}