using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class TagsDTO
    {
        public int id { get; set; }
        public string name { get; set; }
        public Nullable<int> tagTypeId { get; set; }
        public Nullable<bool> isShow { get; set; }
    }
}
