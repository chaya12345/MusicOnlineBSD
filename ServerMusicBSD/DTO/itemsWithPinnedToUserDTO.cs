using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class itemsWithPinnedToUserDTO
    {
        public Nullable<int> id { get; set; }
        public string title { get; set; }
        public string image { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public string type { get; set; }
        public Nullable<bool> isPinned { get; set; }
    }
}
