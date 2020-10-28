using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToTagsDTO
    {
        public static TagsDTO GetTag(TagsTBL tag)
        {
            if (tag == null)
                return null;
            TagsDTO newTag = new TagsDTO();
            newTag.id = tag.id;
            newTag.name = tag.name;
            newTag.tagTypeId = tag.tagTypeId;
            newTag.isShow = tag.isShow;
            return newTag;
        }
        public static List<TagsDTO> GetTags(List<TagsTBL> tags)
        {
            if (tags == null)
                return null;
            List<TagsDTO> newTags = new List<TagsDTO>();
            foreach (TagsTBL t in tags)
            {
                TagsDTO tagsDTO = GetTag(t);
                if (tagsDTO != null)
                    newTags.Add(tagsDTO);
            }
            return newTags;
        }
        public static TagsDTO GetTagFromTagsToSong(TagsToSongsDTO tag)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            TagsTBL tagsTBL = et.TagsTBL.Where(t => t != null && t.id == tag.tagId).FirstOrDefault();
            if (tagsTBL != null)
                return GetTag(tagsTBL);
            return null;
        }
        public static List<TagsDTO> GetTagsFromTagsToSong(List<TagsToSongsDTO> tags)
        {
            if (tags == null)
                return null;
            List<TagsDTO> currentTags = new List<TagsDTO>();
            foreach (TagsToSongsDTO tag in tags)
            {
                TagsDTO tagsDTO = GetTagFromTagsToSong(tag);
                if (tagsDTO != null)
                    currentTags.Add(tagsDTO);
            }
            return currentTags;
        }
    }
}
