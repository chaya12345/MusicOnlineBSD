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
            TagsForSongsTBL tag = et.TagsForSongsTBL.Where(t =>t!=null&& t.id == tagId).FirstOrDefault();
            if (tag != null)
            {
                TagsTypesTBL tagsTypesTBL = et.TagsTypesTBL.Where(type => type.id == tag.typeId).FirstOrDefault();
                if(tagsTypesTBL!=null)
                return Casts.ToTagsTypesDTO.GetTagType(tagsTypesTBL);
            }
            return null;
        }
        public static int GetId(string typeName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            TagsTypesTBL currentType = et.TagsTypesTBL.Where(type => type!=null&& type.name == typeName).FirstOrDefault();
            if (currentType != null)
            {
                return currentType.id;
            }
            return -1;
        }
        public static List<TagsForSongsDTO> GetTagByType(List<TagsForSongsDTO> tags, string typeName)
        {
            List<TagsForSongsDTO> matchingTags = new List<TagsForSongsDTO>();
            matchingTags.AddRange(tags.Where(tag => tag!=null&& tag.typeId == GetId(typeName)).ToList());
            return matchingTags;
        }
    }
}
