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
        public void PostUser([FromBody] UsersTBL newUser)
        {
            UsersBL.AddUser(newUser);
        }
        public void PutUser(int userId,[FromBody] UsersTBL user)
        {

            UsersBL.UpdateUser(userId, user);
        }
        public void PutProfil(int userId,[FromBody] UsersTBL user)
        {
            UsersBL.UpdateProfil(userId, user);
        }
        public void PutPassword(int userId, string password)
        {
            UsersBL.UpdatePassword(userId, password);
        }
        public void PutDefinition(int userId, [FromBody] UsersTBL user)
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