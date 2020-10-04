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
        public  List<TopicsDTO> GetTopics()
        {
            return TopicsBL.GetTopics();
        }
        public  void PutTopic(int topicId, [FromBody] TopicsTBL updateTopic)
        {
            TopicsBL.UpdateTopic(topicId, updateTopic);
        }
    }
}