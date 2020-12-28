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
        public void PostCommit([FromBody]CommitsToSongsTBL commit)
        {
            commit.date = DateTime.Now;
            commit.tested = false;
            CommitsToSongsBL.AddResponse(commit);
        }
        public List<CommitsToSongsDTO> GetSongCommits(int songId)
        {
            return CommitsToSongsBL.GetSongCommits(songId);
        }
        public int GetCountCommitsToSong(int songId)
        {
            return CommitsToSongsBL.GetCountCommitsToSong(songId);
        }
        public bool DeleteCommit(int commitId)
        {
            return CommitsToSongsBL.DeleteResponse(commitId);
        }
        public List<CommitsToSongsDTO> GetLastCommits()
        {
            return CommitsToSongsBL.GetLastCommits();
        }
        [HttpPut]
        public bool UpdateIsTested(int commitId, bool isTested)
        {
            return CommitsToSongsBL.UpdateIsTested(commitId, isTested);
        }
    }
}