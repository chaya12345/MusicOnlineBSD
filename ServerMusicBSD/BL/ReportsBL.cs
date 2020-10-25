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
    enum eProccessing { NOT_PROCESSED = 1, IN_PROCESS, HAS_BEEN_PROCESSED }
    public class ReportsBL
    {        
        public static void addReport(ReportsTBL report)
        {
            int proc = (int)eProccessing.NOT_PROCESSED;
            MusicOnlineEntities et = new MusicOnlineEntities();
            try {
                report.status = proc;
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
        public static void ChangeReportStatus(int reportId, bool status)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ReportsTBL report = et.ReportsTBL.Where(r => r.id == reportId).FirstOrDefault();
            report.status = status == true ? report.status = (int)eProccessing.HAS_BEEN_PROCESSED : (int)eProccessing.NOT_PROCESSED;
            et.SaveChanges();
        }
        public static List<ReportsDTO> GetAllUntreatedReports()
        {
            int proc = (int)eProccessing.HAS_BEEN_PROCESSED;
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToReportsDTO.GetReports(et.ReportsTBL.Where(r => r.status != proc).ToList());
        }
        public static void ChangeReportStatus(int reportId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ReportsTBL report = et.ReportsTBL.Where(r => r.id == reportId).FirstOrDefault();
            report.status =(int)eProccessing.IN_PROCESS;
            et.SaveChanges();
        }
    }
}
