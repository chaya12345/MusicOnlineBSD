using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToSongsDTO
    {
        public static SongsDTO GetSong(SongsTBL song)
        {
            if (song != null)
            {
                SongsDTO newSong = new SongsDTO();
                newSong.id = song.id;
                newSong.name = song.name;
                newSong.file_location = song.file_location;
                newSong.type = song.type;
                newSong.date = song.date;
                newSong.singerId = song.singerId;
                newSong.count_like = song.count_like;
                newSong.count_views = song.count_views;
                newSong.albumId = song.albumId;
                newSong.title = song.title;
                newSong.subtitle = song.subtitle;
                newSong.image_location = song.image_location;
                newSong.content = song.content;
                newSong.isPerformance = song.isPerformance;
                return newSong;
            }
            return null;
        }
        public static songsDetails GetSongWithSingerName<T>(T song)
        {
            if (song == null)
                return null;
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsTBL song1 = new SongsTBL();
            if (typeof(T).Name == "getFavoriteSongs")
            {
                MapperConfiguration config = new MapperConfiguration(cfg =>
                    cfg.CreateMap<getFavoriteSongs, SongsTBL>()
                );
                Mapper mapper = new Mapper(config);
                song1 = mapper.Map<SongsTBL>(song);
            }
            else if (typeof(T).Name == "GetNewSong")
            {
                MapperConfiguration config = new MapperConfiguration(cfg =>
                    cfg.CreateMap<GetNewSong, SongsTBL>()
                );
                Mapper mapper = new Mapper(config);
                song1 = mapper.Map<SongsTBL>(song);
            }
            else if (typeof(T).Name == "SongsTBL")
            {
                song1 = song as SongsTBL;
            }
            songsDetails newSong = new songsDetails();
            newSong.id = song1.id;
            newSong.name = song1.name;
            newSong.file_location = song1.file_location;
            newSong.type = song1.type;
            newSong.date = song1.date;
            newSong.singerName = GetSingersToSong(song1);
            newSong.count_like = song1.count_like;
            newSong.count_views = song1.count_views;
            newSong.albumId = song1.albumId;
            newSong.title = song1.title;
            newSong.subtitle = song1.subtitle;
            newSong.image_location = song1.image_location;
            newSong.content = song1.content;
            return newSong;
        }
        public static List<songsDetails> GetSongs<T>(List<T> songs)
        {
            if (songs == null)
                return null;
            List<songsDetails> songsDTO = new List<songsDetails>();
            foreach (T song in songs)
            {
                songsDetails songsDetails = GetSongWithSingerName(song);
                if (songsDetails != null)
                    songsDTO.Add(songsDetails);
            }
            return songsDTO;
        }
        public static string GetSingersToSong(SongsTBL song)
        {
            if (song == null)
                return "";
            MusicOnlineEntities et = new MusicOnlineEntities();
            string singers = "";
            SingersTBL singer = et.SingersTBL.Where(s => s != null && s.id == song.singerId).FirstOrDefault();
            if (singer != null)
            {
                singers = singer.name;
            }
            JobTBL duet = et.JobTBL.Where(job => job.name == "דואט").First();
            if (duet != null)
            {
                List<ArtistsToSongsTBL> rellevatArtists = et.ArtistsToSongsTBL
                    .Where(ats => ats.jobId == duet.id && ats.songId == song.id).ToList();
                foreach (ArtistsToSongsTBL artistToSong in rellevatArtists)
                {
                    ArtistsTBL artist = et.ArtistsTBL.Where(a => a.id == artistToSong.artistId).FirstOrDefault();
                    if (artist != null)
                    {
                        string lastName = artist.name.Substring(artist.name.IndexOf(' ') + 1);
                        if (singers.Contains(lastName) && !singers.Contains(artist.name))
                        {
                            string begin = singers.Substring(0, singers.IndexOf(lastName));
                            string middle = artist.name.Substring(0, artist.name.Length - lastName.Length - 1);
                            if (singers.IndexOf(lastName) + lastName.Length < singers.Length - 1)
                            {
                                singers = begin + "ו" + middle + " " + lastName + singers.Substring(singers.IndexOf(lastName) + lastName.Length, singers.Length);
                            }
                            else
                            {
                                singers = begin + "ו" + middle + " " + lastName;
                            }
                        }
                        else
                        {
                                singers = singers + 
                                    (rellevatArtists[rellevatArtists.Count() - 1].Equals(artistToSong) ? " ו" : ", ");
                            singers = singers + artist.name;
                        }
                    }
                }
            }
            return singers;
        }
    }
}
