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
                if (report != null)
                {
                    report.status = proc;
                    report.date = DateTime.Now;
                    et.ReportsTBL.Add(report);
                    et.SaveChanges();
                }
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
            List<ReportsTBL> list = et.ReportsTBL.ToList();
            if (list != null)
                return Casts.ToReportsDTO.GetReports(list);
            return null;
        }
        public static ReportsDTO GetReportById(int reportId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ReportsTBL report = et.ReportsTBL.Where(r => r.id == reportId).FirstOrDefault();
            if(report!=null)
            return Casts.ToReportsDTO.GetReport(report);
            return null;
        }
        public static void ChangeReportStatus(int reportId, int status)
        {
            if (status < 1 || status > 3)
                return;
            MusicOnlineEntities et = new MusicOnlineEntities();
            ReportsTBL report = et.ReportsTBL.Where(r =>r!=null&& r.id == reportId).FirstOrDefault();
            if (report == null)
                return;
            report.status = status;
            et.SaveChanges();
        }
        public static List<ReportsDTO> GetAllUntreatedReports()
        {
            int proc = (int)eProccessing.HAS_BEEN_PROCESSED;
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ReportsTBL> list = et.ReportsTBL.Where(r => r != null && r.status != proc).ToList();
            if (list != null)
                return Casts.ToReportsDTO.GetReports(list);
            return null;
        }
        public static void ChangeReportStatus(int reportId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ReportsTBL report = et.ReportsTBL.Where(r =>r!=null&& r.id == reportId).FirstOrDefault();
            if (report != null)
                return;
            report.status = (int)eProccessing.IN_PROCESS;
            et.SaveChanges();
        }
        public static List<reportView> GetReportsView()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.reportView.ToList();
        }
    }
}
