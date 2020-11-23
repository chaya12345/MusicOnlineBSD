using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BL
{
    public class InfoBL
    {
        public static int GetSongsCount()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.SongsTBL.Count();
        }
        public static int GetArticlesCount()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.ArticlesTBL.Count();
        }
        public static int GetPlaylistsCount()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.PlaylistsSystemTBL.Count();
        }
        public static int GetUsersCount()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.UsersTBL.Count();
        }
        public static int GetSubsToNewsletterCount()
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            return et.UsersTBL.Count(user => user != null && user.type == true);
        }
    }
}
