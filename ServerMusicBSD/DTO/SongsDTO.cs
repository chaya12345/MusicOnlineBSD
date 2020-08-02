using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class SongsDTO
    {
        public int id { get; set; }
        public string name { get; set; }
        public string fileLocation { get; set; }
        public string type { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<long> count { get; set; }
        public Nullable<int> singerId { get; set; }
        public Nullable<int> liked { get; set; }
        public Nullable<int> unliked { get; set; }
        public Nullable<int> tagsId { get; set; }
        public Nullable<int> albumId { get; set; }
    }
}
