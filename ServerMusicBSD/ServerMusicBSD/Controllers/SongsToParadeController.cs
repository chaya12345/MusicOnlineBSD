using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using DAL;
using BL;
using DTO;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class SongsToParadeController : ApiController
    {
        public List<ItemsToParade_Result> GetSongsInParade()
        {
            return SongsToParadeBL.getSongsInParade();
        }
        public void PutVotingToSong(int songId)
        {
            SongsToParadeBL.AddVotingToSong(songId);
        }
        public void PutVotingToSongs([FromBody] SongsTBL[] selectionSongs)
        {
            SongsToParadeBL.AddVotingToSongs(selectionSongs);
        }
        public void PostSongToParade([FromBody] SongsToParadeTBL parade)
        {
            SongsToParadeBL.AddSongToParade(parade);
        }
        public void PostSongsToParade([FromBody] List<SongsToParadeTBL> parades)
        {
            SongsToParadeBL.AddSongsToParade(parades);
        }
        public void DeleteSongFromParade(int songId)
        {
            SongsToParadeBL.DeleteSongFromParade(songId);
        }
    }
}