using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToJobsDTO
    {
        public static JobsDTO GetJob (JobTBL job)
        {
            JobsDTO newJob = new JobsDTO();
            newJob.id = job.id;
            newJob.name = job.name;
            return newJob;
        }
        public static List<JobsDTO> GetJobs(List<JobTBL> jobs)
        {
            List<JobsDTO> newJobs = new List<JobsDTO>();
            foreach (JobTBL job in jobs)
            {
                newJobs.Add(GetJob(job));
            }
            return newJobs;
        }
    }
}
