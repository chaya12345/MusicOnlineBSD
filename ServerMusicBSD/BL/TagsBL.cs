﻿using System;
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
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static List<TagsDTO> GetTags()
        {
            return Casts.ToTagsDTO.GetTags(et.TagsTBLs.ToList());
        }
        public static void AddTag(TagsTBL tag)
        {
            et.TagsTBLs.Add(tag);
            et.SaveChanges();
        }

    }
}
