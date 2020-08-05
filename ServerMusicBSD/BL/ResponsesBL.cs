using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;

namespace BL
{
    public class ResponsesBL
    {
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static void AddResponse([FromBody] int articleId, string name,
            string title, string content, DateTime date)
        {
            et.addResponse(articleId, name, title, content, date);
        }
    }
}
