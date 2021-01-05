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
    public class ReportsController : ApiController
    {
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
        public bool PutReportStatus(int reportId, int status)
        {
            return ReportsBL.ChangeReportStatus(reportId, status);
        }
        public List<ReportsDTO> GetAllUntreatedReports()
        {
            return ReportsBL.GetAllUntreatedReports();
        }
        public static void ChangeReportStatus(int reportId)
        {
            ReportsBL.ChangeReportStatus(reportId);
        }
        public List<reportView> GetReportsView()
        {
            return ReportsBL.GetReportsView();
        }
    }
}