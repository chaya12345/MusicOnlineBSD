using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class CommitsToArticlesDTO
    {
        public int id { get; set; }
        public Nullable<int> articleId { get; set; }
        public string name { get; set; }
        public string title { get; set; }
        public string content { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<bool> tested { get; set; }
    }
}
