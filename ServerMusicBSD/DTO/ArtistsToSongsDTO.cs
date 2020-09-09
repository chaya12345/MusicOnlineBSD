using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ArtistsToSongsDTO
    {
        public int id { get; set; }
        public Nullable<int> songId { get; set; }
        public Nullable<int> artistId { get; set; }
        public Nullable<int> jobId { get; set; }
    }
}
