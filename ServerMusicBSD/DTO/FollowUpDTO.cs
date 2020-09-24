using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class FollowUpDTO
    {
        public int id { get; set; }
        public Nullable<int> userId { get; set; }
        public string mail { get; set; }
        public Nullable<int> songId { get; set; }
        public Nullable<int> articleId { get; set; }
    }
}
