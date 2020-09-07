using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class TagsToSongsBL
    {
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static List<TagsToSongsDTO> GetTagsToSong(int songId)
        {
           return  Casts.ToTagsToSongsDTO.GetTagsToSongs(et.TagsToSongsTBL.Where(t => t.songId == songId).ToList());
        }
        public static void AddTagToSong(TagsToSongsTBL tagToSong)
        {
            et.TagsToSongsTBL.Add(tagToSong);
            et.SaveChanges();
        }
    }
}
