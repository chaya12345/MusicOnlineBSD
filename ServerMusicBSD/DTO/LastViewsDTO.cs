using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class LastViewsDTO
    {
        public int id { get; set; }
        public string title { get; set; }
        public string subtitle { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<System.DateTime> lastViewingDate { get; set; }
        public string type { get; set; }
    }
}
