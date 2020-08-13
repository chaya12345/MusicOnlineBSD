using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ArticlesDTO
    {
        public int id { get; set; }
        public string title { get; set; }
        public string files { get; set; }
        public string content { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<int> tagsId { get; set; }
    }
}
