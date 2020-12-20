using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToReportsDTO
    {
        public static ReportsDTO GetReport(ReportsTBL report)
        {
            if (report == null)
                return null;
            ReportsDTO newReport = new ReportsDTO();
            newReport.id = report.id;
            newReport.name = report.name;
            newReport.mail = report.mail;
            newReport.phone = report.phone;
            newReport.songId = report.songId;
            newReport.message = report.message;
            newReport.status = report.status;
            newReport.date = report.date;
            return newReport;
        }
        public static List<ReportsDTO> GetReports(List<ReportsTBL> reports)
        {
            if (reports == null)
                return null;
            List<ReportsDTO> newReports = new List<ReportsDTO>();
            foreach (ReportsTBL rep in reports)
            {
                ReportsDTO reportsDTO = GetReport(rep);
                if(reportsDTO!=null)
                newReports.Add(reportsDTO);
            }
            return newReports;
        }
    }
}
