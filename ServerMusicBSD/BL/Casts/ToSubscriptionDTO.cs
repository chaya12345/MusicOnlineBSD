using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    public class ToSubscriptionDTO
    {
        public static SubscriptionDTO GetSubscription(SubscriptionTBL subscription)
        {
            if (subscription == null)
                return null;
            SubscriptionDTO newSubscription = new SubscriptionDTO();
            newSubscription.id = subscription.id;
            newSubscription.userId = subscription.userId;
            newSubscription.singerId = subscription.singerId;
            return newSubscription;
        }
        public static List<SubscriptionDTO> GetSubscriptions(List<SubscriptionTBL> subscriptions)
        {
            if (subscriptions == null)
                return null;
            List<SubscriptionDTO> list = new List<SubscriptionDTO>();
            foreach (SubscriptionTBL item in subscriptions)
            {
                SubscriptionDTO subscription = GetSubscription(item);
                if (subscription != null)
                    list.Add(subscription);
            }
            return list;
        }
    }
}
