using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class SearchingToSingerDTO
    {
        public int id { get; set; }
        public Nullable<long> singerId { get; set; }
        public Nullable<long> count_searching { get; set; }
    }
}
