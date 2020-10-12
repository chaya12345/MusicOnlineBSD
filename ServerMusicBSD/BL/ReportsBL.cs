using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class ReportsBL
    {        
        public static void addReport(ReportsTBL report)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try {
                report.status = "לא טופל";
                et.ReportsTBL.Add(report);
                et.SaveChanges();
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
        }
        public static List<ReportsDTO> GetReports()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToReportsDTO.GetReports(et.ReportsTBL.ToList());
        }
        public static ReportsDTO GetReportById(int reportId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToReportsDTO.GetReport(et.ReportsTBL.Where(r => r.id == reportId).FirstOrDefault());
        }
        public static void ChangeReportStatus(int reportId, string status)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ReportsTBL report = et.ReportsTBL.Where(r => r.id == reportId).FirstOrDefault();
            report.status = status;
            et.SaveChanges();
        }
        public static List<ReportsDTO> GetAllUntreatedReports()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToReportsDTO.GetReports(et.ReportsTBL.Where(r => r.status != "טופל").ToList());
        }
    }
}
