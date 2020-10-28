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
    public class JobsBL
    {
        public static List<JobsDTO> GetJobs()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<JobTBL> list = et.JobTBL.ToList();
            if(list!=null)
            return Casts.ToJobsDTO.GetJobs(list);
            return null;
        }
        public static void AddJob(JobTBL newJob)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try {
                if (newJob != null)
                {
                    et.JobTBL.Add(newJob);
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
    }
}
