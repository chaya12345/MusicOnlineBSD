using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ItemsBySingerDTO
    {
        public int id { get; set; }
        public string title { get; set; }
        public string subtitle { get; set; }
        public DateTime date { get; set; }
        public string dateHebrew { get; set; }
        public string image { get; set; }
        public string type { get; set; }
    }
}
