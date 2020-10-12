using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using DAL;
using DTO;
using BL;

namespace ServerMusicBSD.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class UpdatesController : ApiController
    {
        public  List<UpdatesDTO> GetUpdates()
        {
            return UpdatesBL.GetUpdates();
        }
        public UpdatesDTO GetUpdate(int updateId)
        {
            return UpdatesBL.GetUpdate(updateId);
        }
        public  void PostUpdate([FromBody]UpdatesTBL update)
        {
            UpdatesBL.AddUpdate(update);
        }
        public void DeleteUpdate(int updateId)
        {
            UpdatesBL.DeleteUpdate(updateId);
        }
        public  List<UpdatesDTO> GetInProcessUpdates()
        {
            return UpdatesBL.GetInProcessUpdates();
        }
    }
}