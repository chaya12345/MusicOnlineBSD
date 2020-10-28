using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
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
            List<TagsTBL> list = et.TagsTBL.ToList();
            if (list != null)
                return Casts.ToTagsDTO.GetTags(list);
            return null;
        }
        public static void AddTag(TagsTBL tag)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try {
                if (tag != null)
                {
                    et.TagsTBL.Add(tag);
                    et.SaveChanges();
                }
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
        }
        public static string GetName(int id)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            string name = "";
            var currentTag = et.TagsTBL.Where(tag =>tag!=null&& tag.id == id).FirstOrDefault();
            if (currentTag != null)
            {
                name = currentTag.name;
            }
            if (name != null)
                return name;
            return null;
        }
    }
}
