using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class TagsForArticlesDTO
    {
        public int id { get; set; }
        public string name { get; set; }
    }
    public class TagsForSongsDTO
    {
        public int id { get; set; }
        public string name { get; set; }
        public Nullable<int> typeId { get; set; }
    }
}
