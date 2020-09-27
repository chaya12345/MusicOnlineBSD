using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;
using DTO;
using BL;
using System.Web.Http.Cors;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class SubscriptionController : ApiController
    {
        public void PostSubscription([FromBody] SubscriptionTBL subscription)
        {
            SubscriptionBL.AddSubscription(subscription);
        }
        public void DeleteSubscription(int subscriptionId)
        {
            SubscriptionBL.DeleteSubscription(subscriptionId);
        }
        public  List<string> GetMailsOfSingerSubscription(int singerId)
        {
            return SubscriptionBL.GetMailsOfSingerSubscription(singerId);
        }
        public  List<string> GetYourSingersNameSubscription(int userId)
        {
            return SubscriptionBL.GetYourSingersNameSubscription(userId);
        }
    }
}