using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using DAL;
using BL;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class CommitsController : ApiController
    {
        public List<Commits> GetCommits()
        {
            return CommitsBL.GetCommits();
        }
        public Commits GetCommitById(int commitId, string type)
        {
            return CommitsBL.GetCommitById(commitId, type);
        }
    }
}