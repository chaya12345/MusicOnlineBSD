using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class TopicsBL
    {
        public static List<TopicsDTO> GetTopics()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<TopicsTBL> list = et.TopicsTBL.ToList();
            if (list != null)
                return Casts.ToTopicsDTO.GetTopics(list);
            return null;
        }
        public static void UpdateTopic(int topicId, TopicsTBL updateTopic)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            TopicsTBL topic = et.TopicsTBL.Where(t => t != null && t.id == topicId).FirstOrDefault();
            if (topic != null)
            {
                if (updateTopic.title != null)
                    topic.title = updateTopic.title;
                if (updateTopic.subtitle != null)
                    topic.subtitle = updateTopic.subtitle;
                if (updateTopic.img != null)
                    topic.img = updateTopic.img;
                et.SaveChanges();
            }
        }
        public static TopicsDTO GetTopic(string topicTitle)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            TopicsTBL topic = et.TopicsTBL.Where(t => t != null && t.title == topicTitle).FirstOrDefault();
            if (topic == null)
                return null;
            return Casts.ToTopicsDTO.GetTopic(topic);
        }
    }
}
