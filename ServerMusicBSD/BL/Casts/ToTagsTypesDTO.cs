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
        public static TagsTypesDTO GetTagType(TypesOfTagsTBL tagType)
        {
            if (tagType == null)
                return null;
            TagsTypesDTO newTagType = new TagsTypesDTO();
            newTagType.id = tagType.id;
            newTagType.name = tagType.name;
            return newTagType;
        }
        public static List<TagsTypesDTO> GetTagsTypes(List<TypesOfTagsTBL> tagsTypes)
        {
            if (tagsTypes == null)
                return null;
            List<TagsTypesDTO> newTagsTypes = new List<TagsTypesDTO>();
            foreach (TypesOfTagsTBL tagType in tagsTypes)
            {
                TagsTypesDTO tagsType= GetTagType(tagType);
                if(tagsType!=null)
                newTagsTypes.Add(tagsType);
            }
            return newTagsTypes;
        }
    }
}
