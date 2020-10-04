using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using DAL;
using DTO;
using BL;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class TopicsController : ApiController
    {
        public static List<TopicsDTO> GetTopics()
        {
            return TopicsBL.GetTopics();
        }
        public static void updateTopic(int topicId, [FromBody] TopicsTBL updateTopic)
        {
            TopicsBL.updateTopic(topicId, updateTopic);
        }
    }
}