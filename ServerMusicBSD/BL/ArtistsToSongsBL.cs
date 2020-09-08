using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class ArtistsToSongsBL
    {
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static List<ArtistsToSongsDTO> GetArtistsToSong(int songId)
        {
            return Casts.ToArtistsToSongsDTO.GetArtistsToSongs(et.ArtistsToSongsTBLs.Where(a => a.songId == songId).ToList());

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
        public static List<ArtistsToSongsDTO> GetSongsToArtist(int artistId)
        {
            return Casts.ToArtistsToSongsDTO.GetArtistsToSongs(et.ArtistsToSongsTBLs.Where(a => a.artistId == artistId).ToList());
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
            et.ArtistsToSongsTBLs.Add(artistToSong);
            et.SaveChanges();
        }
    }
}
