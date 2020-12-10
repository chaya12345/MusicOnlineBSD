using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL
{
    public class SingersToArticlesBL
    {
        public static List<string> GetSingersToArticle(int articleId)
        {
            MusicOnlineEntities et = new MusicOnlineEntities();
            List<SingersToArticlesTBL> singers = et.SingersToArticlesTBL.Where(s => s.articleId == articleId).ToList();
            if (singers == null)
                return null;
            List<string> result = new List<string>();
            foreach (SingersToArticlesTBL item in singers)
            {
                SingersTBL singer = et.SingersTBL.Where(s => s.id == item.singerId).FirstOrDefault();
                if (singer != null)
                    result.Add(singer.name);
            }
            return result;
        }
    }
}
