using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;

namespace BL.Casts
{
    public class ToTopicsDTO
    {
        public static TopicsDTO GetTopic(TopicsTBL topic)
        {
            if (topic == null)
                return null;
            TopicsDTO newTopic = new TopicsDTO();
            newTopic.id = topic.id;
            newTopic.title = topic.title;
            newTopic.subtitle = topic.subtitle;
            newTopic.img = topic.img;
            newTopic.href = topic.href;
            newTopic.icon = topic.icon;
            return newTopic;
        }
        public static List<TopicsDTO> GetTopics(List<TopicsTBL> topics)
        {
            if (topics == null)
                return null;
            List<TopicsDTO> list = new List<TopicsDTO>();
            foreach (TopicsTBL item in topics)
            {
                TopicsDTO topic = GetTopic(item);
                if (topic != null)
                    list.Add(topic);
            }
            return list;
        }
    }
}
