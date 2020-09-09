using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class ReportsBL
    {
        static MusicOnlineEntities et = new MusicOnlineEntities();
        
        public static void addReport(ReportsTBL report)
        {
            et.ReportsTBL.Add(report);
            et.SaveChanges();
        }
        public static List<ReportsDTO> GetReports()
        {
            return Casts.ToReportsDTO.GetReports(et.ReportsTBL.ToList());
        }
        public static ReportsDTO GetReportById(int reportId)
        {
            return Casts.ToReportsDTO.GetReport(et.ReportsTBL.Where(r => r.id == reportId).FirstOrDefault());
        }
        public static void ChangeReportStatus(int reportId, string status)
        {
            ReportsTBL report = et.ReportsTBL.Where(r => r.id == reportId).FirstOrDefault();
            report.status = status;
            et.SaveChanges();
        }
        public static List<ReportsDTO> GetAllUntreatedReports()
        {
            return Casts.ToReportsDTO.GetReports(et.ReportsTBL.Where(r => r.status != "טופל").ToList());
        }
    }
}
