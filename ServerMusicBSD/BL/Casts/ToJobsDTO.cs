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
            if (job == null)
                return null;
            JobsDTO newJob = new JobsDTO();
            newJob.id = job.id;
            newJob.name = job.name;
            return newJob;
        }
        public static List<JobsDTO> GetJobs(List<JobTBL> jobs)
        {
            if (jobs == null)
                return null;
            List<JobsDTO> newJobs = new List<JobsDTO>();
            foreach (JobTBL job in jobs)
            {
                JobsDTO jobsDTO = GetJob(job);
                if (jobsDTO != null)
                    newJobs.Add(jobsDTO);
            }
            return newJobs;
        }
    }
}
