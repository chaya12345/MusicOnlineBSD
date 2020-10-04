using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class TagsTypesBL
    {
        public static TagsTypesDTO GetTagType(int tagId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            TagsTBL tag = et.TagsTBL.Where(t => t.id == tagId).FirstOrDefault();
            if (tag != null)
            {
                return Casts.ToTagsTypesDTO.GetTagType(et.TagsTypesTBL.Where(type => type.id == tag.tagTypeId).FirstOrDefault());
            }
            return null;
        }
        public static int GetId(string typeName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            TagsTypesTBL currentType = et.TagsTypesTBL.Where(type => type.name == typeName).FirstOrDefault();
            if (currentType != null)
            {
                return currentType.id;
            }
            return -1;
        }
        public static List<TagsDTO> GetTagByType(List<TagsDTO> tags, string typeName)
        {
            List<TagsDTO> matchingTags = new List<TagsDTO>();
            matchingTags.AddRange(tags.Where(tag => tag.tagTypeId == GetId(typeName)).ToList());
            return matchingTags;
        }
    }
}
