using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using DTO;
using DAL;

namespace ServerMusicBSD.Controllers
{
    public class UsersController : ApiController
    {
        public void Post([FromBody] UsersTBL newUser)
        {
            UsersBL.AddUser(newUser);
        }
        [AcceptVerbs("Put")]
        public void Put(int userId,[FromBody] UsersTBL user)
        {

            UsersBL.UpdateUser(userId, user);
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