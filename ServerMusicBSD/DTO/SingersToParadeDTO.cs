using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class SingersToParadeDTO
    {
        public int id { get; set; }
        public Nullable<int> paradeId { get; set; }
        public Nullable<int> singerId { get; set; }
        public Nullable<int> count { get; set; }
    }
}
