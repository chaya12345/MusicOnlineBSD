using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;

namespace ServerMusicBSD.Controllers
{
    public class ReportsController : ApiController
    {
        MusicOnlineEntities et = new MusicOnlineEntities();
        public void PostReport([FromBody] ReportsTBL report)
        {
            et.ReportsTBL.Add(report);
            et.SaveChanges();
        }
    }
}