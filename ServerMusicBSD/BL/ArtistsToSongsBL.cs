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
    public class ArtistWithJob
    {
        public string artistName;
        public string jobName;
    }
    public class ArtistsToSongsBL
    {
        public static List<ArtistsToSongsDTO> GetArtistsToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToArtistsToSongsDTO.GetArtistsToSongs(et.ArtistsToSongsTBL
                .Where(a =>a!=null&& a.songId == songId).ToList());

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
            if (artists == null)
                return null;
            foreach (ArtistsToSongsDTO artist in artists)
            {
                string name = null;
                ArtistsTBL currentArtist = et.ArtistsTBL.Where(a =>a!=null&& a.id == artist.artistId).FirstOrDefault();
                if (currentArtist != null)
                {
                    name = currentArtist.name;
                }
                if (!artistsNames.Contains(name))
                    artistsNames.Add(name);
            }
            if (artistsNames != null)
                return artistsNames;
            return null;
        }
        public static List<ArtistsToSongsDTO> GetSongsToArtist(int artistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ArtistsToSongsTBL> list = et.ArtistsToSongsTBL.Where(a => a != null && a.artistId == artistId).ToList();
            if (list != null)
                return Casts.ToArtistsToSongsDTO.GetArtistsToSongs(list);
            return null;
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
        public static bool AddArtistToSong(ArtistsToSongsTBL artistToSong)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try {
                if (artistToSong != null)
                {
                    et.ArtistsToSongsTBL.Add(artistToSong);
                    et.SaveChanges();
                    return true;
                }
                return false;
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
        public static bool AddArtistsToSong(ArtistWithJob[] artists, int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            bool flag = true;
            if (artists != null) {
                foreach (ArtistWithJob artist in artists)
                {
                    if (artist != null)
                    {
                        ArtistsTBL currentArtist = et.ArtistsTBL
                            .Where(a => a != null && a.name == artist.artistName).FirstOrDefault();
                        JobTBL currentJob = et.JobTBL
                            .Where(j => j.name == artist.jobName).FirstOrDefault();
                        if (currentArtist != null && currentJob != null)
                           if( AddArtistToSong(new ArtistsToSongsTBL { songId = songId,
                                artistId = currentArtist.id, jobId = currentJob.id })==false)
                                flag=false;
                    }
                }
                return flag;
            }
            return false;
        }
        public static void UpdateArtistsToSong(int songId, List<ArtistsToSongsTBL> artists)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ArtistsToSongsTBL> existArtists = et.ArtistsToSongsTBL
                .Where(ats => ats != null && ats.songId == songId).ToList();
            List<ArtistsToSongsTBL> existAndSelected = new List<ArtistsToSongsTBL>();
            if (existArtists != null)
            {
                foreach (ArtistsToSongsTBL item in existArtists)
                {
                    ArtistsToSongsTBL so = artists.Where(a => a != null && a.artistId == item.artistId).FirstOrDefault();
                    if (so == null)
                    {
                        DeleteArtistFromSong(songId, item.artistId);
                    }
                    else
                    {
                        existAndSelected.Add(so);
                    }
                }
            }
            foreach (ArtistsToSongsTBL art in artists)
            {
                if (art != null && existAndSelected.Where(a => a.artistId == art.artistId).FirstOrDefault() == null)
                {
                    AddArtistToSong(new ArtistsToSongsTBL() { artistId = art.artistId, songId = songId });
                }
            }
        }
        public static void DeleteArtistFromSong(int? artistId, int? songId)
        {
            if (artistId != null && songId != null)
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                ArtistsToSongsTBL result = et.ArtistsToSongsTBL
                    .Where(ats => ats.songId == songId && ats.artistId == artistId).FirstOrDefault();
                if (result != null)
                {
                    et.ArtistsToSongsTBL.Remove(result);
                    et.SaveChanges();
                }
            }
        }
        public static void DeleteArtistFromSongs(int artistId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ArtistsToSongsTBL> list = et.ArtistsToSongsTBL.Where(ats => ats.artistId == artistId).ToList();
            if (list != null)
            {
                et.ArtistsToSongsTBL.RemoveRange(list);
                et.SaveChanges();
            }
        }
    }
}
