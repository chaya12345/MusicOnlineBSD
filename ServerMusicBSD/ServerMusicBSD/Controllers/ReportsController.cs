using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;
using BL;
using DTO;

namespace ServerMusicBSD.Controllers
{
    public class ReportsController : ApiController
    {
        MusicOnlineEntities et = new MusicOnlineEntities();
        public void PostReport([FromBody] ReportsTBL report)
        {
            ReportsBL.addReport(report);
        }
        public List<ReportsDTO> GetReports()
        {
            return ReportsBL.GetReports();
        }
        public ReportsDTO GetReportById(int reportId)
        {
            return ReportsBL.GetReportById(reportId);
        }
        public void PutReportStatus(int id,string status)
        {
            ReportsBL.ChangeReportStatus(id, status);
        }
        public List<ReportsDTO> GetAllUntreatedReports()
        {
            return ReportsBL.GetAllUntreatedReports();
        }
    }
}