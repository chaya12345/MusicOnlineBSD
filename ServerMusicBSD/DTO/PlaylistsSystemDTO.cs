using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class PlaylistsSystemDTO
    {
        public int id { get; set; }
        public string name { get; set; }
        public string title { get; set; }
        public Nullable<long> count_views { get; set; }
        public string image { get; set; }
    }
}
