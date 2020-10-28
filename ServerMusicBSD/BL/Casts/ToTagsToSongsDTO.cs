using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToTagsToSongsDTO
    {
        public static TagsToSongsDTO GetTagsToSong(TagsToSongsTBL tagsToSong)
        {
            if (tagsToSong == null)
                return null;
            TagsToSongsDTO newTagsToSong = new TagsToSongsDTO();
            newTagsToSong.id = tagsToSong.id;
            newTagsToSong.songId = tagsToSong.songId;
            newTagsToSong.tagId = tagsToSong.tagId;
            return newTagsToSong;
        }
        public static List<TagsToSongsDTO> GetTagsToSongs(List<TagsToSongsTBL> tagsToSongs)
        {
            if (tagsToSongs == null)
                return null;
            List<TagsToSongsDTO> newTagsToSongs = new List<TagsToSongsDTO>();
            foreach (TagsToSongsTBL tagsToSong in tagsToSongs)
            {
                TagsToSongsDTO tagsToSong1 = GetTagsToSong(tagsToSong);
                if (tagsToSong1 != null)
                    newTagsToSongs.Add(tagsToSong1);
            }
            return newTagsToSongs;
        }
    }
}
