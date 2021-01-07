using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class PinnedItemsToUserDTO
    {
        public int id { get; set; }
        public Nullable<int> userId { get; set; }
        public string title { get; set; }
        public string image { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<int> count_like { get; set; }
        public Nullable<int> count_views { get; set; }
    }
}
