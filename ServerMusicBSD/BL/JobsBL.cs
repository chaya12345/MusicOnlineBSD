using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class JobsBL
    {
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static List<JobsDTO> GetJobs()
        {
           return Casts.ToJobsDTO.GetJobs(et.JobTBLs.ToList());
        }
        public static void AddJob(JobTBL newJob)
        {
            et.JobTBLs.Add(newJob);
            et.SaveChanges();
        }
    }
}
