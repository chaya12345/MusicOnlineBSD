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
            TagsToSongsDTO newTagsToSong = new TagsToSongsDTO();
            newTagsToSong.id = tagsToSong.id;
            newTagsToSong.songId = tagsToSong.songId;
            newTagsToSong.tagId = tagsToSong.tagId;
            return newTagsToSong;
        }
        public static List<TagsToSongsDTO> GetTagsToSongs(List<TagsToSongsTBL> tagsToSongs)
        {
            List<TagsToSongsDTO> newTagsToSongs = new List<TagsToSongsDTO>();
            foreach (TagsToSongsTBL tagsToSong in tagsToSongs)
            {
                newTagsToSongs.Add(GetTagsToSong(tagsToSong));
            }
            return newTagsToSongs;
        }
    }
}
