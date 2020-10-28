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
        public List<SongsDTO> GetSongsInSurvey()
        {
            return SurveyBL.GetSongsInSurvey();
        }
        public  void PutVotingToSong(int songId)
        {
            SurveyBL.AddVotingToSong(songId);
        }
        public static void PostSongToSurvey([FromBody]SurveyTBL survey)
        {
            SurveyBL.AddSongToSurvey(survey);
        }
        public static void PostSongsToSurvey([FromBody]List<SurveyTBL> surveys)
        {
            SurveyBL.AddSongsToSurvey(surveys);
        }
    }
}