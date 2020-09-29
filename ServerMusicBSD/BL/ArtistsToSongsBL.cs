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
    public class ArtistsToSongsBL
    {
        public static List<ArtistsToSongsDTO> GetArtistsToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToArtistsToSongsDTO.GetArtistsToSongs(et.ArtistsToSongsTBL
                .Where(a => a.songId == songId).ToList());

            //ArtistsDTO- פונקציה שמחזירה את שמות האומנים ז"א  מחזירה 
            //List<ArtistsToSongsTBL> artistsToSong = new List<ArtistsToSongsTBL>();
            //artistsToSong.AddRange(et.ArtistsToSongsTBL.Where(a => a.songId == songId).ToList());
            //List<ArtistsTBL> artists = new List<ArtistsTBL>();
            //foreach (ArtistsToSongsTBL item in artistsToSong)
            //{
            //    if (item.artistId != null)
            //        artists.Add(et.ArtistsTBL.Where(a => a.id == item.artistId).FirstOrDefault());
            //}
            //return Casts.ToArtistsDTO.GetArtistsNames(artists);
        }
        public static List<string> GetArtistsNamesToSong(int songId){
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ArtistsToSongsDTO> artists = GetArtistsToSong(songId);
            List<string> artistsNames = new List<string>();
            foreach (ArtistsToSongsDTO artist in artists)
            {
                string name = et.ArtistsTBL.Where(a => a.id == artist.artistId).FirstOrDefault().name;
                if (!artistsNames.Contains(name))
                    artistsNames.Add(name);
            }
            return artistsNames;
        }
        public static List<ArtistsToSongsDTO> GetSongsToArtist(int artistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToArtistsToSongsDTO.GetArtistsToSongs(et.ArtistsToSongsTBL
                .Where(a => a.artistId == artistId).ToList());
            //List<ArtistsToSongsTBL> artistsToSong = new List<ArtistsToSongsTBL>();
            //artistsToSong.AddRange(et.ArtistsToSongsTBL.Where(a => a.artistId == artistId).ToList());
            //List<SongsTBL> songs = new List<SongsTBL>();
            //foreach (ArtistsToSongsTBL item in artistsToSong)
            //{
            //    if (item.songId != null)
            //        songs.Add(et.SongsTBL.Where(s => s.id == item.songId).FirstOrDefault());
            //}
            //return Casts.ToSongsDTO.GetSongs(songs);
        }
        public static void AddArtistToSong(ArtistsToSongsTBL artistToSong)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try { 
                et.ArtistsToSongsTBL.Add(artistToSong);
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
    }
}
