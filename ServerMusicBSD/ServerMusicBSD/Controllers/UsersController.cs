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
        MusicOnlineEntities et = new MusicOnlineEntities();
        public void Post([FromBody] UsersTBL newUser)
        {
            et.UsersTBL.Add(newUser);
            et.SaveChanges();
        }
        
    }
}