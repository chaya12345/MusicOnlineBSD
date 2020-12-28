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
        public static List<songsDetails> GetSongsInParade()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            ParadeTBL parade = ParadeBL.GetActiveParade();
            List<songsDetails> result = null;
            if (parade != null) {
                List<SongsToParadeTBL> list = et.SongsToParadeTBL.Where(stp => stp.paradeId == parade.id).ToList();
                List<songsDetails> songs = SongsBL.GetSongsIncludePerformances();
                result = new List<songsDetails>();
                if (list == null || songs == null)
                    return null;
                foreach (SongsToParadeTBL item in list)
                {
                    songsDetails songsDetails = songs.Where(s => s != null && s.id == item.songId).FirstOrDefault();
                    if (songsDetails != null)
                        result.Add(songsDetails);
                }
            }
            return result;
        }
        public static List<SongsToParadeDTO> GetSongsToParade()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToSongsToParadeDTO.GetSTPs(et.SongsToParadeTBL.ToList());
        }
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
        public static void AddSongToParade(SongsToParadeTBL Parade)
        {
            if (Parade != null)
            {
                MusicOnlineEntities et = new MusicOnlineEntities();
                et.SongsToParadeTBL.Add(Parade);
                et.SaveChanges();
            }
        }
        public static void AddSongsToParade(List<SongsToParadeTBL> Parades)
        {
            if (Parades == null)
                return;
            foreach (SongsToParadeTBL item in Parades)
            {
                if (item != null)
                    AddSongToParade(item);
            }
        }
        public static void DeleteSongFromParade(int songId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            SongsToParadeTBL songToParade = et.SongsToParadeTBL.Where(Parade => Parade.songId == songId).FirstOrDefault();
            et.SongsToParadeTBL.Remove(songToParade);
            et.SaveChanges();
        }
        public static List<songsDetails> getSongsInParade()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<ItemsToParade_Result> list = ParadeBL.GetItemsToParade();
            if (list == null)
                return null;
            List<songsDetails> result = new List<songsDetails>();
            foreach (ItemsToParade_Result item in list)
            {
                if (item != null&&item.type=="song")
                {
                    songsDetails songsDetails = et.songsDetails.Where(s => item.name == s.name && s.singerName == item.title).FirstOrDefault();
                    if (songsDetails != null)
                        result.Add(songsDetails);
                }
            }
            return result;
        }
       
    }
}
