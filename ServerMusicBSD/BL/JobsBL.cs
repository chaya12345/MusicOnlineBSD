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
            return Casts.ToJobsDTO.GetJobs(et.JobTBL.ToList());
        }
        public static void AddJob(JobTBL newJob)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try { 
                et.JobTBL.Add(newJob);
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
    }
}
