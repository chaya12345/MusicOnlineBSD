using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class TagsToSongsDTO
    {
        public int id { get; set; }
        public Nullable<int> songId { get; set; }
        public Nullable<int> tagId { get; set; }
    }
}
