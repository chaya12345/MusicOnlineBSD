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
        public void PostSongToParade([FromBody]SongsToParadeTBL parade)
        {
            SongsToParadeBL.AddSongToParade(parade);
        }
        public void PostSongsToParade([FromBody]List<SongsToParadeTBL> parades)
        {
            SongsToParadeBL.AddSongsToParade(parades);
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
        public void PostSingerToParade([FromBody]SingersToParadeTBL parade)
        {
            SingersToParadeBL.AddSingerToParade(parade);
        }
        public void PostSingersToParade([FromBody]List<SingersToParadeTBL> parades)
        {
            SingersToParadeBL.AddSingersToParade(parades);
        }
        public void DeleteSingerFromParade(int singerId)
        {
            SingersToParadeBL.DeleteSingerFromParade(singerId);
        }
    }
}