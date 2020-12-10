using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class SongsToUserPlaylistsDTO
    {
        public int id { get; set; }
        public Nullable<int> playlistId { get; set; }
        public Nullable<int> songId { get; set; }
    }
}
