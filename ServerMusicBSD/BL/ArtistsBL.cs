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
        public static bool AddArtistName(ArtistsTBL artistsName)
        {
            if (artistsName == null)
                return false;
            MusicOnlineEntities et = new MusicOnlineEntities();
            try { 
                et.ArtistsTBL.Add(artistsName);
                et.SaveChanges();
                return true;
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
            return false;
        }
        public static List<ArtistsDTO> GetArtistsNames()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ArtistsTBL> list = et.ArtistsTBL.ToList();
            if (list != null)
                return Casts.ToArtistsDTO.GetArtistsNames(list);
            return null;
        }
        public static ArtistsTBL GetArtistByName(string name)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.ArtistsTBL.Where(a => a != null && a.name == name).FirstOrDefault();
        }
        public static void UpdateArtist(ArtistsTBL artist)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (artist == null)
                return;
            ArtistsTBL artists= et.ArtistsTBL.Where(a => a.id == artist.id).FirstOrDefault();
            artists.name = artist.name;
            et.SaveChanges();
        }
        public static bool DeleteArtist(int artistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ArtistsTBL artist = et.ArtistsTBL.Where(a => a.id == artistId).FirstOrDefault();
            if (artist == null)
                return false;
            ArtistsToSongsBL.DeleteArtistFromSongs(artistId);
            et.ArtistsTBL.Remove(artist);
            et.SaveChanges();
            return true;
        }
    }
}
