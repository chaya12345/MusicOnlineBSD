using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;

namespace BL
{
    public class ArticlesBL
    {
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static List<ArticlesDTO> GetArticles()
        {
            return Casts.ToArticlesDTO.GetArticles(et.ArticlesBTL.ToList());
        }
    }
}
