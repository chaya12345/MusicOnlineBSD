using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ParadeDTO
    {
        public int id { get; set; }
        public string year { get; set; }
        public Nullable<System.DateTime> dateStart { get; set; }
        public Nullable<System.DateTime> dateEnd { get; set; }
        public string image { get; set; }
    }
}
