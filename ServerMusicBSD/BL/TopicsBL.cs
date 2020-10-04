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
            return Casts.ToTopicsDTO.GetTopics(et.TopicsTBL.ToList());
        }
        public static void updateTopic(int topicId,TopicsTBL updateTopic)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            TopicsTBL topic = et.TopicsTBL.Where(t => t.id == topicId).FirstOrDefault();
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
    }
}
