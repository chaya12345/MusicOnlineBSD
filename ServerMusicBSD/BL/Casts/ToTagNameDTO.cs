using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToTagNameDTO
    {
        public static TagNameDTO GetTagName(TagNameTBL tagName)
        {
            TagNameDTO tag = new TagNameDTO();
            tag.id = tagName.id;
            tag.name = tagName.name;
            return tag;
        }
        public static List<TagNameDTO> GetTagNames(List<TagNameTBL> tagNames)
        {
            List<TagNameDTO> tags = new List<TagNameDTO>();
            foreach (TagNameTBL t in tagNames)
            {
                tags.Add(GetTagName(t));
            }
            return tags;
        }
    }
}
