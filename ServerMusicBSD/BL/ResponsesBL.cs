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
        static MusicOnlineEntities et = new MusicOnlineEntities();
        public static void AddResponse(ResponsesTBL response)
        {
            et.ResponsesTBLs.Add(response);
            et.SaveChanges();
        }
        public static List<ResponsesDTO> GetArticleResponses(int articleId)
        {
           return Casts.ToResponseDTO.GetResponses(et.ResponsesTBLs.Where(r => r.articleId == articleId).ToList());
        }
        public static void DeleteResponse(int responseId)
        {
            ResponsesTBL response = et.ResponsesTBLs.Where(r => r.id == responseId).FirstOrDefault();
            et.ResponsesTBLs.Remove(response);
            et.SaveChanges();
        }
        public static List<ResponsesDTO> GetLastResponses()
        {
            List<ResponsesTBL> list = et.ResponsesTBLs.Where(r => r.date != null).OrderBy(r=>r.date).Distinct().ToList();
            return Casts.ToResponseDTO.GetResponses(list);
        }
        public static List<LastRespons> GetLast5Responses()
        {
          return et.LastResponses.ToList();
        }
    }
}
