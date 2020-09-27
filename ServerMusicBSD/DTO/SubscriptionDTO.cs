using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class SubscriptionDTO
    {
        public int id { get; set; }
        public Nullable<int> userId { get; set; }
        public Nullable<int> singerId { get; set; }
    }
}
