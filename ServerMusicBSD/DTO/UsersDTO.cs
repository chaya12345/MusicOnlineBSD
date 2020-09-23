using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class UsersDTO
    {
        public int id { get; set; }
        public string name { get; set; }
        public string mail { get; set; }
        public string password { get; set; }
        public Nullable<bool> type { get; set; }
        public Nullable<bool> repeat { get; set; }
        public Nullable<bool> coincidental { get; set; }
        public Nullable<bool> newsletter { get; set; }
        public Nullable<bool> saveLike { get; set; }
        public string image_location { get; set; }
    }
}
