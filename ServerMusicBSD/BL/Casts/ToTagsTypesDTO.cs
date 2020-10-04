using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;

namespace BL.Casts
{
    public class ToTagsTypesDTO
    {
        public static TagsTypesDTO GetTagType(TagsTypesTBL tagType)
        {
            TagsTypesDTO newTagType = new TagsTypesDTO();
            newTagType.id = tagType.id;
            newTagType.name = tagType.name;
            return newTagType;
        }
        public static List<TagsTypesDTO> GetTagsTypes(List<TagsTypesTBL> tagsTypes)
        {
            List<TagsTypesDTO> newTagsTypes = new List<TagsTypesDTO>();
            foreach (TagsTypesTBL tagType in tagsTypes)
            {
                newTagsTypes.Add(GetTagType(tagType));
            }
            return newTagsTypes;
        }
    }
}
