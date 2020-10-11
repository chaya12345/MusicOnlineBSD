using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class UsersBL
    {
        public static void AddUser(UsersTBL user)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            try { 
                et.UsersTBL.Add(user);
                et.SaveChanges();
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
        }
        public static bool signUp(UsersTBL user)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (et.UsersTBL.Where(usr => usr.mail == user.mail).FirstOrDefault() == null/* && mail is valid... */)
            {
                if (user.newsletter == null)
                {
                    user.newsletter = false;
                }
                user.type = true;
                user.repeat = false;
                user.coincidental = false;
                user.saveLike = true;
                try
                {
                    et.UsersTBL.Add(user);
                    et.SaveChanges();
                    return true;
                }
                catch (DbEntityValidationException dbEx)
                {
                    foreach (var validationErrors in dbEx.EntityValidationErrors)
                    {
                        foreach (var validationError in validationErrors.ValidationErrors)
                        {
                            System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                        }
                    }
                }
            }
            return false;
        }
        public static bool AddToNewsletter(string mail)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            if (et.UsersTBL.Where(usr => usr.mail == mail).FirstOrDefault() == null)
            {
                UsersTBL user = new UsersTBL();
                user.mail = mail;
                user.newsletter = true;
                user.type = false;
                AddUser(user);
                et.SaveChanges();
                return true;
            }
            else
            {
                UsersTBL currentUser = et.UsersTBL.Where(usr => usr.mail == mail).FirstOrDefault();
                if (currentUser.newsletter == null || currentUser.newsletter == false)
                {
                    currentUser.newsletter = true;
                    et.SaveChanges();
                    return true;
                }
            }
            return false;
        }
        public static void RemoveFromNewsletter(int userId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            UsersTBL user = et.UsersTBL.Where(u => u.id == userId).FirstOrDefault();
            if (user != null)
            {
                user.newsletter = false;
                et.SaveChanges();
            }
        }
        public static void UpdateUser(int userId, UsersTBL updateUser)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
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

        public static void UpdatePassword(int userId, string password)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            UsersTBL user = et.UsersTBL.Find(userId);
            if (userId == user.id)
            {
                if (password != null)
                {
                    user.password = password;
                    et.SaveChanges();
                }

            }
        }

        public static void UpdateProfil(int userId, UsersTBL updateUser)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            UsersTBL user = et.UsersTBL.Find(userId);
            if (userId == user.id)
            {
                if (updateUser.name != null)
                    user.name = updateUser.name;
                if (updateUser.mail != null)
                    user.mail = updateUser.mail;
                if (updateUser.password != null)
                    user.password = updateUser.password;
                et.SaveChanges();
            }
        }
        public static void UpdateDefinition(int userId, UsersTBL updateUser)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            UsersTBL user = et.UsersTBL.Find(userId);
            if (userId == user.id)
            {
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
            MusicOnlineEntities et = new MusicOnlineEntities();
            return Casts.ToUsersDTO.GetUsers(et.UsersTBL.ToList());
        }
        public static UsersDTO GetUser(string userName, string password)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            UsersTBL user = et.UsersTBL.Where(u =>u.password == password).FirstOrDefault();
            if (user!=null && (user.name == userName || user.mail == userName))
                return Casts.ToUsersDTO.GetUser(user);
            return null;
        }
    }
}
