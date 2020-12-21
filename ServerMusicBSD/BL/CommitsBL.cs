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
    }
}
