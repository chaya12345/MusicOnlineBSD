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
    public class SurveyController : ApiController
    {
        public List<songsDetails> GetSongsInSurvey()
        {
            return SongsToSurveyBL.GetSongsInSurvey();
        }
        public void PutVotingToSong(int songId)
        {
            SongsToSurveyBL.AddVotingToSong(songId);
        }
        public void PutVotingToSongs([FromBody] SongsTBL[] selectionSongs)
        {
            SongsToSurveyBL.AddVotingToSongs(selectionSongs);
        }
        public void PostSongToSurvey([FromBody]SongsToSurveyTBL survey)
        {
            SongsToSurveyBL.AddSongToSurvey(survey);
        }
        public void PostSongsToSurvey([FromBody]List<SongsToSurveyTBL> surveys)
        {
            SongsToSurveyBL.AddSongsToSurvey(surveys);
        }
        public void DeleteSongFromSurvey(int songId)
        {
            SongsToSurveyBL.DeleteSongFromSurvey(songId);
        }
        public List<SingersDTO> GetSingersInSurvey()
        {
            return SingersToSurveyBL.GetSingersInSurvey();
        }
        public void PutVotingToSinger(int singerId)
        {
            SingersToSurveyBL.AddVotingToSinger(singerId);
        }
        public void PostVotingToSingers([FromBody]SingersTBL[] selectoinSingers)
        {
            SingersToSurveyBL.AddVotingToSingers(selectoinSingers);
        }
        public void PostSingerToSurvey([FromBody]SingersToSurveyTBL survey)
        {
            SingersToSurveyBL.AddSingerToSurvey(survey);
        }
        public void AddSingersToSurvey([FromBody]List<SingersToSurveyTBL> surveys)
        {
            SingersToSurveyBL.AddSingersToSurvey(surveys);
        }
        public void DeleteSingerFromSurvey(int singerId)
        {
            SingersToSurveyBL.DeleteSingerFromSurvey(singerId);
        }
    }
}