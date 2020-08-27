using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class TagNameBL
    {
        static MusicOnlineEntities1 et = new MusicOnlineEntities1();
        public static List<TagNameDTO> GetTagNames()
        {
            return Casts.ToTagNameDTO.GetTagNames(et.TagNameTBL.ToList());
        }
        public static void AddTagName(TagNameTBL tag)
        {
            et.TagNameTBL.Add(tag);
            et.SaveChanges();
        }

    }
}
