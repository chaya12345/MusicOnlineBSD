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
        public static List<string> GetTagsNamesToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TagsToSongsDTO> tagsToSong = GetTagsToSong(songId);
            List<string> tags = new List<string>();
            foreach (TagsToSongsDTO tag in tagsToSong)
            {
                tags.Add(et.TagsTBL.Where(t => t.id == tag.tagId && t.isShow==true).FirstOrDefault().name);
            }
            return tags;
        }
        public static List<string> GetTagsIncludeArtistsToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<string> tagsIncludeArtists = new List<string>();
            tagsIncludeArtists.AddRange(GetTagsNamesToSong(songId));
            tagsIncludeArtists.AddRange(ArtistsToSongsBL.GetArtistsNamesToSong(songId));
            return tagsIncludeArtists;
        }
        public static List<TagsToSongsDTO> GetTagsToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToTagsToSongsDTO.GetTagsToSongs(et.TagsToSongsTBLs
                .Where(t => t.songId == songId).ToList());
        }
        public static void AddTagToSong(TagsToSongsTBL tagToSong)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            et.TagsToSongsTBL.Add(tagToSong);
            et.SaveChanges();
        }
    }
}
