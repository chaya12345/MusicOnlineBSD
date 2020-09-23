using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Casts
{
    class ToUsersDTO
    {
        public static UsersDTO GetUser(UsersTBL user)
        {
            UsersDTO newUser = new UsersDTO();
            newUser.id = user.id;
            newUser.name = user.name;
            newUser.mail = user.mail;
            newUser.password = user.password;
            newUser.type = user.type;
            newUser.repeat = user.repeat;
            newUser.coincidental = user.coincidental;
            newUser.newsletter = user.newsletter;
            newUser.saveLike = user.saveLike;
            newUser.image_location = user.image_location;
            return newUser;
        }
        public static List<UsersDTO> GetUsers(List<UsersTBL> users)
        {
            List<UsersDTO> listUsers = new List<UsersDTO>();
            foreach (UsersTBL user in users)
            {
                listUsers.Add(GetUser(user));
            }
            return listUsers;
        }
    }
}
