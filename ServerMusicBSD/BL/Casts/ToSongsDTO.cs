using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
        public static songsDetails GetSongWithSingerName(SongsTBL songs)
        {
            if (songs == null)
                return null;
            MusicOnlineEntities et = new MusicOnlineEntities();
            songsDetails newSong = new songsDetails();
            newSong.id = songs.id;
            newSong.name = songs.name;
            newSong.file_location = songs.file_location;
            newSong.type = songs.type;
            newSong.date = songs.date;
            newSong.singerName = GetSingersToSong(songs);
            newSong.count_like = songs.count_like;
            newSong.count_views = songs.count_views;
            newSong.albumId = songs.albumId;
            newSong.title = songs.title;
            newSong.subtitle = songs.subtitle;
            newSong.image_location = songs.image_location;
            newSong.content = songs.content;
            return newSong;
        }
        public static List<songsDetails> GetSongs(List<SongsTBL> songs)
        {
            if (songs == null)
                return null;
            List<songsDetails> songsDTO = new List<songsDetails>();
            foreach (SongsTBL song in songs)
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
                            Console.WriteLine(begin);
                            //string end = singers.Substring(lastName.Length, singers.Length - lastName.Length);
                            //string end = singers.Substring(, singers.Length);

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
                            if (rellevatArtists[rellevatArtists.Count() - 1].Equals(artistToSong))
                            {
                                singers = singers + " ו";
                            }
                            else
                            {
                                singers = singers + ", ";
                            }
                            singers = singers + artist.name;
                        }
                    }
                }
            }
            return singers;
        }
    }
}
