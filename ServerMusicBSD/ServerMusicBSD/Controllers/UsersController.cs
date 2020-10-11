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
        public void PutUser(int userId,[FromBody] UsersTBL user)
        {
            UsersBL.UpdateUser(userId, user);
        }
        public void PutUserProfil(int userId,[FromBody] UsersTBL user)
        {
            UsersBL.UpdateProfil(userId, user);
        }
        public void PutUserPassword(int userId, string password)
        {
            UsersBL.UpdatePassword(userId, password);
        }
        public void PutUserDefinition(int userId, [FromBody] UsersTBL user)
        {
            UsersBL.UpdateDefinition(userId, user);
        }
        public UsersDTO GetUser(string userName,string password)
        {
            return UsersBL.GetUser(userName, password);
        }
        public List<UsersDTO> GetUsers()
        {
            return UsersBL.GetUsers();
        }  
    }
}