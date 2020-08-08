﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class UsersBL
    {
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static void AddUser(UsersTBL user)
        {
            et.UsersTBL.Add(user);
            et.SaveChanges();
        }
        public static void UpdateUser(int userId, UsersTBL updateUser)
        {
            UsersTBL user = et.UsersTBL.Find(userId);
            if (userId == user.id)
            {
                if (updateUser.name != null)
                    user.name = updateUser.name;
                if (updateUser.mail != null)
                    user.mail = updateUser.mail;
                if (updateUser.password != null)
                    user.password = updateUser.password;
                if (updateUser.type != null)
                    user.type = updateUser.type;
                if (updateUser.repeat != null)
                    user.repeat = updateUser.repeat;
                if (updateUser.coincidental != null)
                    user.coincidental = updateUser.coincidental;
                if (updateUser.newsletter != null)
                    user.newsletter = updateUser.newsletter;
                et.SaveChanges();
            }
                
        }

        public static List<UsersDTO> GetUsers()
        {
            return Casts.ToUsersDTO.GetUsers(et.UsersTBL.ToList());
        }
        public static UsersDTO GetUser(string userName, string password)
        {
            UsersTBL user = et.UsersTBL.Where(u => u.name == userName && u.password == password).FirstOrDefault();
            return Casts.ToUsersDTO.GetUser(user);
        }
    }
}