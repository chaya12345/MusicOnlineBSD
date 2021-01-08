using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class SearchingsOfUsersDTO
    {
        public int id { get; set; }
        public Nullable<int> userId { get; set; }
        public Nullable<int> itemId { get; set; }
        public string type { get; set; }
        public Nullable<long> count { get; set; }
        public Nullable<System.DateTime> lastDate { get; set; }
    }
}
