using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToArtistsToSongsDTO
    {
        public static ArtistsToSongsDTO GetArtistsToSong(ArtistsToSongsTBL artist)
        {
            if (artist == null)
                return null;
            ArtistsToSongsDTO newArtist = new ArtistsToSongsDTO();
            newArtist.id = artist.id;
            newArtist.songId = artist.songId;
            newArtist.artistId = artist.artistId;
            newArtist.jobId = artist.jobId;
            return newArtist;
        }
        public static List<ArtistsToSongsDTO> GetArtistsToSongs(List<ArtistsToSongsTBL> artists)
        {
            if (artists == null)
                return null;
            List<ArtistsToSongsDTO> newArtists = new List<ArtistsToSongsDTO>();
            foreach (ArtistsToSongsTBL artist in artists)
            {
                ArtistsToSongsDTO artistsToSongsDTO = GetArtistsToSong(artist);
                if (artistsToSongsDTO != null)
                    newArtists.Add(artistsToSongsDTO);
            }
            return newArtists;
        }
    }
}
