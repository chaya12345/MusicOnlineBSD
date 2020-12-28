using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BL
{
    public class CommitsBL
    {
        public static List<Commits> GetCommits()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.Commits.ToList();
        }
        public static Commits GetCommitById(int commitId,string type)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (type == null)
                return null;
            return et.Commits.Where(c => c.type == type && c.id == commitId).FirstOrDefault();
        }
    }
}
