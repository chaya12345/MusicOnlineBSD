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
    public class CommitsToSongsController : ApiController
    {
        public void PostCommit([FromBody]CommitsToSongsTBL response)
        {
            response.date = DateTime.Now;
            CommitsToSongsBL.AddResponse(response);
        }
        public List<CommitsToSongsDTO> GetSongCommits(int songId)
        {
            return CommitsToSongsBL.GetSongCommits(songId);
        }
        public int GetCountCommitsToSong(int songId)
        {
            return CommitsToSongsBL.GetCountCommitsToSong(songId);
        }
        public void DeleteCommit(int responseId)
        {
            CommitsToSongsBL.DeleteResponse(responseId);
        }
        public List<CommitsToSongsDTO> GetLastCommits()
        {
            return CommitsToSongsBL.GetLastCommits();
        }
    }
}