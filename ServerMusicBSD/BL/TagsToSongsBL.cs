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
        public static List<string> GetTagsToSong(string songName)
        {
            int songId = et.SongsTBL.Where(song => song.name == songName).FirstOrDefault().id;
            List<TagsToSongsDTO> tagsId = Casts.ToTagsToSongsDTO
                .GetTagsToSongs(et.TagsToSongsTBL.Where(tag => tag.songId == songId).ToList());
            List<string> tags = new List<string>();
            foreach (TagsToSongsDTO tag in tagsId)
            {
                tags.Add(et.TagsTBL.Where(t => t.id == tag.tagId).FirstOrDefault().name);
            }
            return tags;
        }
        public static void PostTagToSong(TagsToSongsTBL tagToSong)
        {
            et.TagsToSongsTBL.Add(tagToSong);
            et.SaveChanges();
        }
    }
}
