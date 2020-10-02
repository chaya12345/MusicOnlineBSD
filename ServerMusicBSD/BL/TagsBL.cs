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
            return Casts.ToTagsDTO.GetTags(et.TagsTBL.ToList());
        }
        public static void AddTag(TagsTBL tag)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try { 
            et.TagsTBL.Add(tag);
            et.SaveChanges();
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
            var currentTag = et.TagsTBL.Where(tag => tag.id == id).FirstOrDefault();
            if (currentTag != null)
            {
                name = currentTag.name;
            }
            return name;
        }
    }
}
