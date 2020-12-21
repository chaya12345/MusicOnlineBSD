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
    public class TypesOfTagsBL
    {
        public static List<TypesOfTagsDTO> GetTypesOfTags()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToTypesOfTagsDTO.GetTypesOfTags(et.TypesOfTagsTBL.ToList());
        }
        public static void AddTypesOfTag(TypesOfTagsTBL typesOfTags)
        {
            try
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                if (typesOfTags != null)
                {
                    et.TypesOfTagsTBL.Add(typesOfTags);
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
    }
}
