using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class FavoriteSongsToUserDTO
    {
        public int id { get; set; }
        public int userId { get; set; }
        public int songId { get; set; }
        public Nullable<System.DateTime> date { get; set; }
    }
}
