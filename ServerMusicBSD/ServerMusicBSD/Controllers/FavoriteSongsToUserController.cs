using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DAL;
using BL;
using System.Web.Http.Cors;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class FavoriteSongsToUserController : ApiController
    {
        public List<songsDetails> GetFavoriteSongsToUser(int userId)
        {
            return FavoriteSongsToUserBL.GetFavoriteSongsToUser(userId);
        }
        public void PostFavoriteSongToUser([FromBody]FavoriteSongsToUserTBL favoriteSongsToUser)
        {
            FavoriteSongsToUserBL.AddFavoriteSongToUser(favoriteSongsToUser);
        }
        public void DeleteFavoriteSongFromUser(int userId, int songId)
        {
            FavoriteSongsToUserBL.DeleteFavoriteSongFromUser(userId, songId);
        }
    }
}