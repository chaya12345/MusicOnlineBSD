using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;
using BL;
using DTO;
using System.Web.Http.Cors;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class JobsController : ApiController
    {
        public List<JobsDTO> GetJobs()
        {
            return JobsBL.GetJobs();
        }
        public void PostJob([FromBody] JobTBL job)
        {
            JobsBL.AddJob(job);
        }
    }
}