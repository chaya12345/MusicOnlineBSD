using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToTypesOfTagsDTO
    {
        public static TypesOfTagsDTO GetTypesOfTag(TypesOfTagsTBL typesOfTag)
        {
            if (typesOfTag == null)
                return null;
            TypesOfTagsDTO newType = new TypesOfTagsDTO();
            newType.id = typesOfTag.id;
            newType.name = typesOfTag.name;
            return newType;
        }
        public static List<TypesOfTagsDTO> GetTypesOfTags(List<TypesOfTagsTBL> typesOfTags)
        {
            if (typesOfTags == null)
                return null;
            List<TypesOfTagsDTO> list = new List<TypesOfTagsDTO>();
            foreach (TypesOfTagsTBL item in typesOfTags)
            {
                TypesOfTagsDTO type = GetTypesOfTag(item);
                if (type != null)
                    list.Add(type);
            }
            return list;
        }
    }
}
