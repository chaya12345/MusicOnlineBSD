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
        public static List<JobsDTO> GetJobs()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToJobsDTO.GetJobs(et.JobTBL.ToList());
        }
        public static void AddJob(JobTBL newJob)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            et.JobTBL.Add(newJob);
            et.SaveChanges();
        }
    }
}
