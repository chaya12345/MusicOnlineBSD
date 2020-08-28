using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using DAL;
using DTO;

namespace BL
{
    public class ResponsesBL
    {
        static MusicOnlineEntities1 et = new MusicOnlineEntities1();
        public static void AddResponse(ResponsesTBL response)
        {
            et.ResponsesTBL.Add(response);
            et.SaveChanges();
        }
        public static List<ResponsesDTO> GetArticleResponses(int articleId)
        {
           return Casts.ToResponseDTO.GetResponses(et.ResponsesTBL.Where(r => r.articleId == articleId).ToList());
        }
        public static void DeleteResponse(int responseId)
        {
            ResponsesTBL response = et.ResponsesTBL.Where(r => r.id == responseId).FirstOrDefault();
            et.ResponsesTBL.Remove(response);
            et.SaveChanges();
        }
    }
}
