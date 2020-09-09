using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class LastResponsDTO
    {
        public int responsId { get; set; }
        public string name { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public int articleId { get; set; }
        public string title { get; set; }
    }
}
