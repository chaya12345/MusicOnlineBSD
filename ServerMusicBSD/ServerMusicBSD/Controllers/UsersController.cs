using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using DTO;
using DAL;
using System.Web.Http.Cors;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class UsersController : ApiController
    {
        public bool PostRegistrationToWebsite([FromBody] UsersTBL newUser)
        {
            return UsersBL.signUp(newUser);
        }
        public bool PostRegistrationToNewsletter(string mail)
        {
            return UsersBL.AddToNewsletter(mail);
        }
        public void PutRemoveFromNewsletter(int userId)
        {
            UsersBL.RemoveFromNewsletter(userId);
        }
        public void PutUserProfil(int userId,[FromBody] UsersTBL user)
        {
            UsersBL.UpdateProfil(userId, user);
        }
        public void PutUserPassword(int userId, string password)
        {
            UsersBL.UpdatePassword(userId, password);
        }
        public UsersDTO GetUser(string userName,string password)
        {
            return UsersBL.GetUser(userName, password);
        }
        public List<UsersDTO> GetUsers()
        {
            return UsersBL.GetUsers();
        }
        public List<songsDetails> GetFollowUpSongs(int userId)
        {
            return UsersBL.GetFollowUpSongs(userId);
        }
        public List<ArticlesDTO> GetFollowUpArticles(int userId)
        {
            return UsersBL.GetFollowUpArticles(userId);
        }
        public List<SingersDTO> GetSubscriptionToSinger(int userId)
        {
            return UsersBL.GetSubscriptionToSinger(userId);
        }
        public List<userInfo> GetUserInfo(int id)
        {
            return UsersBL.GetUserInfo(id);
        }
        public List<UpdatingsToUserDTO> GetUpdatings(int userId)
        {
            return UpdatingsToUserBL.GetUpdatings(userId);
        }
        public List<PinnedItemsToUserDTO> GetPinnedItemsToUser(int userId)
        {
            return UpdatingsToUserBL.GetPinnedItemsToUser(userId);
        }
        [HttpPost]
        public void AddPinnedItemToUser([FromBody]PinnedItemsToUserTBL pinnedItem)
        {
            UpdatingsToUserBL.AddPinnedItemToUser(pinnedItem);
        }
        public void DeletePinnedItemToUser(int pinnedItemId)
        {
            UpdatingsToUserBL.DeletePinnedItemToUser(pinnedItemId);
        }
    }
}