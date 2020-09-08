using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class TagsToAtriclesDTO
    {
        public int id { get; set; }
        public Nullable<int> articleId { get; set; }
        public Nullable<int> tagId { get; set; }
    }
}
