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
    public class ArtistsBL
    {
        public static void AddArtistName(ArtistsTBL artistsName)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try { 
            et.ArtistsTBL.Add(artistsName);
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
        public static List<ArtistsDTO> GetArtistsNames()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToArtistsDTO.GetArtistsNames(et.ArtistsTBL.ToList());
        }
    }
}
