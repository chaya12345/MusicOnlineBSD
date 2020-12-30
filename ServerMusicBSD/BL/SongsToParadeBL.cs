using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class SongsToParadeBL
    {
        public static void AddVotingToSong(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsToParadeTBL Parade = et.SongsToParadeTBL.Where(s => s != null && s.songId == songId).FirstOrDefault();
            if (Parade != null)
            {
                if (Parade.count == null)
                    Parade.count = 1;
                else Parade.count++;
                et.SaveChanges();
            }
        }
        public static void AddVotingToSongs(SongsTBL[] selectoinSongs)
        {
            if (selectoinSongs != null)
            {
                foreach (SongsTBL item in selectoinSongs)
                {
                    AddVotingToSong(item.id);
                }
            }
        }
        public static void AddSongToParade(SongsToParadeTBL songToParade)
        {
            if (songToParade != null)
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                songToParade.count = 0;
                et.SongsToParadeTBL.Add(songToParade);
                et.SaveChanges();
            }
        }
        public static void AddSongsToParade(List<SongsToParadeTBL> songsToParade)
        {
            if (songsToParade == null)
                return;
            foreach (SongsToParadeTBL songToParade in songsToParade)
            {
                if (songToParade != null)
                    AddSongToParade(songToParade);
            }
        }
        public static void DeleteSongFromParade(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsToParadeTBL songToParade = et.SongsToParadeTBL.Where(Parade => Parade.songId == songId).FirstOrDefault();
            et.SongsToParadeTBL.Remove(songToParade);
            et.SaveChanges();
        }
        public static List<ItemsToParade_Result> GetSongsInParade()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ItemsToParade_Result> list = ParadeBL.GetItemsToParade();
            List<ItemsToParade_Result> songs = list.Where(s => s.type == "song").ToList();
            if (songs == null)
                return null;
            foreach (ItemsToParade_Result song in songs)
            {
                song.title = Casts.ToSongsDTO.GetSingersToSong(song.id);
            }
            return songs;
        }
    }
}
