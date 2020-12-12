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
            if (user == null)
                return null;
            UsersDTO newUser = new UsersDTO();
            newUser.id = user.id;
            newUser.name = user.name;
            newUser.mail = user.mail;
            newUser.password = user.password;
            newUser.image = user.image;
            return newUser;
        }
        public static List<UsersDTO> GetUsers(List<UsersTBL> users)
        {
            if (users == null)
                return null;
            List<UsersDTO> listUsers = new List<UsersDTO>();
            foreach (UsersTBL user in users)
            {
                UsersDTO addUser = GetUser(user);
                if (addUser != null)
                    listUsers.Add(addUser);
            }
            return listUsers;
        }
    }
}
