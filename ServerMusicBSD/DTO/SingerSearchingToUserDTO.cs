using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class SingerSearchingToUserDTO
    {
        public int id { get; set; }
        public Nullable<int> userId { get; set; }
        public Nullable<long> singerId { get; set; }
        public Nullable<long> count_searching { get; set; }
        public Nullable<System.DateTime> last_date { get; set; }
    }
}
