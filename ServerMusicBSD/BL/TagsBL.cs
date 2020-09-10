using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class TagsBL
    {
        public static List<TagsDTO> GetTags()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToTagsDTO.GetTags(et.TagsTBL.ToList());
        }
        public static void AddTag(TagsTBL tag)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            et.TagsTBL.Add(tag);
            et.SaveChanges();
        }

    }
}
