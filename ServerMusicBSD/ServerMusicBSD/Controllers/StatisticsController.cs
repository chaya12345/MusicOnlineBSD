using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using DTO;

namespace ServerMusicBSD.Controllers
{
    public class StatisticsController : ApiController
    {
        [HttpGet]
        public  List<JanerStatistic> GeneralAmountOfViews()
        {
            return StatisticsBL.GeneralAmountOfViews();
        }
        [HttpGet]
        public List<SingersSearchingStatistic> SeveralSearchesForSinger()
        {
            return StatisticsBL.SeveralSearchesForSinger();
        }
        [HttpGet]
        public List<AverageCommitsStatistic> AverageCommitsPerMonth()
        {
            return StatisticsBL.AverageCommitsPerMonth();
        }
    }
}