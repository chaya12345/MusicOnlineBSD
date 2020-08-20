using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ReportsDTO
    {
        public int id { get; set; }
        public string name { get; set; }
        public string mail { get; set; }
        public string phone { get; set; }
        public Nullable<int> songId { get; set; }
        public string message { get; set; }
        public string status { get; set; }
    }
}
