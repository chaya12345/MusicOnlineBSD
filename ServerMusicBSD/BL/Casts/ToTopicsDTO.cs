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
            List<TopicsDTO> list = new List<TopicsDTO>();
            foreach (TopicsTBL item in topics)
            {
                list.Add(GetTopic(item));
            }
            return list;
        }
    }
}
