using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;
using BL;
using DTO;
using System.Web.Http.Cors;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ParadeController : ApiController
    {
        public List<songsDetails> GetSongsInParade()
        {
            return SongsToParadeBL.GetSongsInParade();
        }
        public void PutVotingToSong(int songId)
        {
            SongsToParadeBL.AddVotingToSong(songId);
        }
        public void PutVotingToSongs([FromBody] SongsTBL[] selectionSongs)
        {
            SongsToParadeBL.AddVotingToSongs(selectionSongs);
        }
        public void PostSongToParade([FromBody]SongsToParadeTBL Parade)
        {
            SongsToParadeBL.AddSongToParade(Parade);
        }
        public void PostSongsToParade([FromBody]List<SongsToParadeTBL> Parades)
        {
            SongsToParadeBL.AddSongsToParade(Parades);
        }
        public void DeleteSongFromParade(int songId)
        {
            SongsToParadeBL.DeleteSongFromParade(songId);
        }
        public List<SingersDTO> GetSingersInParade()
        {
            return SingersToParadeBL.GetSingersInParade();
        }
        public void PutVotingToSinger(int singerId)
        {
            SingersToParadeBL.AddVotingToSinger(singerId);
        }
        public void PostVotingToSingers([FromBody]SingersTBL[] selectoinSingers)
        {
            SingersToParadeBL.AddVotingToSingers(selectoinSingers);
        }
        public void PostSingerToParade([FromBody]SingersToParadeTBL Parade)
        {
            SingersToParadeBL.AddSingerToParade(Parade);
        }
        public void PostSingersToParade([FromBody]List<SingersToParadeTBL> Parades)
        {
            SingersToParadeBL.AddSingersToParade(Parades);
        }
        public void DeleteSingerFromParade(int singerId)
        {
            SingersToParadeBL.DeleteSingerFromParade(singerId);
        }
    }
}