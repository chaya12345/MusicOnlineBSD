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
        public static List<string> GetTagsNamesToSong(int songId)
        {
            List<TagsToSongsDTO> tagsToSong = GetTagsToSong(songId);
            List<string> tags = new List<string>();
            foreach (TagsToSongsDTO tag in tagsToSong)
            {
                tags.Add(et.TagsTBLs.Where(t => t.id == tag.tagId).FirstOrDefault().name);
            }
            return tags;
        }

        public static List<TagsToSongsDTO> GetTagsToSong(int songId)
        {
            return Casts.ToTagsToSongsDTO.GetTagsToSongs(et.TagsToSongsTBLs.Where(t => t.songId == songId).ToList());
        }
        public static void AddTagToSong(TagsToSongsTBL tagToSong)
        {
            et.TagsToSongsTBLs.Add(tagToSong);
            et.SaveChanges();
        }
    }
}
