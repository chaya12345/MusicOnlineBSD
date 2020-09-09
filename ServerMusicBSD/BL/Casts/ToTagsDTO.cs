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
            TagsDTO newTag = new TagsDTO();
            newTag.id = tag.id;
            newTag.name = tag.name;
            return newTag;
        }
        public static List<TagsDTO> GetTags(List<TagsTBL> tags)
        {
            List<TagsDTO> newTags = new List<TagsDTO>();
            foreach (TagsTBL t in tags)
            {
                newTags.Add(GetTag(t));
            }
            return newTags;
        }
    }
}
